#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.RecipeCheckEvent;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

val uuThread = FactoryRecipeThread.createCoreThread("物质离析");
val niuquThread = FactoryRecipeThread.createCoreThread("维度扭曲");

MachineModifier.setMaxThreads("uu", 0);
MachineModifier.addCoreThread("uu", uuThread);
MachineModifier.addCoreThread("uu", niuquThread);

val NiuQu as int[IItemStack]$orderly = {
    <avaritia:singularity>       : 5,
    <avaritia:singularity:1>       : 5,
    <avaritia:singularity:2>       : 5,
    <avaritia:singularity:3>       : 5,
    <avaritia:singularity:4>       : 10,
    <avaritia:singularity:5>       : 5,
    <avaritia:singularity:6>       : 5,
    <avaritia:singularity:7>       : 5,
    <avaritia:singularity:8>       : 7,
    <avaritia:singularity:9>       : 7,
    <avaritia:singularity:10>       : 15,
    <avaritia:singularity:11>       : 15,
    <avaritia:singularity:12>       : 15,
    <avaritia:singularity:13>       : 15,
    <avaritia:singularity:14>       : 20
};

MMEvents.onControllerGUIRender("uu", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val remainNiuqu = isNull(map["niuquAmount"]) ? 0 : map["niuquAmount"].asFloat();
    val c = 299792458.0F;
    val C = c - 2997924.58 * remainNiuqu;

    var info as string[] = [
        "§6§l -------- §d物质扭曲仪衍射图谱量化 §6--------",
        "§5维度扭曲度：§c" + remainNiuqu + "%",
        "§b亚空间光速：§e" + C + "m/s",
        "§6 ---------------------------------------------"
    ];
    event.extraInfo = info;
});

var recipeAmount = 1;
for item, niuqu in NiuQu {
    RecipeBuilder.newBuilder("niuqu_" + recipeAmount, "uu", 20, recipeAmount)
        .addRecipeTooltip("每输入一个奇点增加一点扭曲度,每一点扭曲度增加一个最大并行,上限为100%")
        .addItemInput(item)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (checkMaxNiuqu(event.controller.customData.asMap())) {
                event.setFailed("亚空间光速已趋近停滞！");
            }
        })
        .addFactoryPostTickHandler(function(event as FactoryRecipeTickEvent) {
            val thread = event.factoryRecipeThread;
            thread.setStatusInfo("正在进行维度扭曲...");
            if (checkMaxNiuqu(event.controller.customData.asMap())) {
                return;
            }
        })
        .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
            addNiuqu(event.controller, niuqu);
        })
        .setParallelized(false)
        .setThreadName("维度扭曲")
        .build();
    recipeAmount += 1;
}

function checkMaxNiuqu(map as IData[string]) as bool {
    val remainNiuqu = isNull(map["niuquAmount"]) ? 0 : map["niuquAmount"].asFloat();
    return remainNiuqu >= 100;
}

function addNiuqu(ctrl as IMachineController, niuqu as int) {
    val data = ctrl.customData;
    val map = data.asMap();
    val remainNiuqu = isNull(map["niuquAmount"]) ? 0 : map["niuquAmount"].asFloat();
    map["niuquAmount"] = remainNiuqu + niuqu;
    ctrl.customData = data;
}

function breakNiuqu(event as FactoryRecipeFinishEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val remainNiuqu = isNull(map["niuquAmount"]) ? 0 as float : map["niuquAmount"].asFloat();
    if (remainNiuqu > 0) {
        map["niuquAmount"] = remainNiuqu - 1;
        ctrl.customData = data;
    }
}

RecipeBuilder.newBuilder("uu_0", "uu", 20, 0)
    .addEnergyPerTickInput(25600000)
    .addItemInput(<ic2:crafting:23> * 256).setChance(0)
    .addPreCheckHandler(function(event as RecipeCheckEvent){
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val remainNiuqu = isNull(map["niuquAmount"]) ? 0 : map["niuquAmount"].asFloat();
        event.activeRecipe.maxParallelism = remainNiuqu + 1;
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
        breakNiuqu(event);
    })
    .addFluidPerTickOutput(<liquid:ic2uu_matter> * 1000)
    .setMaxThreads(1)
    .setThreadName("物质离析")
    .build();