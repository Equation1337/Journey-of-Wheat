#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.IMachineController;

val upgrade as IItemStack[]  = [
    <contenttweaker:star_coil>,
    <contenttweaker:infinity_coil>       ,
    <contenttweaker:dragon_coil>,
    <contenttweaker:haipozhen_coil>
];
val upgrade_1 as string[]= [
    "<blockstate:contenttweaker:star_coil>" ,
    "<blockstate:contenttweaker:infinity_coil>"      ,
    "<blockstate:contenttweaker:dragon_coil>",
    "<blockstate:contenttweaker:haipozhen_coil>"
];
MMEvents.onStructureFormed("gaolu", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function(){
    val ctrl = event.controller;
    val world = ctrl.world;
    val data = ctrl.customData;
    val map = data.asMap();
    val Pos = IBlockPos.create(ctrl.pos.x,ctrl.pos.y + 1,ctrl.pos.z);
    var Blocks = world.getBlockState(Pos).commandString;
    for Block in upgrade {
        var upgradeAmount as int = ctrl.getBlocksInPattern(Block);
        if (upgradeAmount == 16) {
            if (Blocks == upgrade_1[0]) {
                map["timeAmount"] = 2;
                ctrl.customData = data;
            }
            if (Blocks == upgrade_1[1]) {
                map["timeAmount"] = 4;
                ctrl.customData = data;
            }
            if (Blocks == upgrade_1[2]) {
                map["timeAmount"] = 8;
                ctrl.customData = data;
            }
            if (Blocks == upgrade_1[3]) {
                map["timeAmount"] = 16;
                ctrl.customData = data;
            }
        }
        else if (upgradeAmount > 0) {
            map["timeAmount"] = 0;
            ctrl.customData = data;
        }
    }
    });
});


function registerRecipe(Name as string,Energy as long,Time as int,Inputs as IIngredient[],Fluid as ILiquidStack,Outputs as IIngredient[]) {
    RecipeBuilder.newBuilder(Name, "gaolu", Time)
        .addRecipeTooltip("提示：将结构中的线圈全部替换为","恒星合金/无尽/觉醒龙/海珀珍线圈","分别可减少50%/75%/87.5%/93.75%的工作时间")
        .addPreTickHandler(function(event as RecipeTickEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val tickAmount = isNull(map["timeAmount"]) ? 1 : map["timeAmount"].asInt();
            if (tickAmount == 0) {
                event.setFailed(false, "线圈摆放不合规");
                return;
            }
        })
        .addStartHandler(function(event as RecipeStartEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val tickAmount = isNull(map["timeAmount"]) ? 1 : map["timeAmount"].asInt();
            val active = ctrl.activeRecipe;
            active.tick = active.totalTick - (active.totalTick / tickAmount);
        })
        .addEnergyPerTickInput(Energy)
        .addItemInputs(Inputs)
        .addItemOutputs(Outputs)
        .addFluidInput(Fluid)
        .build();
}

registerRecipe("gaolu_1", 32768, 400, [<ore:dustTitanium>], <liquid:nitrogen> * 150, [<mets:titanium_ingot>]);
registerRecipe("gaolu_2", 32768, 400, [<ore:dustTitanium>], <liquid:nitrogen> * 150, [<qmd:ingot:1>]);
registerRecipe("gaolu_3", 65536, 400, [<mets:niobium_titanium_dust>], <liquid:argon> * 25, [<mets:niobium_titanium_ingot>]);
registerRecipe("gaolu_4", 65536, 800, [<mets:niobium_titanium_ingot>, <botania:manaresource:8>], <liquid:argon> * 50, [<mets:nano_living_metal>]);
registerRecipe("gaolu_5", 65536, 800, [<enderio:item_alloy_ingot:6>, <astralsorcery:itemcraftingcomponent:1>], <liquid:argon> * 8, [<extendedcrafting:material> * 2]);
registerRecipe("gaolu_5", 65536, 800, [<minecraft:iron_block>* 2, <ore:dustCoal> * 16], <liquid:water_5> * 250, [<immersiveengineering:storage:8> * 2, <ic2:misc_resource:5> * 16]);
registerRecipe("gaolu_5", 65536, 400, [<minecraft:iron_block> * 8, <ore:dustCoal> * 64], <liquid:water_6> * 125, [<immersiveengineering:storage:8> * 8, <ic2:misc_resource:5> * 64]);
registerRecipe("gaolu_5", 65536, 100, [<minecraft:iron_block> * 32, <ore:dustCoal> * 256], <liquid:water_7> * 250, [<immersiveengineering:storage:8> * 32, <ic2:misc_resource:5> * 256]);