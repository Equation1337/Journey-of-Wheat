#priority 50
#loader crafttweaker reloadable

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

RecipeBuilder.newBuilder("drill_1", "drill", 160)
    .addEnergyPerTickInput(5000)
    .addFluidOutput(<liquid:plastic> * 16000)
    .build();