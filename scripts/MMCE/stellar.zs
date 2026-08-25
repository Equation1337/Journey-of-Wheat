#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import novaeng.hypernet.HyperNetHelper;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.SmartInterfaceData;

MachineModifier.addSmartInterfaceType("stellar",
    SmartInterfaceType.create("mode", 1)
        .setHeaderInfo("§e人造恒星模式选择")
        .setValueInfo("当前模式：§b%.0f")
        .setJeiTooltip("工作模式：§b%.0f", 1)
        .setFooterInfo("模式1为奇点模式，模式2为块模式")
        .setNotEqualMessage("机器模式不匹配")
);

//设置线程
val createThread = FactoryRecipeThread.createCoreThread("恒星创生装置#0");
val breakThread_1 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#1");
val breakThread_2 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#2");
val breakThread_3 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#3");
val breakThread_4 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#4");
val breakThread_5 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#5");
val breakThread_6 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#6");
val breakThread_7 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#7");
val breakThread_8 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#8");
val breakThread_9 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#9");
val breakThread_10 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#10");
val breakThread_11 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#11");
val breakThread_12 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#12");
val breakThread_13 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#13");
val breakThread_14 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#14");
val breakThread_15 = FactoryRecipeThread.createCoreThread("恒星塌缩装置#15");

MachineModifier.setMaxThreads("stellar", 0);
MachineModifier.addCoreThread("stellar", createThread);
MachineModifier.addCoreThread("stellar", breakThread_1);
MachineModifier.addCoreThread("stellar", breakThread_2);
MachineModifier.addCoreThread("stellar", breakThread_3);
MachineModifier.addCoreThread("stellar", breakThread_4);
MachineModifier.addCoreThread("stellar", breakThread_5);
MachineModifier.addCoreThread("stellar", breakThread_6);
MachineModifier.addCoreThread("stellar", breakThread_7);
MachineModifier.addCoreThread("stellar", breakThread_8);
MachineModifier.addCoreThread("stellar", breakThread_9);
MachineModifier.addCoreThread("stellar", breakThread_10);
MachineModifier.addCoreThread("stellar", breakThread_11);
MachineModifier.addCoreThread("stellar", breakThread_12);
MachineModifier.addCoreThread("stellar", breakThread_13);
MachineModifier.addCoreThread("stellar", breakThread_14);
MachineModifier.addCoreThread("stellar", breakThread_15);
//恒星列表
val createDef_1 as IItemStack[] = [
    <minecraft:iron_block> * 6400,
    <minecraft:gold_block> * 6400,
    <minecraft:lapis_block> * 6400,
    <minecraft:redstone_block> * 6400,
    <minecraft:quartz_block> * 6400,
    <immersiveengineering:storage> * 6400,
    <ic2:resource:9> * 6400,
    <immersiveengineering:storage:2> * 6400,
    <immersiveengineering:storage:3> * 6400,
    <immersiveengineering:storage:4> * 6400,
    <minecraft:diamond_block> * 6400,
    <minecraft:emerald_block> * 6400,
    <contenttweaker:electrum_flux> * 6400,
    <immersiveintelligence:storage> * 6400,
    <libvulpes:metal0:10> * 6400
];
val createDef as IItemStack[] = [
    <minecraft:iron_block> * 64,
    <minecraft:gold_block> * 64,
    <minecraft:lapis_block> * 64,
    <minecraft:redstone_block> * 64,
    <minecraft:quartz_block> * 64,
    <immersiveengineering:storage> * 64,
    <ic2:resource:9> * 64,
    <immersiveengineering:storage:2> * 64,
    <immersiveengineering:storage:3> * 64,
    <immersiveengineering:storage:4> * 64,
    <minecraft:diamond_block> * 64,
    <minecraft:emerald_block> * 64,
    <contenttweaker:electrum_flux> * 64,
    <immersiveintelligence:storage> * 64,
    <libvulpes:metal0:10> * 64
];
val singularity as IItemStack[] = [
    <avaritia:singularity>,
    <avaritia:singularity:1>,
    <avaritia:singularity:2>,
    <avaritia:singularity:3>,
    <avaritia:singularity:4>,
    <avaritia:singularity:5>,
    <avaritia:singularity:6>,
    <avaritia:singularity:7>,
    <avaritia:singularity:8>,
    <avaritia:singularity:9>,
    <avaritia:singularity:10>,
    <avaritia:singularity:11>,
    <avaritia:singularity:12>,
    <avaritia:singularity:13>,
    <avaritia:singularity:14>
];

MMEvents.onControllerGUIRender("stellar", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val stellar_1 = isNull(map["stellar_1"]) ? 0 : map["stellar_1"].asInt();
    val stellar_2 = isNull(map["stellar_2"]) ? 0 : map["stellar_2"].asInt();
    val stellar_3 = isNull(map["stellar_3"]) ? 0 : map["stellar_3"].asInt();
    val stellar_4 = isNull(map["stellar_4"]) ? 0 : map["stellar_4"].asInt();
    val stellar_5 = isNull(map["stellar_5"]) ? 0 : map["stellar_5"].asInt();
    val stellar_6 = isNull(map["stellar_6"]) ? 0 : map["stellar_6"].asInt();
    val stellar_7 = isNull(map["stellar_7"]) ? 0 : map["stellar_7"].asInt();
    val stellar_8 = isNull(map["stellar_8"]) ? 0 : map["stellar_8"].asInt();
    val stellar_9 = isNull(map["stellar_9"]) ? 0 : map["stellar_9"].asInt();
    val stellar_10 = isNull(map["stellar_10"]) ? 0 : map["stellar_10"].asInt();
    val stellar_11 = isNull(map["stellar_11"]) ? 0 : map["stellar_11"].asInt();
    val stellar_12 = isNull(map["stellar_12"]) ? 0 : map["stellar_12"].asInt();
    val stellar_13 = isNull(map["stellar_13"]) ? 0 : map["stellar_13"].asInt();
    val stellar_14 = isNull(map["stellar_14"]) ? 0 : map["stellar_14"].asInt();
    val stellar_15 = isNull(map["stellar_15"]) ? 0 : map["stellar_15"].asInt();
    var info as string[] = [
        "§6§l ---------- §l戴森球构建显示器 §6----------",
    ];

    if (stellar_1 >= 100) {
        info += "§6铁恒星§b已形成";
    }
    else if (stellar_1 < 100) {
        info += "§7铁恒星§b创生进度:§a" + stellar_1 + "/100";
    }

    if (stellar_2 >= 100) {
        info += "§6金恒星§b已形成";
    }
    else if (stellar_2 < 100) {
        info += "§7金恒星§b创生进度:§a" + stellar_2 + "/100";
    }

    if (stellar_3 >= 100) {
        info += "§6青金石恒星§b已形成";
    }
    else if (stellar_3 < 100) {
        info += "§7青金石恒星§b创生进度:§a" + stellar_3 + "/100";
    }

    if (stellar_4 >= 100) {
        info += "§6红石恒星§b已形成";
    }
    else if (stellar_4 < 100) {
        info += "§7红石恒星§b创生进度:§a" + stellar_4 + "/100";
    }

    if (stellar_5 >= 100) {
        info += "§6下界石英恒星§b已形成";
    }
    else if (stellar_5 < 100) {
        info += "§7下界石英恒星§b创生进度:§a" + stellar_5 + "/100";
    }

    if (stellar_6 >= 100) {
        info += "§6铜恒星§b已形成";
    }
    else if (stellar_6 < 100) {
        info += "§7铜恒星§b创生进度:§a" + stellar_6 + "/100";
    }

    if (stellar_7 >= 100) {
        info += "§6锡恒星§b已形成";
    }
    else if (stellar_7 < 100) {
        info += "§7锡恒星§b创生进度:§a" + stellar_7 + "/100";
    }


    if (stellar_8 >= 100) {
        info += "§6铅恒星§b已形成";
    }
    else if (stellar_8 < 100) {
        info += "§7铅恒星§b创生进度:§a" + stellar_8 + "/100";
    }

    if (stellar_9 >= 100) {
        info += "§6银恒星§b已形成";
    }
    else if (stellar_9 < 100) {
        info += "§7银恒星§b创生进度:§a" + stellar_9 + "/100";
    }

    if (stellar_10 >= 100) {
        info += "§6镍恒星§b已形成";
    }
    else if (stellar_10 < 100) {
        info += "§7镍恒星§b创生进度:§a" + stellar_10 + "/100";
    }

    if (stellar_11 >= 100) {
        info += "§6钻石恒星§b已形成";
    }
    else if (stellar_11 < 100) {
        info += "§7钻石恒星§b创生进度:§a" + stellar_11 + "/100";
    }

    if (stellar_12 >= 100) {
        info += "§6绿宝石恒星§b已形成";
    }
    else if (stellar_12 < 100) {
        info += "§7绿宝石恒星§b创生进度:§a" + stellar_12 + "/100";
    }

    if (stellar_13 >= 100) {
        info += "§6红石琥珀金恒星§b已形成";
    }
    else if (stellar_13 < 100) {
        info += "§7红石琥珀金恒星§b创生进度:§a" + stellar_13 + "/100";
    }

    if (stellar_14 >= 100) {
        info += "§6铂恒星§b已形成";
    }
    else if (stellar_14 < 100) {
        info += "§7铂恒星§b创生进度:§a" + stellar_14 + "/100";
    }

    if (stellar_15 >= 100) {
        info += "§6铱恒星§b已形成";
    }
    else if (stellar_15 < 100) {
        info += "§7铱恒星§b创生进度:§a" + stellar_15 + "/100";
    }

    info += "§6 ---------------------------------------------";

    event.extraInfo = info;
});

var recipeAmount = 1;
var recipeAmount_3 = 1;
for i in createDef_1 {
    RecipeBuilder.newBuilder("create_" + recipeAmount, "stellar", 40, recipeAmount, true)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val create = isNull(map["stellar_" + recipeAmount_3]) ? 0 : map["stellar_" + recipeAmount_3].asInt();
            if (create >= 100) {
                event.setFailed("此恒星已构建完毕");
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            val thread = event.factoryRecipeThread;
            thread.setStatusInfo("正在构建恒星...");
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val create = isNull(map["stellar_" + recipeAmount_3]) ? 0 : map["stellar_" + recipeAmount_3].asInt();
            if (create >= 100) {
                return;
            }
        })
        .addItemInput(i)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val create = isNull(map["stellar_" + recipeAmount_3]) ? 0 : map["stellar_" + recipeAmount_3].asInt();
            map["stellar_" + recipeAmount_3] = create + 1;
            ctrl.customData = data;
        })
        .addRecipeTooltip("创生装置，用于构建恒星")
        .setParallelized(false)
        .setMaxThreads(1)
        .setThreadName("恒星创生装置#0")
        .build();
    recipeAmount_3 += 1;
    recipeAmount += 1;
}
var recipeAmount_2 = 1;
for i in singularity {
    RecipeBuilder.newBuilder("break_" + recipeAmount, "stellar", 1200, recipeAmount, true)
        .addSmartInterfaceDataInput("mode", 1)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val create = isNull(map["stellar_" + recipeAmount_2]) ? 0 : map["stellar_" + recipeAmount_2].asInt();
            if (create < 100) {
                event.setFailed("此恒星尚未构建");
                return;
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            val thread = event.factoryRecipeThread;
            thread.setStatusInfo("正在塌缩恒星...");
        })
        .addItemOutput(i * 8)
        .addEnergyPerTickOutput(2147483647)
        .addRecipeTooltip("塌缩恒星,用于生产奇点")
        .setParallelized(false)
        .setMaxThreads(1)
        .setThreadName("恒星塌缩装置#" + recipeAmount_2)
        .build();
    recipeAmount_2 += 1;
    recipeAmount += 1;
}
var recipeAmount_1 = 1;
for i in createDef {
    RecipeBuilder.newBuilder("break_" + recipeAmount, "stellar", 1, recipeAmount, true)
        .addSmartInterfaceDataInput("mode", 2)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val create = isNull(map["stellar_" + recipeAmount_1]) ? 0 : map["stellar_" + recipeAmount_1].asInt();
            if (create < 100) {
                event.setFailed("此恒星尚未构建");
                return;
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            val thread = event.factoryRecipeThread;
            thread.setStatusInfo("正在塌缩恒星...");
        })
        .addItemOutput(i)
        .addEnergyPerTickOutput(2147483647)
        .addRecipeTooltip("塌缩恒星,用于生产块")
        .setParallelized(false)
        .setMaxThreads(1)
        .setThreadName("恒星塌缩装置#" + recipeAmount_1)
        .build();
    recipeAmount += 1;
    recipeAmount_1 += 1;
}