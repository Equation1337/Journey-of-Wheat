//craft by DoremySwee
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
import mods.modularmachinery.IngredientArrayBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

RecipeBuilder.newBuilder("rainbow", "flower", 40, 1, true)
    .addItemInput(<botania:specialflower>.withTag({type: "irisotos"}))
    .addRandomItemOutput(
        IngredientArrayBuilder.newBuilder()
        .addIngredient(<botania:specialflower>.withTag({type: "thermalily"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "kekimurus"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "munchdew"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "rafflowsia"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "soarleander"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "entropinnyum"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "hydroangeas"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "ba_rain_flower"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "gourmaryllis"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "spectrolus"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "endoflame"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "ba_snow_flower"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "narslimmus"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "arcanerose"})).setChance(0.3)
        .addIngredient(<botania:specialflower>.withTag({type: "ba_lightning_flower"})).setChance(0.3)
    .build()
    )
    .addRecipeTooltip("莲生万物")
    .setParallelized(false)
    .build();
RecipeBuilder.newBuilder("mana", "flower", 80, 1, true)
    .addItemInput(<botaniverse:morerock:2>)
    .addFluidOutput(<liquid:mana_fluid> * 100000)
    .addRecipeTooltip("魔力泉涌")
    .setMaxThreads(1)
    .setParallelized(false)
    .build();
