#reloadable
#debug
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.Sync;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IVector3d;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.util.Math;
import mods.zenutils.StringList;

function checkCircuit(ctrl as IMachineController, temp as bool, required as int) as bool {
    val offset as int = temp ? -2 : 2;
    val itemHandler = ctrl.world.getItemHandler(ctrl.pos.createPosByFacing(ctrl.facing, offset, 0, 2), up);
    val item = itemHandler.getStackInSlot(0);
    val lampOffset as IBlockPos = ctrl.pos.createPosByFacing(ctrl.facing, offset, 0, -2);
    if (<calculator:circuitboard:*>.withTag({Stable: 1 as byte, Analysed: 1 as byte}).matches(item)) {
        if (item.metadata == required) {
            ctrl.world.setBlockState(<blockstate:randomthings:luminousblock:color=lime>, lampOffset);
            return true;
        } else if (item.metadata > required) {
            ctrl.world.setBlockState(<blockstate:randomthings:luminousblock:color=red>, lampOffset);
            return false;
        } else {
            ctrl.world.setBlockState(<blockstate:randomthings:luminousblock:color=purple>, lampOffset);
            return false;
        }
    }
    ctrl.world.setBlockState(<blockstate:randomthings:luminousblock:color=black>, lampOffset);
    return false;
}
function registerRecipe(Name as string,Energy as long, Inputs as IIngredient[], Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "digital", 20)
        .addRecipeTooltip("§b需要在基座上放置两个稳定电路板", "§b每次运行随机需要两种", "§b对应的荧光方块会提示电路板正确与否", "§c红色代表电路板编号较大§e，§5紫色代表编号较小", "§a黄绿色代表完全正确§e，§0黑色代表所放非电路板")
        .addItemInputs(Inputs)
        .addItemOutput(Output)
        .addFluidPerTickInput(<liquid:mana_fluid> * 1000)
        .addEnergyPerTickInput(Energy)
        .addStartHandler(function(event as RecipeStartEvent) {
            event.controller.customData = {"Password": event.controller.world.random.nextInt(196)};
        })
        .addPreTickHandler(function(event as RecipeTickEvent) {
            if (event.activeRecipe.tick != 5) return;
            val ctrl = event.controller;
            val world = ctrl.world;
            val password as int = ctrl.customData.Password.asInt();
            if (checkCircuit(ctrl, true, password / 14) & checkCircuit(ctrl, false, password % 14)) {
                for x in ([-2, 2] as int[]) {
                    world.getItemHandler(ctrl.pos.createPosByFacing(ctrl.facing, x, 0, 2), up).extractItem(0, 1, false);
                }
            } else {
                event.preventProgressing("电路板错误");
            }
        })
        .addFinishHandler(function(event as RecipeFinishEvent) {
            val ctrl = event.controller;
            for x in ([-2, 2] as int[]) {
                ctrl.world.setBlockState(<blockstate:randomthings:luminousblock:color=white>, ctrl.relativePos(x, 0, -2));
            }
        })
        .build();
}

registerRecipe("d_1", 1000000000, [<moreplates:infinity_plate>, <nuclearcraft:dust:8> * 3], <nuclearcraft:part> * 4);
registerRecipe("d_2", 1000000000, [<nuclearcraft:part> * 4, <nuclearcraft:alloy:1> * 8], <nuclearcraft:part:1> * 4);
registerRecipe("d_3", 1000000000, [<nuclearcraft:part:1> * 4, <nuclearcraft:uranium:10> * 16], <nuclearcraft:part:2> * 4);
registerRecipe("d_4", 1000000000, [<nuclearcraft:part:2> * 4, <nuclearcraft:compound:1> * 16], <nuclearcraft:part:3> * 4);
val cirDef as IItemStack[IItemStack] = {
    <contenttweaker:cirs_white>:<contenttweaker:cir_white>,
    <contenttweaker:cirs_black>:<contenttweaker:cir_black>,
    <contenttweaker:cirs_red>:<contenttweaker:cir_red>,
    <contenttweaker:cirs_green>:<contenttweaker:cir_green>,
    <contenttweaker:cirs_brown>:<contenttweaker:cir_brown>,
    <contenttweaker:cirs_blue>:<contenttweaker:cir_blue>,
    <contenttweaker:cirs_magenta>:<contenttweaker:cir_magenta>,
    <contenttweaker:cirs_orange>:<contenttweaker:cir_orange>,
    <contenttweaker:cirs_purple>:<contenttweaker:cir_purple>,
    <contenttweaker:cirs_light_blue>:<contenttweaker:cir_light_blue>,
    <contenttweaker:cirs_yellow>:<contenttweaker:cir_yellow>,
    <contenttweaker:cirs_lime>:<contenttweaker:cir_lime>,
    <contenttweaker:cirs_pink>:<contenttweaker:cir_pink>,
    <contenttweaker:cirs_gray>:<contenttweaker:cir_gray>,
    <contenttweaker:cirs_light_gray>:<contenttweaker:cir_light_gray>,
    <contenttweaker:cirs_cyan>:<contenttweaker:cir_cyan>
};
var recipeAmount = 5;
for i, e in cirDef {
    registerRecipe("d_" + recipeAmount, 10000000, [i * 4, <contenttweaker:infinity_dianluban>, <deepmoblearning:glitch_infused_ingot>, <calculator:atomicmodule>, <calculator:atomicassembly>], e * 4);
    recipeAmount += 1;
}