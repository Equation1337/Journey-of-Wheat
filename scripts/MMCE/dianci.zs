#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import crafttweaker.util.Math;

import novaeng.hypernet.HyperNetHelper;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.SmartInterfaceData;

MachineModifier.addSmartInterfaceType("dianci",
    SmartInterfaceType.create("mode", 1)
        .setHeaderInfo("§e集群模式选择")
        .setValueInfo("当前模式：§b%.0f")
        .setJeiTooltip("工作模式：§b%.0f", 1)
        .setFooterInfo("模式1为发电模式，模式2为升级模式")
        .setNotEqualMessage("机器模式不匹配")
);

val energyThread = FactoryRecipeThread.createCoreThread("电磁转化装置");
val itemThread = FactoryRecipeThread.createCoreThread("量子约束装置");

MachineModifier.setMaxThreads("dianci", 0);
MachineModifier.addCoreThread("dianci", energyThread);
MachineModifier.addCoreThread("dianci", itemThread);

MMEvents.onControllerGUIRender("dianci", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val remainDici = isNull(map["diciAmount"]) ? 0 : map["diciAmount"].asInt();
    val remainJizuo = isNull(map["jizuoAmount"]) ? 0 : map["jizuoAmount"].asInt();
    val remainTianxian = isNull(map["tianxianAmount"]) ? 0 : map["tianxianAmount"].asInt();
    val i = 64;
    var e = 0;
    var j = 0;
    var e_1 = 0;
    var j_1 = 0;
    if(remainTianxian >= remainDici) {
        j = remainTianxian - remainDici;
        e = i;
    }
    else {
        j = 0;
        e = i - (remainDici - remainTianxian);
    }

    if(remainTianxian >= remainJizuo) {
        j_1 = remainTianxian - remainJizuo;
        e_1 = i;
    }
    else {
        j_1 = 0;
        e_1 = i - (remainJizuo - remainTianxian);
    }

    var info as string[] = [
        "§6§l ---------- §b地磁发电机量子空间 §6----------",
        "§b地磁发电机数量：§a" + remainDici + "§a台",
        "§b地磁发电机基座数量：§a" + remainJizuo + "§a块",
        "§b量子约束立场能量：§a" + e + "§c(§6+" + j + "§c) §aF",
        "§b量子阈限空间：§a" + e_1 + "§c(§6+" + j_1 + "§c) §aBite",
        "§6 ---------------------------------------------"
    ];

    event.extraInfo = info;
});

MMEvents.onMachinePostTick("dianci", function(event as MachineTickEvent) {
    val ctrl= event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val remainDici = isNull(map["diciAmount"]) ? 0 : map["diciAmount"].asInt();
    val remainJizuo = isNull(map["jizuoAmount"]) ? 0 : map["jizuoAmount"].asInt();
    var Machine = min(remainDici, remainJizuo);
    ctrl.addModifier("energy_output", RecipeModifierBuilder.create("modularmachinery:energy", "output", Machine * 1000000, 0, false).build());
});

RecipeBuilder.newBuilder("add_dici", "dianci", 1200, 999, true)
    .addItemInput(<mets:te:21>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (checkMaxDici(event.controller.customData.asMap())) {
            event.setFailed("量子约束立场能量已达上限！");
        }
    })
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        val thread = event.factoryRecipeThread;
        thread.setStatusInfo("正在约束地磁发电机...");
        if (checkMaxDici(event.controller.customData.asMap())) {
            return;
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        addDici(event.controller);
    })
    .addRecipeTooltip("为量子集群添加 1 台地磁发电机, 工作模式 : any")
    .setMaxThreads(1)
    .setThreadName("量子约束装置")
    .build();

RecipeBuilder.newBuilder("add_jizuo", "dianci", 1200, 998, true)
    .addItemInput(<mets:geomagnetic_pedestal>)
    .addSmartInterfaceDataInput("mode", 2)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (checkMaxJizuo(event.controller.customData.asMap())) {
            event.setFailed("量子阈限空间已达上限！");
        }
        val ctrl = event.controller;
        val smart = ctrl.getSmartInterfaceData("mode");
        val mode = isNull(smart) ? 1 as float : smart.value;
        if (mode != 2) {
            event.setFailed("工作模式不匹配！");
            return;
        }
    })
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        val thread = event.factoryRecipeThread;
        thread.setStatusInfo("正在构建地磁发电机基座...");
        if (checkMaxJizuo(event.controller.customData.asMap())) {
            return;
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        addJizuo(event.controller);
    })
    .addRecipeTooltip("为量子集群添加 1 块地磁发电机基座, 工作模式 : 2")
    .setMaxThreads(1)
    .setThreadName("量子约束装置")
    .build();

RecipeBuilder.newBuilder("add_tianxian", "dianci", 1200, 997, true)
    .addItemInput(<mets:geomagnetic_antenna> * 3)
    .addSmartInterfaceDataInput("mode", 2)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (checkMaxTianxian(event.controller.customData.asMap())) {
            event.setFailed("量子空间无法继续扩充！");
        }
        val ctrl = event.controller;
        val smart = ctrl.getSmartInterfaceData("mode");
        val mode = isNull(smart) ? 1 as float : smart.value;
        if (mode != 2) {
            event.setFailed("工作模式不匹配！");
            return;
        }
    })
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        val thread = event.factoryRecipeThread;
        thread.setStatusInfo("正在构建扩充量子空间...");
        if (checkMaxTianxian(event.controller.customData.asMap())) {
            return;
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        addTianxian(event.controller);
    })
    .addRecipeTooltip("为量子集群添加 3 根天线, 每3根天线扩充一次空间, 工作模式 : 2")
    .setMaxThreads(1)
    .setThreadName("量子约束装置")
    .build();

function checkMaxDici(map as IData[string]) as bool {
    val remainTianxian = isNull(map["tianxianAmount"]) ? 0 : map["tianxianAmount"].asInt();
    val remainDici = isNull(map["diciAmount"]) ? 0 : map["diciAmount"].asInt();
    return remainDici >= remainTianxian + 64;
}

function checkMaxJizuo(map as IData[string]) as bool {
    val remainTianxian = isNull(map["tianxianAmount"]) ? 0 : map["tianxianAmount"].asInt();
    val remainJizuo = isNull(map["jizuoAmount"]) ? 0 : map["jizuoAmount"].asInt();
    return remainJizuo >= remainTianxian + 64;
}

function checkMaxTianxian(map as IData[string]) as bool {
    val remainTianxian = isNull(map["tianxianAmount"]) ? 0 : map["tianxianAmount"].asInt();
    return remainTianxian >= 64;
}

function checkDiciInputAmount(map as IData[string]) as bool {
    val remainDici = isNull(map["diciAmount"]) ? 0 : map["diciAmount"].asInt();
    return remainDici >= 1;
}

function addDici(ctrl as IMachineController) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainDici = isNull(map["diciAmount"]) ? 0 : map["diciAmount"].asInt();
    map["diciAmount"] = remainDici + 1;
    ctrl.customData = data;
}

function addJizuo(ctrl as IMachineController) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainJizuo = isNull(map["jizuoAmount"]) ? 0 : map["jizuoAmount"].asInt();
    map["jizuoAmount"] = remainJizuo + 1;
    ctrl.customData = data;
}

function addTianxian(ctrl as IMachineController) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainTianxian = isNull(map["tianxianAmount"]) ? 0 : map["tianxianAmount"].asInt();
    map["tianxianAmount"] = remainTianxian + 1;
    ctrl.customData = data;
}

function registerRecipe(Name as string,Energy as long,HighMin as int, HighMax as int) {
    RecipeBuilder.newBuilder(Name, "dianci", 72000)
        .setAltitude(HighMin, HighMax)
        .addEnergyPerTickOutput(Energy)
        .addSmartInterfaceDataInput("mode", 1)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val smart = ctrl.getSmartInterfaceData("mode");
            val mode = isNull(smart) ? 1 as float : smart.value;
            if (mode != 1) {
                event.setFailed("工作模式不匹配！");
                return;
            }
        })
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val remainDici = isNull(map["diciAmount"]) ? 0 : map["diciAmount"].asInt();
            val remainJizuo = isNull(map["jizuoAmount"]) ? 0 : map["jizuoAmount"].asInt();
            var Machine = min(remainDici, remainJizuo);
            val world = ctrl.world;
            var roll = world.getRandom().nextInt(1,3);
            var roll_1 = world.getRandom().nextInt(1,2);
            if (Machine >= 3) {
                map["diciAmount"] = remainDici - roll;
                ctrl.customData = data;
            }
            else if (Machine == 2) {
                map["diciAmount"] = remainDici - roll_1;
                ctrl.customData = data;
            }
            else if (Machine == 1) {
                map["diciAmount"] = remainDici - 1;
                ctrl.customData = data;
            }
        })
        .addRecipeTooltip("每输入一个电磁发电机提升1M发电","每次工作完成后概率损毁1-3台地磁发电机","地磁发电机提升发电受地磁发电机基座影响","每一台基座供应一台地磁发电机","每3个地磁发电机天线可以增加地磁发电机和基座的上限","工作模式 : 1")
        .setMaxThreads(1)
        .setThreadName("电磁转化装置")
        .build();
}

registerRecipe("fadian_1", 80000000, 0, 32);
registerRecipe("fadian_2", 40000000, 33, 64);
registerRecipe("fadian_3", 20000000, 65, 128);
registerRecipe("fadian_4", 40000000, 129, 192);
registerRecipe("fadian_5", 80000000, 193, 256);