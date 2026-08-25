#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MachineModifier;

MachineModifier.setInternalParallelism("zhanlipin",128);
MachineModifier.setMaxThreads("zhanlipin", 18);

function registerRecipe(Name as string, Input as IIngredient, Outputs as IIngredient[]) {
    RecipeBuilder.newBuilder(Name, "zhanlipin", 20)
        .addEnergyPerTickInput(100000)
        .addItemInput(Input)
        .addItemOutputs(Outputs)
        .build();
}

registerRecipe("z_1", <deepmoblearning:pristine_matter_blaze>, [<minecraft:blaze_rod> * 22]);
registerRecipe("z_2", <deepmoblearning:pristine_matter_creeper>, [<minecraft:gunpowder> * 64, <minecraft:skull:4> * 6]);
registerRecipe("z_3", <deepmoblearning:pristine_matter_dragon>, [<minecraft:dragon_breath> * 32, <minecraft:dragon_egg>]);
registerRecipe("z_4", <deepmoblearning:pristine_matter_enderman>, [<minecraft:ender_pearl> * 6, <minecraft:end_crystal>, <enderio:block_enderman_skull> * 2]);
registerRecipe("z_5", <deepmoblearning:pristine_matter_ghast>, [<minecraft:ghast_tear> * 8]);
registerRecipe("z_6", <deepmoblearning:pristine_matter_guardian>, [<minecraft:prismarine_shard> * 32, <minecraft:prismarine_crystals> * 32, <minecraft:fish> * 64]);
registerRecipe("z_7", <deepmoblearning:pristine_matter_shulker>, [<minecraft:shulker_shell> * 18, <minecraft:diamond> * 2]);
registerRecipe("z_8", <deepmoblearning:pristine_matter_skeleton>, [<minecraft:bone> * 64, <minecraft:arrow> * 64, <minecraft:skull> * 6]);
registerRecipe("z_9", <deepmoblearning:pristine_matter_slime>, [<minecraft:slime_ball> * 32]);
registerRecipe("z_10", <deepmoblearning:pristine_matter_spider>, [<minecraft:spider_eye> * 16, <minecraft:string> * 64, <minecraft:web> * 8]);
registerRecipe("z_11", <deepmoblearning:pristine_matter_witch>, [<minecraft:redstone> * 32, <minecraft:glowstone_dust> * 32, <minecraft:sugar> * 64]);
registerRecipe("z_12", <deepmoblearning:pristine_matter_wither>, [<minecraft:nether_star> * 3]);
registerRecipe("z_13", <deepmoblearning:pristine_matter_error>, [<deepmoblearning:glitch_heart> * 2]);
registerRecipe("z_14", <deepmoblearning:pristine_matter_gaia>, [<botania:manaresource:4>, <botania:manaresource:5> * 12]);
registerRecipe("z_15", <deepmoblearning:pristine_matter_wither_skeleton>, [<minecraft:skull:1> * 3, <minecraft:coal> * 64]);
registerRecipe("z_16", <deepmoblearning:pristine_matter_zombie>, [<minecraft:rotten_flesh> * 64, <minecraft:iron_ingot> * 16, <minecraft:carrot> * 32, <minecraft:potato> * 32]);
registerRecipe("z_17", <deepmoblearning:pristine_matter_mo_android>, [<matteroverdrive:energy_pack> * 6, <matteroverdrive:tritanium_ingot> * 4]);
registerRecipe("z_18", <deepmoblearning:pristine_matter_chaosguardian>, [<draconicevolution:chaos_shard>]);