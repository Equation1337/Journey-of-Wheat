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

RecipeBuilder.newBuilder("dragon_mk2_1", "dragon_mk2", 200)
    .addRecipeTooltip("§c需要缺陷等级以上模型才能工作", "§a每次工作模型有概率降级", "§a不同等级的模型降级概率不同", "§a基础/高级/卓越/自我意识", "§a100%/80%/50%/10%")
    .addItemInput(<deepmoblearning:data_model_dragon>).setChance(0).setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        val tier = D(item.tag).getInt("tier", 0);
        return tier >= 1;
    })
    .addFinishHandler(function (event as RecipeFinishEvent){
        val ctrl = event.controller;
        val world = ctrl.world;
        val pos = ctrl.pos;
        var roll = world.getRandom().nextInt(0,100);
        val iitem = world.getItemHandler(pos.createPosByFacing(ctrl.facing, 0, -4, -3));
        if (!world.remote && !isNull(iitem)) {
            val item = iitem.getStackInSlot(0);
            if (!isNull(item.tag)) {
                val nbt as int = isNull(item.tag.tier) ? 0 : item.tag.tier.asInt();
                val nbt_1 as int = nbt - 1;
                if (nbt == 4 && roll >= 90) {
                    iitem.setStackInSlot(0, <deepmoblearning:data_model_dragon>.withTag({tier: nbt_1}));
                }
                if (nbt == 3 && roll >= 50) {
                    iitem.setStackInSlot(0, <deepmoblearning:data_model_dragon>.withTag({tier: nbt_1}));
                }
                if (nbt == 2 && roll >= 20) {
                    iitem.setStackInSlot(0, <deepmoblearning:data_model_dragon>.withTag({tier: nbt_1}));
                }
                if (nbt == 1) {
                    iitem.setStackInSlot(0, <deepmoblearning:data_model_dragon>);
                }
            }
        }
    })
    .addItemOutput(<draconicevolution:dragon_heart>)
    .addFluidPerTickOutput(<liquid:dragon_blood> * 100)
    .addEnergyPerTickInput(1000000000)
    .build();