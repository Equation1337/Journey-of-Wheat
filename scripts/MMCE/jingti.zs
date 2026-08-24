#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import novaeng.hypernet.HyperNetHelper;

MachineModifier.setMaxParallelism("jingti", 256);
MachineModifier.setInternalParallelism("jingti", 16);

MachineModifier.setMaxThreads("jingti", 0);

val drone0 = FactoryRecipeThread.createCoreThread("晶体催生仓 #0");
val drone1 = FactoryRecipeThread.createCoreThread("晶体催生仓 #1");
val drone2 = FactoryRecipeThread.createCoreThread("晶体催生仓 #2");
val drone3 = FactoryRecipeThread.createCoreThread("晶体催生仓 #3");

MachineModifier.addCoreThread("jingti", drone0);
MachineModifier.addCoreThread("jingti", drone1);
MachineModifier.addCoreThread("jingti", drone2);
MachineModifier.addCoreThread("jingti", drone3);

function registerRecipe(Name as string,Energy as long,Time as int, Inputs as IIngredient[],Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "jingti", Time)
        .addEnergyPerTickInput(Energy)
        .addFluidPerTickInput(<liquid:water_3> * 5)
        .addFluidPerTickInput(<liquid:astralsorcery.liquidstarlight> * 5)
        .addItemInputs(Inputs)
        .addItemOutput(Output)
        .build();
}

registerRecipe("jingti_1", 32000, 100, [<ore:dustCoal> * 3, <minecraft:iron_ingot>, <appliedenergistics2:material:8>], <threng:material>);
registerRecipe("jingti_2", 32000, 100, [<appliedenergistics2:material> * 32, <calculator:electricdiamond>], <appliedenergistics2:material:1> * 32);
registerRecipe("jingti_3", 32000, 100, [<appliedenergistics2:material:10> * 16], <appliedenergistics2:material> * 16);
registerRecipe("jingti_4", 32000, 100, [<appliedenergistics2:material> * 16], <appliedenergistics2:material:10> * 32);
registerRecipe("jingti_5", 32000, 100, [<appliedenergistics2:material:1> * 8, <minecraft:redstone> * 8, <minecraft:quartz> * 8], <appliedenergistics2:material:7> * 16);
registerRecipe("jingti_6", 32000, 100, [<appliedenergistics2:material:7> * 16], <appliedenergistics2:material:12> * 32);
registerRecipe("jingti_7", 32000, 100, [<minecraft:diamond>, <appliedenergistics2:material:45>, <ore:dustEnder>], <threng:material:5>);
registerRecipe("jingti_8", 32000, 100, [<ore:itemSilicon> * 64, <minecraft:redstone> * 64, <threng:material:1> * 64, <appliedenergistics2:material:45> * 64, <minecraft:gold_ingot> * 64, <appliedenergistics2:material:6> * 64, <appliedenergistics2:material:10> * 32, <minecraft:diamond> * 16], <threng:material:13> * 2);