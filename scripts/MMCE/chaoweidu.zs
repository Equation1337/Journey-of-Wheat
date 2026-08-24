#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import scripts.libs.Util;

import novaeng.hypernet.HyperNetHelper;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
//设置线程
val workThread = FactoryRecipeThread.createCoreThread("熔铸线程");
val heatThread = FactoryRecipeThread.createCoreThread("加热线程");

MachineModifier.setMaxThreads("chaoweidu", 0);
MachineModifier.addCoreThread("chaoweidu", workThread);
MachineModifier.addCoreThread("chaoweidu", heatThread);

val upgrade as IItemStack[] = [<contenttweaker:dragon_coil>, <contenttweaker:haipozhen_coil>];

MMEvents.onStructureFormed("chaoweidu", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function(){
    val ctrl = event.controller;
    val world = ctrl.world;
    val data = ctrl.customData;
    val map = data.asMap();
    val Pos = ctrl.pos;
    val pos = Pos.createPosByFacing(ctrl.facing, -15, 20, 4);
    var Blocks = world.getBlockState(pos).commandString;
    for Block in upgrade {
        var upgradeAmount as int = ctrl.getBlocksInPattern(Block);
        if (upgradeAmount == 2016) {
            if (Blocks == "<blockstate:contenttweaker:dragon_coil>") {
                map["timeAmount"] = 2;
                ctrl.customData = data;
            }
            if (Blocks == "<blockstate:contenttweaker:haipozhen_coil>") {
                map["timeAmount"] = 4;
            }
        }
        else if (upgradeAmount > 0) {
            map["timeAmount"] = 0;
            ctrl.customData = data;
        }
    }
    });
});

MMEvents.onControllerGUIRender("chaoweidu", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val remainHeat = isNull(map["heatAmount"]) ? 0 : map["heatAmount"].asFloat();

    var info as string[] = [
        "§6§l ---------- §l超维度锻炉显示器 §6----------",
        "§e当前热值：§a" + (300 + remainHeat) + " K"
    ];

    if (remainHeat < 20000) {
        info += "§c警告：温度过低！";
    }
    info += "§6 ---------------------------------------------";

    event.extraInfo = info;
});

//加热
RecipeBuilder.newBuilder("add_fuel" , "chaoweidu", 200, 0, true)
    .addFluidPerTickInput(<liquid:water_8>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (checkMaxHeat(event.controller.customData.asMap())) {
            event.setFailed("炉心温度已达极限！");
        }
    })
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        val thread = event.factoryRecipeThread;
        val activeRecipe = thread.activeRecipe;
        thread.setStatusInfo("正在升温...");
        if (checkMaxHeat(event.controller.customData.asMap())) {
            activeRecipe.tick = activeRecipe.totalTick;
        }
        else {
            activeRecipe.tick = 0;
        }
        addFuel(event.controller, 100);
    })
    .addRecipeTooltip("为锻炉添加 " + 100 + " 点热值。")
    .setParallelized(false)
    .setMaxThreads(1)
    .setThreadName("加热线程")
    .build();

function checkMaxHeat(map as IData[string]) as bool {
    val remainHeat = isNull(map["heatAmount"]) ? 0 : map["heatAmount"].asFloat();
    return remainHeat >= 100000;
}
function addFuel(ctrl as IMachineController, heat as int) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainHeat = isNull(map["heatAmount"]) ? 0 : map["heatAmount"].asFloat();
    map["heatAmount"] = remainHeat + heat;
    ctrl.customData = data;
}
function checkHeatInputAmount(map as IData[string]) as bool {
    val remainHeat = isNull(map["heatAmount"]) ? 0 : map["heatAmount"].asFloat();
    return remainHeat >= 20000;
}
function checkHeatInputAmountR(map as IData[string]) as bool {
    val remainHeat = isNull(map["heatAmount"]) ? 0 : map["heatAmount"].asFloat();
    return remainHeat >= 80000;
}
function doWork(event as FactoryRecipeTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val activeRecipe = event.factoryRecipeThread.activeRecipe;
    val map = data.asMap();
    val remainHeat = isNull(map["heatAmount"]) ? 0 as float : map["heatAmount"].asFloat();

    if (remainHeat >= 1000) {
        map["heatAmount"] = remainHeat - 100;
        ctrl.customData = data;
    } else {
        activeRecipe.tick = activeRecipe.totalTick;
    }
}

RecipeBuilder.newBuilder("chaoweidu_1", "chaoweidu", 1200)
    .addRecipeTooltip("提示：将结构中的线圈全部替换为","觉醒龙/海珀珍线圈","分别可减少50%/75%的工作时间", "需要至少20000热值以工作")
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val tickAmount = isNull(map["timeAmount"]) ? 1 : map["timeAmount"].asInt();
        if (tickAmount == 0) {
            event.setFailed(false, "线圈摆放不合规");
            return;
        }
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val tickAmount = isNull(map["timeAmount"]) ? 1 : map["timeAmount"].asInt();
        val active = ctrl.activeRecipe;
        active.tick = active.totalTick - (active.totalTick / tickAmount);
    })
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val map = event.controller.customData.asMap();
        if (!checkHeatInputAmount(map)) {
            event.setFailed("炉心温度不足以熔铸金属");
            return;
        }
    })
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        doWork(event);
    })
    .addEnergyPerTickOutput(2147483647)
    .addItemInputs([<contenttweaker:dragon_guan>, <draconicevolution:draconium_block> * 4])
    .addItemOutputs([<contenttweaker:ke>, <draconicevolution:draconium_block:1> * 4])
    .setMaxThreads(1)
    .setThreadName("熔铸线程")
    .build();

RecipeBuilder.newBuilder("chaoweidu_2", "chaoweidu", 3000)
    .addRecipeTooltip("提示：此配方仅限海珀珍线圈","需要至少80000热值以工作")
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val tickAmount = isNull(map["timeAmount"]) ? 1 : map["timeAmount"].asInt();
        if (tickAmount == 0) {
            event.setFailed(false, "线圈摆放不合规");
            return;
        }
    })
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val tickAmount = isNull(map["timeAmount"]) ? 1 : map["timeAmount"].asInt();
        if (tickAmount != 4) {
            event.setFailed("线圈等级未达标");
            return;
        }
        if (!checkHeatInputAmountR(map)) {
            event.setFailed("炉心温度不足以熔铸金属");
            return;
        }
    })
    .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
        doWork(event);
    })
    .addEnergyPerTickInput(10000000000)
    .addItemInputs([<advancedrocketry:productingot>, <advancedrocketry:productingot:1>, <advanced_solar_panels:crafting:3>, <aetherworks:item_resource:4>, <astralsorcery:itemcraftingcomponent:1>, <avaritia:resource:1>, <avaritia:resource:6>, <avaritia:resource:4>, <botania:manaresource>, <botania:manaresource:4>, <botania:manaresource:7>, <botania:manaresource:14>, <botanicadds:gaiasteel_ingot>, <calculator:enrichedgoldingot>, <calculator:reinforcedironingot>, <calculator:redstoneingot>, <contenttweaker:mobiwusi_ingot>, <contenttweaker:star_ingot>, <contenttweaker:ingot_electrum_flux>, <contenttweaker:haipozhen_ingot>, <deepmoblearningbm:blood_infused_glitch_ingot>, <deepmoblearning:glitch_infused_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:draconic_ingot>, <embers:ingot_dawnstone>, <enderio:item_alloy_ingot>, <enderio:item_alloy_ingot:1>, <enderio:item_alloy_ingot:2>, <enderio:item_alloy_ingot:3>, <enderio:item_alloy_ingot:4>, <enderio:item_alloy_ingot:5>, <enderio:item_alloy_ingot:6>, <enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:8>, <nuclearcraft:alloy:7>, <enderio:item_alloy_endergy_ingot>, <enderio:item_alloy_endergy_ingot:1>, <enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:3>, <enderio:item_alloy_endergy_ingot:4>, <enderio:item_alloy_endergy_ingot:5>, <enderio:item_alloy_endergy_ingot:6>, <essentialcraft:genitem:5>, <essentialcraft:genitem:50>, <essentialcraft:genitem:10>, <extendedcrafting:material>, <extrautils2:ingredients:17>, <extrautils2:ingredients:12>, <immersiveengineering:metal:8>, <frogcraftrebirth:metal_ingot:1>, <futuremc:netherite_ingot>, <immersiveengineering:material:19>, <immersiveengineering:metal:6>, <immersiveengineering:metal:7>, <immersiveintelligence:material_ingot>, <immersiveintelligence:material_ingot:7>, <industrialforegoing:pink_slime_ingot>, <nuclearcraft:ingot:8>, <ic2:ingot:1>, <threng:material>, <lightningcraft:ingot>, <lightningcraft:ingot:1>, <lightningcraft:ingot:2>, <nuclearcraft:alloy:8>, <modularmachinery:itemmodularium>, <mets:niobium_titanium_ingot>, <nuclearcraft:alloy:1>, <nuclearcraft:alloy:2>, <nuclearcraft:alloy:3>, <nuclearcraft:alloy:4>, <nuclearcraft:alloy:9>, <nuclearcraft:alloy:10>, <nuclearcraft:alloy:11>, <nuclearcraft:alloy:12>, <nuclearcraft:alloy:13>, <nuclearcraft:alloy:15>, <nuclearcraft:alloy:16>, <pneumaticcraft:ingot_iron_compressed>, <projectred-core:resource_item:103>, <projectred-core:resource_item:104>, <projectred-core:resource_item:300>, <psi:material:1>, <psi:material:3>, <psi:material:4>, <qmd:ingot_alloy:6>, <thaumcraft:ingot>, <thaumcraft:ingot:1>, <thaumcraft:ingot:2>, <tp:flint_ingot>, <tp:lapis_ingot>, <tp:reinforced_obsidian_ingot>, <tp:quartz_ingot>, <tp:redstone_ingot>, <qmd:ingot2>, <extendedcrafting:material:48>, <extendedcrafting:material:24>, <extendedcrafting:material:36>, <qmd:ingot2:1>, <qmd:ingot_alloy:2>, <qmd:ingot_alloy>, <ic2:ingot>, <mets:super_iridium_alloy>])
    .addItemOutputs([<extendedcrafting:material:32> * 32])
    .setMaxThreads(1)
    .setThreadName("熔铸线程")
    .build();