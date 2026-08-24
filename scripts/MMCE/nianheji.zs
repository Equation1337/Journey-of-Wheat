#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

RecipeBuilder.newBuilder("nianheji_1", "nianheji", 3000)
    .addItemInputs([<nuclearcraft:gem_dust:4>, <nuclearcraft:compound>, <environmentaltech:aethium_crystal>, <environmentaltech:lonsdaleite_crystal>])
    .addItemOutput(<nuclearcraft:compound:1> * 3)
    .addFluidPerTickInput(<liquid:mana_fluid> * 10)
    .build();