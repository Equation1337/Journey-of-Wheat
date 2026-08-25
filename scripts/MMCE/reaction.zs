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
//最大并行
MachineModifier.setMaxParallelism("reaction", 4);
//设置线程
val reactThread = FactoryRecipeThread.createCoreThread("反应线程");
val coolThread = FactoryRecipeThread.createCoreThread("冷却线程");
val maintainerThread = FactoryRecipeThread.createCoreThread("维护线程");

MachineModifier.setMaxThreads("reaction", 0);
MachineModifier.addCoreThread("reaction", reactThread);
MachineModifier.addCoreThread("reaction", coolThread);
MachineModifier.addCoreThread("reaction", maintainerThread);
//冷却剂列表
val coolantDef as int[ILiquidStack]$orderly = {
    <liquid:water> * 50               : 320,
    <liquid:ic2coolant> * 50          : 2000,
    <liquid:cryotheum> * 50           : 8000
};
//维护器列表
val maintainerDef as int[IItemStack]$orderly = {
    <pneumaticcraft:printed_circuit_board> * 4      : 5,
    <immersiveintelligence:material:7>              : 10,
    <immersiveintelligence:material:12>             : 25,
    <mets:field_generator>                          : 100
};
//控制器gui
MMEvents.onControllerGUIRender("reaction", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val remainCoolant = isNull(map["coolantAmount"]) ? 0 : map["coolantAmount"].asFloat();
    val remainMaintainer = isNull(map["maintainerAmount"]) ? 0 : map["maintainerAmount"].asFloat();

    var info as string[] = [
        "§6§l ---------- §l裂变反应堆显示器 §6----------",
        "§b冷却剂剩余：§a" + remainCoolant + "C"
    ];

    if (remainCoolant < 25000) {
        info += "§c警告：剩余冷却剂数量偏少。";
    }

    if (remainMaintainer >= 20) {
        info += "§e堆芯稳定度：§a" + remainMaintainer + "%";
    }
    else
    {
        info += "§e堆芯稳定度：§c" + remainMaintainer + "%";
        info += "§c警告：反应堆即将熔毁！";
    }

    info += "§6 ---------------------------------------------";

    event.extraInfo = info;
});
//添加冷却剂
var recipeAmount = 1;
for fluid, cool in coolantDef {
    RecipeBuilder.newBuilder("add_coolant_" + recipeAmount, "reaction", 200, recipeAmount, true)
        .addFluidPerTickInput(fluid)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (checkMaxCoolant(event.controller.customData.asMap())) {
                event.setFailed("反应堆内冷却剂已满");
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            val thread = event.factoryRecipeThread;
            val activeRecipe = thread.activeRecipe;

            thread.setStatusInfo("正在添加冷却剂...");
            if (checkMaxCoolant(event.controller.customData.asMap())) {
                activeRecipe.tick = activeRecipe.totalTick;
            } else {
                activeRecipe.tick = 0;
            }

            addCoolant(event.controller, cool);
        })
        .addRecipeTooltip("为反应堆添加 " + cool + " 点冷却剂值。")
        .setParallelized(false)
        .setMaxThreads(1)
        .setThreadName("冷却线程")
        .build();
    recipeAmount += 1;
}
//维护反应堆
for item, maintain in maintainerDef {
    RecipeBuilder.newBuilder("add_maintain_" + recipeAmount, "reaction", 200, recipeAmount, true)
        .addItemInput(item)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (checkMaxMaintainer(event.controller.customData.asMap())) {
                event.setFailed("反应堆已维护完毕");
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            val thread = event.factoryRecipeThread;
            thread.setStatusInfo("正在维护反应堆...");
            if (checkMaxMaintainer(event.controller.customData.asMap())) {
                return;
            }
        })
        .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
            addMaintainer(event.controller, maintain);
        })
        .addRecipeTooltip("为堆芯维护 " + maintain + " %稳定度。")
        .setParallelized(false)
        .setMaxThreads(1)
        .setThreadName("维护线程")
        .build();
    recipeAmount += 1;
}
//检查反应堆稳定度满
function checkMaxMaintainer(map as IData[string]) as bool {
    val remainMaintainer = isNull(map["maintainerAmount"]) ? 0 : map["maintainerAmount"].asFloat();
    return remainMaintainer >= 100;
}
//检查反应堆冷却剂满
function checkMaxCoolant(map as IData[string]) as bool {
    val remainCoolant = isNull(map["coolantAmount"]) ? 0 : map["coolantAmount"].asFloat();
    return remainCoolant >= 1000000;
}
//添加冷却剂
function addCoolant(ctrl as IMachineController, cool as int) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainCoolant = isNull(map["coolantAmount"]) ? 0 : map["coolantAmount"].asFloat();
    map["coolantAmount"] = remainCoolant + cool;
    ctrl.customData = data;
}
//添加稳定度
function addMaintainer(ctrl as IMachineController, maintain as int) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainMaintainer = isNull(map["maintainerAmount"]) ? 0 : map["maintainerAmount"].asFloat();
    map["maintainerAmount"] = remainMaintainer + maintain;
    ctrl.customData = data;
}
//检查冷却剂数
function checkCoolantInputAmount(map as IData[string]) as bool {
    val remainCoolant = isNull(map["coolantAmount"]) ? 0 : map["coolantAmount"].asFloat();
    return remainCoolant >= 20000;
}
//检查稳定度数
function checkMaintainerInputAmount(map as IData[string]) as bool {
    val remainMaintainer = isNull(map["maintainerAmount"]) ? 0 : map["maintainerAmount"].asFloat();
    return remainMaintainer >= 10;
}
//反应时消耗冷却剂
function doReact(event as FactoryRecipeTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val activeRecipe = event.factoryRecipeThread.activeRecipe;
    val map = data.asMap();
    val remainCoolant = isNull(map["coolantAmount"]) ? 0 as float : map["coolantAmount"].asFloat();

    if (remainCoolant >= 1000) {
        map["coolantAmount"] = remainCoolant - 1000;
        ctrl.customData = data;
    } else {
        activeRecipe.tick = activeRecipe.totalTick;
    }
}
//反应完成后
function breakMaintain(event as FactoryRecipeFinishEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val remainMaintainer = isNull(map["maintainerAmount"]) ? 0 as float : map["maintainerAmount"].asFloat();
    map["maintainerAmount"] = remainMaintainer - 10;
    ctrl.customData = data;
}
//配方列表
val recipes as IItemStack[IItemStack]$orderly = {
    <ic2:uranium_fuel_rod>.withTag({advDmg: 0})      : <ic2:nuclear:11>,
    <ic2:dual_uranium_fuel_rod>.withTag({advDmg: 0}) : <ic2:nuclear:12>,         
    <ic2:quad_uranium_fuel_rod>.withTag({advDmg: 0}) : <ic2:nuclear:13>,         
    <ic2:mox_fuel_rod>.withTag({advDmg: 0})          : <ic2:nuclear:14>,                   
    <ic2:dual_mox_fuel_rod>.withTag({advDmg: 0})     : <ic2:nuclear:15>,            
    <ic2:quad_mox_fuel_rod>.withTag({advDmg: 0})     : <ic2:nuclear:16>,         
    <fm:coaxium_rod>                                 : <fm:depleted_coaxium_rod>,                                         
    <fm:coaxium_rod_dual>                            : <fm:depleted_coaxium_rod_dual>,                                    
    <fm:coaxium_rod_quad>                            : <fm:depleted_coaxium_rod_quad>,                                 
    <fm:cesium_rod>                                  : <fm:depleted_cesium_rod>,                                      
    <fm:cesium_rod_dual>                             : <fm:depleted_cesium_rod_dual>,                                      
    <fm:cesium_rod_quad>                             : <fm:depleted_cesium_rod_quad>                                   
};
//反应配方
for material, result in recipes {
    RecipeBuilder.newBuilder("reaction" + recipeAmount, "reaction", 6000, recipeAmount, true)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val map = event.controller.customData.asMap();
            //冷却剂够才运行
            if (!checkCoolantInputAmount(map)) {
                event.setFailed("反应堆内的冷却剂不足以反应");
                return;
            }
        })
        .addPostCheckHandler(function(event as RecipeCheckEvent) {
            val map = event.controller.customData.asMap();
            if (!checkMaintainerInputAmount(map)) {
                val ctrl = event.controller;
                val world = ctrl.world;
                val radius as double = 8.0;
                if(!world.remote) {
                    world.performExplosion(null, ctrl.pos.x, ctrl.pos.y, ctrl.pos.z, 15.0, true, true);
                }
                val posOne = IBlockPos.create(ctrl.pos.x + radius, ctrl.pos.y + radius, ctrl.pos.z + radius);
                val posTwo = IBlockPos.create(ctrl.pos.x - radius, ctrl.pos.y - radius, ctrl.pos.z - radius);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for i in posCollection{
                    val distance = ((i.x - ctrl.pos.x) * (i.x - ctrl.pos.x) + (i.y - ctrl.pos.y) * (i.y - ctrl.pos.y) + (i.z - ctrl.pos.z) * (i.z - ctrl.pos.z)) as double;
                    val blockState as string = world.getBlockState(i).commandString;
                    val blockBedRock as string = <blockstate:minecraft:bedrock>.commandString;
                    if (!world.remote && distance <= radius * radius && blockState != blockBedRock) { 
                        world.setBlockState(<blockstate:minecraft:air>, i);
                    }
                }
                return;
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            doReact(event);
        })
        .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
            breakMaintain(event);
        })
        .addEnergyPerTickOutput(65536)
        .addItemInput(material)
        .addItemOutput(result)
        .addItemOutput(<qmd:waste_fission>).setChance(0.1)
        .addFluidPerTickOutput(<liquid:ic2hot_coolant> * 25)
        .addCatalystInput(<nuclearcraft:depleted_fuel_californium:15>,["此催化剂可以减少50%工作时间"],[RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.5, 1, false).build()])
        .setMaxThreads(1)
        .setThreadName("反应线程")
        .build();
    recipeAmount += 1;
}