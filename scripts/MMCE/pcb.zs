#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MachineModifier;

import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.SmartInterfaceData;

MachineModifier.addSmartInterfaceType("pcb",
    SmartInterfaceType.create("mode", 1)
        .setHeaderInfo("§e工厂模式选择")
        .setValueInfo("当前模式：§b%.0f")
        .setJeiTooltip("工作模式：§b%.0f", 1)
        .setFooterInfo("模式1为分析模式，模式2为稳定分析模式")
        .setNotEqualMessage("机器模式不匹配")
);

RecipeBuilder.newBuilder("fenxi", "pcb", 20)
    .addSmartInterfaceDataInput("mode", 1)
    .addItemInputs([<minecraft:cobblestone> * 64, <minecraft:dirt> * 64])
    .addItemOutputs([<calculator:circuitboard>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:1>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:2>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:3>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:4>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:5>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:6>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:7>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:8>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:9>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:10>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:11>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:12>.withTag({Stable: 0, Analysed: 1 as byte}) * 8, <calculator:circuitboard:13>.withTag({Stable: 0, Analysed: 1 as byte}) * 8])
    .addEnergyPerTickInput(10240000)
    .addFluidInput(<liquid:water_5> * 1)
    .build();

RecipeBuilder.newBuilder("wending", "pcb", 20)
    .addSmartInterfaceDataInput("mode", 2)
    .addItemInputs([<minecraft:cobblestone> * 64, <minecraft:dirt> * 64])
    .addItemOutputs([<calculator:circuitboard>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:1>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:2>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:3>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:4>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:5>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:6>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:7>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:8>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:9>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:10>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:11>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:12>.withTag({Stable: 1, Analysed: 1 as byte}) * 8, <calculator:circuitboard:13>.withTag({Stable: 1, Analysed: 1 as byte}) * 8])
    .addEnergyPerTickInput(10240000)
    .addFluidInput(<liquid:water_7> * 1)
    .build();