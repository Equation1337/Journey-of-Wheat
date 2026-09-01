//source of inspiration Isolated Crystal 3
#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IVector3d;
import crafttweaker.data.IData;
import crafttweaker.util.Math;
import mods.zenutils.StringList;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MachineModifier;

MachineModifier.setMaxThreads("core", 4);

MMEvents.onStructureFormed("core", function(event as MachineStructureFormedEvent) {
    val ctrl = event.controller;
    val world = ctrl.world;
    val pos = ctrl.pos;
    val iitem = world.getItemHandler(pos.createPosByFacing(ctrl.facing, 1, -1, 0));
    val iitem_1 = world.getItemHandler(pos.createPosByFacing(ctrl.facing, -1, -1, 0));
    val iitem_2 = world.getItemHandler(pos.createPosByFacing(ctrl.facing, 0, -1, 1));
    val iitem_3 = world.getItemHandler(pos.createPosByFacing(ctrl.facing, 0, -1, -1));
    val iitem_4 = world.getItemHandler(pos.createPosByFacing(ctrl.facing, 0, -2, 0));
    if (!world.remote && !isNull(iitem)) {
        val item = iitem.getStackInSlot(0);
        iitem.setStackInSlot(0, null);
        iitem_4.setStackInSlot(0, item);
    }
    if (!world.remote && !isNull(iitem_1)) {
        val item = iitem.getStackInSlot(0);
        iitem_1.setStackInSlot(0, null);
        iitem_4.setStackInSlot(0, item);
    }
    if (!world.remote && !isNull(iitem_2)) {
        val item = iitem.getStackInSlot(0);
        iitem_2.setStackInSlot(0, null);
        iitem_4.setStackInSlot(0, item);
    }
    if (!world.remote && !isNull(iitem_3)) {
        val item = iitem.getStackInSlot(0);
        iitem_3.setStackInSlot(0, null);
        iitem_4.setStackInSlot(0, item);
    }
});

static otherCombinations as int[][] = [
    [0, 1, 2],
    [0, 1, 3],
    [0, 2, 3],
    [1, 2, 3],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 2],
    [1, 3],
    [2, 3],
    [0],
    [1],
    [2],
    [3]
];


function registerRecipe(Name as string, Tip as string, Energy as long,Time as int, Inputs as IIngredient[], Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "core", Time, 0)
        .addRecipeTooltip("§c必须同时输入物品，否则无法正常工作输入物品将返还")
        .addEnergyPerTickInput(Energy)
        .addItemInputs(Inputs)
        .addItemOutput(Output)
        .build();
    for i, combination in otherCombinations {
        val builder = RecipeBuilder.newBuilder("core_failed_" ~ Tip ~ i, "core", 10, 10 - combination.length);
        for j in combination {
            builder.addItemInput(Inputs[j]);
            builder.addItemOutput(Inputs[j]);
        }
        builder.build();
    }
}

registerRecipe("core_1", "dragon", 1000000000, 10, [<draconicevolution:draconium_ingot> * 4, <avaritia:resource:4>, <bloodmagic:slate:2>, <deepmoblearning:living_matter_void>], <draconicevolution:draconic_core>);
registerRecipe("core_2", "fly_dragon", 2000000000, 20, [<draconicevolution:draconic_core> * 4, <extendedcrafting:material:40>, <deepmoblearning:pristine_matter_dragon>, <mets:neutron_plate> * 24], <draconicevolution:wyvern_core>);
registerRecipe("core_3", "god_dragon", 4000000000, 40, [<draconicevolution:wyvern_core> * 4, <draconicevolution:draconic_ingot> * 5, <contenttweaker:memory_matrix>, <deepmoblearning:pristine_matter_gaia>], <draconicevolution:awakened_core>);
registerRecipe("core_4", "chaotic", 8000000000, 80, [<draconicevolution:awakened_core> * 4, <draconicevolution:draconic_ingot> * 4, <draconicevolution:chaos_shard> * 32, <deepmoblearning:pristine_matter_chaosguardian> * 8], <draconicevolution:chaotic_core>);
