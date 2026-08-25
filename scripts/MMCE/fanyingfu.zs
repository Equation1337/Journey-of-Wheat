#priority 50
#loader crafttweaker reloadable

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

RecipeBuilder.newBuilder("fanyingfu_1", "fanyingfu", 36000)
    .addEnergyPerTickInput(65536)
    .addItemInput(<frogcraftrebirth:intermediate_product:5> * 3)
    .addItemOutput(<mets:titanium_ingot>)
    .addFluidInput(<liquid:ic2hydrogen> * 2000)
    .addFluidOutput(<liquid:water> * 2000)
    .build();

RecipeBuilder.newBuilder("fanyingfu_2", "fanyingfu", 36000)
    .addEnergyPerTickInput(65536)
    .addItemInput(<qmd:waste_fission> * 3)
    .addItemOutput(<qmd:ingot:1>)
    .addFluidInput(<liquid:ic2hydrogen> * 2000)
    .addFluidOutput(<liquid:water> * 2000)
    .build();