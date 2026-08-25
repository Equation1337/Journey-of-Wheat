#priority 50
#loader crafttweaker reloadable

import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.Sync;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeFinishEvent;

import mods.modularmachinery.IMachineController;

import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.item.IIngredient;

import novaeng.hypernet.HyperNetHelper;

import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.RecipeModifier;

RecipeBuilder.newBuilder("dragon_1", "dragon",3000)
    .addItemInputs([<roots:spirit_herb>, <roots:moonglow_leaf>, <botania:rune:8>, <minecraft:egg>])
    .addManaPerTickInput(20)
    .addStartHandler(function (event as RecipeStartEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val Pos as IBlockPos = ctrl.pos.createPosByFacing(ctrl.facing, 0, 0, 4);
            if (!world.remote) {
                world.setBlockState(<blockstate:matteroverdrive:gravitational_anomaly>, Pos);
            }
        });
    }) 
    .addFinishHandler(function (event as RecipeFinishEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val Pos as IBlockPos = ctrl.pos.createPosByFacing(ctrl.facing, 0, 0, 4);
            if (!world.remote) {
                world.setBlockState(<blockstate:extendedcrafting:storage:variant=NETHER_STAR>,Pos);
            }
        });
    })
    .addItemOutput(<minecraft:dragon_egg>)
    .setParallelized(false)
    .build();

RecipeBuilder.newBuilder("dragon_2", "dragon",3000)
    .addItemInputs([<roots:spirit_herb>, <roots:moonglow_leaf>, <botania:rune:8>, <minecraft:glass_bottle> * 4])
    .addManaPerTickInput(20)
    .addStartHandler(function (event as RecipeStartEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val Pos as IBlockPos = ctrl.pos.createPosByFacing(ctrl.facing, 0, 0, 4);
            if (!world.remote) {
                world.setBlockState(<blockstate:matteroverdrive:gravitational_anomaly>, Pos);
            }
        });
    }) 
    .addFinishHandler(function (event as RecipeFinishEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val Pos as IBlockPos = ctrl.pos.createPosByFacing(ctrl.facing, 0, 0, 4);
            if (!world.remote) {
                world.setBlockState(<blockstate:extendedcrafting:storage:variant=NETHER_STAR>,Pos);
            }
        });
    })
    .addItemOutput(<minecraft:dragon_breath> * 4)
    .setParallelized(false)
    .build();