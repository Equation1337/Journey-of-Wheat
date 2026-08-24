#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

function registerRecipe(Name as string, Inputs as IIngredient[], Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "computer", 600)
        .addEnergyPerTickInput(102400000)
        .addItemInputs(Inputs)
        .addItemOutput(Output)
        .build();
}

registerRecipe("c_1", [<contenttweaker:infinity_dianluban> * 8, <enderio:item_capacitor_stellar>, <calculator:atomicassembly> * 2, <calculator:material:8> * 8], <calculator:processingchamber>);
registerRecipe("c_2", [<contenttweaker:infinity_dianluban> * 8, <enderio:item_capacitor_stellar>, <calculator:atomicassembly> * 2, <calculator:material:5> * 8], <calculator:precisionchamber>);
registerRecipe("c_3", [<contenttweaker:infinity_dianluban> * 8, <enderio:item_capacitor_stellar>, <calculator:atomicassembly> * 2, <calculator:material:9> * 16], <calculator:analysingchamber>);
registerRecipe("c_4", [<contenttweaker:infinity_dianluban> * 8, <enderio:item_capacitor_stellar>, <calculator:atomicassembly> * 2, <avaritia:block_resource:1>], <calculator:fabricationchamber>);
registerRecipe("c_5", [<calculator:atomicassembly> * 24, <calculator:circuitboard>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:1>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:2>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:3>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:4>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:5>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:6>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:7>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:8>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:9>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:10>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:11>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:12>.withTag({Stable: 1, Analysed: 1 as byte}) * 16, <calculator:circuitboard:13>.withTag({Stable: 1, Analysed: 1 as byte}) * 16], <calculator:flawlessassembly>);
registerRecipe("c_6", [<modularmachinery:blockcasing>, <calculator:flawlessassembly> * 4, <calculator:locatormodule> * 4, <calculator:fiddledewfruit> * 16384], <modularmachinery:digital_controller>);
registerRecipe("c_8", [<modularmachinery:blockcasing>, <qmd:semiconductor:6> * 4, <calculator:flawlessassembly> * 4, <contenttweaker:life_core> * 4], <modularmachinery:core_factory_controller>);