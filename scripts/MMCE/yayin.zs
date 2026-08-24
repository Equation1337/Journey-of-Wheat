#priority 50
#loader crafttweaker reloadable

import crafttweaker.game.IGame;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;

import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.SmartInterfaceData;

MachineModifier.addSmartInterfaceType("yayin",
    SmartInterfaceType.create("mode", 1)
        .setHeaderInfo("§e压印模式选择")
        .setValueInfo("当前模式：§b%.0f")
        .setJeiTooltip("工作模式：§b%.0f", 1)
        .setFooterInfo("模式1为压印模式，模式2为命名模式")
        .setNotEqualMessage("机器模式不匹配")
);

function registerRecipeA(Name as string,Energy as long,Time as int, High as int, Inputs as IIngredient[],Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "yayin", Time, High)
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
        .addEnergyPerTickInput(Energy)
        .addItemInputs(Inputs)
        .addItemOutput(Output)
        .addFluidPerTickInput(<liquid:water_4> * 3)
        .addFluidPerTickOutput(<liquid:water> * 3)
        .build();
}

function registerRecipeB(Name as string,Energy as long,Time as int, High as int, Input as IIngredient, Inputs as IIngredient,Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "yayin", Time, High)
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
        .addEnergyPerTickInput(Energy)
        .addItemInput(Input).setChance(0)
        .addItemInput(Inputs)
        .addItemOutput(Output)
        .addFluidPerTickInput(<liquid:water_4> * 3)
        .addFluidPerTickOutput(<liquid:water> * 3)
        .build();
}
var recipeAmount = 13;
for mod in loadedMods { 
    for item in mod.items { 
        RecipeBuilder.newBuilder("chongmingming_" + recipeAmount, "yayin", 1, recipeAmount)
            .addSmartInterfaceDataInput("mode", 2)
            .addPreCheckHandler(function(event as RecipeCheckEvent) {
                val ctrl = event.controller;
                val smart = ctrl.getSmartInterfaceData("mode");
                val mode = isNull(smart) ? 1 as float : smart.value;
                if (mode != 2) {
                    event.setFailed("工作模式不匹配！");
                    return;
                }
            })
            .addEnergyPerTickInput(500)
            .addItemInput(<appliedenergistics2:material:21>).setChance(0).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
                val name = D(item.tag).getString("InscribeName", "");
                val data = ctrl.customData;
                data.asMap()["InscribeName"] = name;
                ctrl.customData = data;
                return name != "";
            })
            .addItemInput(item)
            .addItemOutput(item).addItemModifier(function(ctrl as IMachineController, Item as IItemStack) as IItemStack {
                val data = ctrl.customData;
                val ddata = D(data);
                val map = data.asMap();
                val name = ddata.getString("InscribeName","");
                return Item.withTag({display : {Name : name}});
            })
            .addFluidPerTickInput(<liquid:water_4> * 3)
            .addFluidPerTickOutput(<liquid:water> * 3)
            .build();
        recipeAmount += 1;
    }
}

registerRecipeA("yayin_1", 64000, 1, 1,[<minecraft:redstone>, <ore:itemSilicon>, <minecraft:gold_ingot>], <appliedenergistics2:material:22>);
registerRecipeA("yayin_2", 64000, 1, 2,[<minecraft:redstone>, <ore:itemSilicon>, <minecraft:diamond>], <appliedenergistics2:material:24>);
registerRecipeA("yayin_3", 64000, 1, 3,[<minecraft:redstone>, <ore:itemSilicon>, <appliedenergistics2:material:10>], <appliedenergistics2:material:23>);
registerRecipeA("yayin_4", 64000, 1, 4,[<minecraft:redstone>, <ore:itemSilicon>, <threng:material:5>], <threng:material:6>);
registerRecipeA("yayin_5", 64000, 1, 5,[<minecraft:redstone>, <ore:itemSilicon>, <threng:material:13>], <threng:material:14>);
registerRecipeA("yayin_6", 64000, 1, 6,[<minecraft:redstone>, <appliedenergistics2:material:20>, <appliedenergistics2:material:18>], <appliedenergistics2:material:22>);
registerRecipeA("yayin_7", 64000, 1, 7,[<minecraft:redstone>, <appliedenergistics2:material:20>, <appliedenergistics2:material:17>], <appliedenergistics2:material:24>);
registerRecipeA("yayin_8", 64000, 1, 8,[<minecraft:redstone>, <appliedenergistics2:material:20>, <appliedenergistics2:material:16>], <appliedenergistics2:material:23>);
registerRecipeB("yayin_9", 64000, 1, 9,<appliedenergistics2:material:19>, <ore:itemSilicon>, <appliedenergistics2:material:20>);
registerRecipeB("yayin_10", 64000, 1, 10,<appliedenergistics2:material:15>, <minecraft:gold_ingot>, <appliedenergistics2:material:18>);
registerRecipeB("yayin_11", 64000, 1, 11,<appliedenergistics2:material:14>, <minecraft:diamond>, <appliedenergistics2:material:17>);
registerRecipeB("yayin_12", 64000, 1, 12,<appliedenergistics2:material:13>, <appliedenergistics2:material:10>, <appliedenergistics2:material:16>);