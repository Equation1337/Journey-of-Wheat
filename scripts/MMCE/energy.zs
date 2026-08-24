#priority 50
#loader crafttweaker reloadable

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import native.java.math.BigInteger;
import mods.modularmachinery.MachineStructureFormedEvent;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineUpgradeBuilder;

val upgrade as IItemStack[]  = [
    <enderio:block_alloy_endergy:3>,
    <avaritia:block_resource:1>       ,
    <draconicevolution:draconic_block>
];
val upgrade_1 as string[]= [
    "<blockstate:enderio:block_alloy_endergy:variant=STELLAR_ALLOY>" ,
    "<blockstate:avaritia:block_resource:type=INFINITY>"      ,
    "<blockstate:draconicevolution:draconic_block>"
];
MMEvents.onStructureFormed("energy", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function(){
    val ctrl = event.controller;
    val world = ctrl.world;
    val data = ctrl.customData;
    val map = data.asMap();
    val Pos = IBlockPos.create(ctrl.pos.x,ctrl.pos.y + 14,ctrl.pos.z);
    val pos = IBlockPos.create(ctrl.pos.x,ctrl.pos.y + 20,ctrl.pos.z);
    var Blocks = world.getBlockState(Pos).commandString;
    if (!world.remote) {
        world.setBlockState(<blockstate:draconicevolution:energy_storage_core>,{BCManagedData: {active: 1 as byte,tier: 8 as byte,coreValid: 1 as byte,stabilizersOK: 1 as byte,structureValid: 1 as byte,}},pos);
    }
    for Block in upgrade {
        var upgradeAmount as int = ctrl.getBlocksInPattern(Block);
        if (upgradeAmount == 386) {
            if (Blocks == upgrade_1[0]) {
                map["timeAmount"] = 10;
                ctrl.customData = data;
            }
            if (Blocks == upgrade_1[1]) {
                map["timeAmount"] = 40;
                ctrl.customData = data;
            }
            if (Blocks == upgrade_1[2]) {
                map["timeAmount"] = 80;
                ctrl.customData = data;
            }
        }
        else if (upgradeAmount > 0) {
            map["timeAmount"] = 0;
            ctrl.customData = data;
        }
    }
    });
});

//最小传输速度，按倍计。
val minSpeed = 0.01 as float;
//最大传输速度，按倍计。
val maxSpeed = 50000;
//基础输入输出速度。能量输入输出速度计算方法为：defaultTransferAmount * speed，其中 speed 可由玩家控制。
val defaultTransferAmount = 100000000;
//能量核心内部最大储存能量值，为 long 最大值。
//long 最大值：9223372036854775807L = 0x7fffffffffffffff
//val maxStoreSize = 0x7fffffffffffffff as long;

# 智能数据接口数据类型定义
MachineModifier.addSmartInterfaceType("energy",
    SmartInterfaceType.create("speed", 1)
        .setHeaderInfo("能量输入输出速度设置")
        .setValueInfo("速度：§e%.2f 倍")
        .setFooterInfo(
            "例：0.1 倍即为 " + formatNumber((defaultTransferAmount as float * 0.1) as long) + "RF，10 倍即为 " + formatNumber(defaultTransferAmount * 10) + "RF"
        )
        .setJeiTooltip("速度范围：最低 §e%.2f 倍§f，最高 §e%.0f 倍", 2)
        .setNotEqualMessage("输入输出速度过载或过低！")
);

# 能量核心不需要额外的线程。
MachineModifier.setMaxThreads("energy", 0);

# 能量输入线程
val inputThreadName = "大型核心能量塔";
val inputThread = FactoryRecipeThread.createCoreThread(inputThreadName);
MachineModifier.addCoreThread("energy", inputThread);

# 能量输出线程
val outputThreadName = "大型能量核心喷口";
val outputThread = FactoryRecipeThread.createCoreThread(outputThreadName);
MachineModifier.addCoreThread("energy", outputThread);

# 写入智能数据接口信息
MMEvents.onMachinePostTick("energy", function(event as MachineTickEvent) {
    writeSmartInterfaceDataToCustomData(event, minSpeed, maxSpeed);
});

# 交互数值写入
MMEvents.onMachinePostTick("energy", function(event as MachineTickEvent) {
    val ctrl = event.controller;
    val world = ctrl.world;
    if (world.time % 1200 == 0){
        val data = ctrl.customData;
        val map = data.asMap();
        val dData = D(data);
        val newtime = dData.getString("newtime",0);
        val energyStored = dData.getString("energyStored", 0);
        map["oldtime"] = newtime;
        map["newtime"] = energyStored;
        ctrl.customData = data;
    }
});

# 添加控制器 GUI 信息
MMEvents.onControllerGUIRender("energy", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val Speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
    val energyStored = isNull(map["energyStored"]) ? "0" : map["energyStored"].asString();
    val upgrade = isNull(map["timeAmount"]) ? 1 as float : map["timeAmount"].asFloat();
    var speed = Speed * upgrade;

    val info as string[] = [
        "§6----------- §c能量核心总控 §6-----------",
                                                                // 一个非常暴力的小数点去除方式。
        "§b能量储存：§e" + formatNumber(energyStored) + " RF"/* §b(" + ((((energyStored as double / maxStoreSize as double) * 100000) as int) as double / 1000) as double + "%)" */,
        "§b输入输出值：§e" + formatNumber((speed * defaultTransferAmount) as long) + " RF/t",
        "§b一分钟内平均交互速度：§e" + change(data) + " RF/t",
        "§6-----------------------------------",
    ];

    event.extraInfo = info;
});

# 输出配方
RecipeBuilder.newBuilder("extract", "energy", 1, 1, true)
    .addEnergyPerTickOutput(defaultTransferAmount)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
        if (!canExtract(map, speed, defaultTransferAmount)) {
            event.setFailed("内部能量储量不足！");
            return;
        }
        ctrl.addModifier("extract", RecipeModifierBuilder.create("modularmachinery:energy", "output", speed, 1, false).build());
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val thread = event.factoryRecipeThread;
        val data = ctrl.customData;
        val map = data.asMap();
        val speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
        extractEnergy(ctrl, data, map, speed, defaultTransferAmount);
    })
    .setParallelized(false)
    .addRecipeTooltip("由大型能量核心喷口运行。", "在智能数据接口处修改速度。", "将外层方块替换为恒星核心块/无尽块/觉醒龙块", "可分别提升基础输入/输出速率10/40/80倍")
    .addSmartInterfaceDataInput("speed", minSpeed, maxSpeed)
    .setThreadName(outputThreadName)
    .build();

# 输入配方
RecipeBuilder.newBuilder("receive", "energy", 1, 2, true)
    .addEnergyPerTickInput(defaultTransferAmount)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
        /*if (!canReceive(map, speed, maxStoreSize, defaultTransferAmount)) {
            event.setFailed("内部能量存储已达到极限范围！");
            return;
        }*/
        ctrl.addModifier("receive", RecipeModifierBuilder.create("modularmachinery:energy", "input", speed, 1, false).build());
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val thread = event.factoryRecipeThread;
        val data = ctrl.customData;
        val map = data.asMap();
        val speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
        receiveEnergy(ctrl, data, map, speed, defaultTransferAmount);
    })
    .setParallelized(false)
    .addRecipeTooltip("由大型核心能量能量塔运行。", "在智能数据接口处修改速度。", "将外层方块替换为恒星核心块/无尽块/觉醒龙块", "可分别提升基础输入/输出速率10/40/80倍")
    .addSmartInterfaceDataInput("speed", minSpeed, maxSpeed)
    .setThreadName(inputThreadName)
    .build();

/**
 * 向控制器添加或覆盖能量输入修改器。
 */
function addReceiveModifier(thread as FactoryRecipeThread, speed as float) {
    thread.addModifier("receive", RecipeModifierBuilder.create("modularmachinery:energy", "input", speed, 1, false).build());
}

/**
 * 向控制器添加或覆盖能量输出修改器。
 */
function addExtractModifier(thread as FactoryRecipeThread, speed as float) {
    thread.addModifier("extract", RecipeModifierBuilder.create("modularmachinery:energy", "output", speed, 1, false).build());
}

/**
 * 将智能数据接口的数据写入到 customData 中，方便客户端和配方读取。
 */
function writeSmartInterfaceDataToCustomData(event as MachineTickEvent, minSpeed as float, maxSpeed as float) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val nullable = ctrl.getSmartInterfaceData("speed");
    var Speed = isNull(nullable) ? 1 as float : nullable.value;
    val upgrade = isNull(map["timeAmount"]) ? 1 as float : map["timeAmount"].asFloat();
    var speed = Speed * upgrade;

    //检查数据正确性
    if (speed < minSpeed * upgrade || speed > maxSpeed * upgrade) {
        nullable.value = 1;
    }

    map["speed"] = speed;
    ctrl.customData = data;
}

/**
 * 能否存储能量。

function canReceive(map as IData[string], speed as float, maxStoreSize as long, defaultTransferAmount as long) as bool {
    val energyStored = isNull(map["energyStored"]) ? "0" : map["energyStored"].asString();
    if (maxStoreSize - energyStored < speed * defaultTransferAmount) {
        return false;
    }
    return true;
}
 */
/**
 * 能否提取能量。
 */
function canExtract(map as IData[string], speed as float, defaultTransferAmount as long) as bool {
    val energyStored = isNull(map["energyStored"]) ? "0" : map["energyStored"].asString();
    val sz as string = "" + ((speed * defaultTransferAmount) as long);

    if (BigInteger(energyStored).compareTo(BigInteger(sz)) < 0) {
        return false;
    }
    return true;
}

/**
 * 将能量存储进控制器内部。
 */
function receiveEnergy(ctrl as IMachineController, data as IData, map as IData[string], speed as float, defaultTransferAmount as long) {
    val energyStored = isNull(map["energyStored"]) ? "0" : map["energyStored"].asString();
    val sz as string = "" + ((speed * defaultTransferAmount) as long);

    map["energyStored"] = BigInteger(energyStored).add(BigInteger(sz)).toString();
    ctrl.customData = data;
}

/**
 * 提取控制器内部能量至能量输出仓。
 */
function extractEnergy(ctrl as IMachineController, data as IData, map as IData[string], speed as float, defaultTransferAmount as long) {
    val energyStored = isNull(map["energyStored"]) ? "0" : map["energyStored"].asString();
    val sz as string = "" + ((speed * defaultTransferAmount) as long);

    map["energyStored"] = BigInteger(energyStored).subtract(BigInteger(sz)).toString();
    ctrl.customData = data;
}

/**
 * 格式化数值。
 * 例如 10000 = 10K, 100000000 = 100M。
*/
function formatNumber(value as string) as string {
    var big as long = Big(BigInteger(value).abs()).asLong();
    var zf = "";
    if (value.startsWith("-")){
        zf += "-";
    }
    if (big < 1000) {
        return zf + value;
    } else if (big < 1000000) {
        return zf + (big / 1000) + "K";
    } else if (big < 1000000000) {
        return zf + ((big / 1000) as float / 1000) + "M";
    } else if (big < 1000000000000) {
        return zf + ((big / 1000000) as float / 1000) + "G";
    } else if (big < 1000000000000000) {
        return zf + ((big / 1000000000) as float / 1000) + "T";
    } else if (big < 1000000000000000000) {
        return zf + ((big / 1000000000000) as float / 1000) + "P";
    } else if (big != (9223372036854775807 as long)){
        return zf + ((big / 1000000000000000) as float / 1000) + "E";
    }  else {
        val cfs = value.length() - 1;
        val cft = (1.00f * BigInteger(value.substring(0,3)).intValue()) / 100;

        return zf + cft + " * 10 ^ " + cfs;
    } 
} 
/*
 * 计算交互速度
 */
function change(data as IData) as string{
    val dData = D(data);
    val oldtime = dData.getString("oldtime",0);
    val newtime = dData.getString("newtime",0);
    val newbig = BigInteger(newtime);
    val oldbig = BigInteger(oldtime);
    val changel = Big(newbig.subtract(oldbig)).asLong() / 1200;
    return formatNumber(changel);
}