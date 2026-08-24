#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerModelAnimationEvent;

import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.GeoMachineModel;
 

MachineModifier.setMaxThreads("zhuangpei", 4);

GeoMachineModel.registerGeoMachineModel("zhuangpei_model", // 模型名称
    "modularmachinery:geo/zhuangpei.geo.json", // 模型文件路径
    "modularmachinery:textures/blocks/zhuangpei.png", // 模型贴图路径
    "modularmachinery:animations/zhuangpei.animation.json" // 模型动画路径
);

MachineModifier.setMachineGeoModel("zhuangpei", "zhuangpei_model");

MMEvents.onControllerModelAnimation("zhuangpei", function(event as ControllerModelAnimationEvent) {
    val ctrl = event.controller;
    event.addAnimation("assemble");
    if (ctrl.isWorking) {
        event.addAnimation("run", true);
    } else {
        event.addAnimation("standby", true);
    }
});

function registerRecipe(Name as string,Energy as long,Time as int, Inputs as IIngredient[], Fluid as ILiquidStack, Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "zhuangpei", Time)
        .addEnergyPerTickInput(Energy)
        .addItemInputs(Inputs)
        .addFluidInput(Fluid)
        .addItemOutput(Output)
        .build();
}

registerRecipe("zhuangpei_1", 6400000, 1200, [<enderio:item_material:1>, <extrautils2:decorativesolid:8> * 16, <mets:field_generator> * 4, <mets:neutron_plate> * 16, <contenttweaker:mobiwusi_ingot> * 16], <liquid:ic2uu_matter> * 1200000, <teslacorelib:machine_case>);
registerRecipe("zhuangpei_2", 6400000, 1200, [<enderio:item_material:54>, <embers:wildfire_core>, <teslacorelib:machine_case> * 4, <industrialforegoing:plastic> * 16, <bloodmagic:slate:4> * 2, <mets:neutron_plate> * 16, <contenttweaker:mobiwusi_ingot> * 4, <enderio:item_capacitor_crystalline> * 2], <liquid:if.pink_slime> * 2000, <libvulpes:structuremachine> * 12);
registerRecipe("zhuangpei_3", 12800000, 1200, [<moreplates:melodic_alloy_gear>, <enderio:item_capacitor_crystalline> * 2, <moreplates:melodic_alloy_plate> * 2, <enderio:item_alloy_ingot:8> * 6, <mets:living_circuit> * 4], <liquid:biofuel> * 2500, <enderio:item_capacitor_melodic>);
registerRecipe("zhuangpei_4", 25600000, 1200, [<moreplates:stellar_alloy_gear>, <enderio:item_capacitor_melodic> * 2, <moreplates:stellar_alloy_plate> * 2,  <astralsorcery:itemcraftingcomponent:1> * 6, <astralsorcery:itemcraftingcomponent:4> * 4,], <liquid:astralsorcery.liquidstarlight> * 16000, <enderio:item_capacitor_stellar>);
registerRecipe("zhuangpei_5", 102400000, 6000, [<environmentaltech:void_ore_miner_cont_5>, <avaritia:block_resource> * 8, <enderio:item_capacitor_stellar> * 8, <contenttweaker:infinity_dianluban> * 16], <liquid:water_7> * 16000, <environmentaltech:void_ore_miner_cont_6>);
registerRecipe("zhuangpei_6", 102400000, 6000, [<environmentaltech:solar_cont_5>, <avaritia:block_resource> * 8, <enderio:item_capacitor_stellar> * 8, <contenttweaker:infinity_dianluban> * 16], <liquid:water_7> * 16000, <environmentaltech:solar_cont_6>);
registerRecipe("zhuangpei_7", 51200000, 1200, [<avaritiatweaks:enhancement_crystal>, <threng:material:14> * 32, <bloodmagic:slate:3>, <mets:living_circuit> * 16], <liquid:rainbow> * 2000, <contenttweaker:infinity_dianluban> * 4);
registerRecipe("zhuangpei_8", 102400000, 1200, [<avaritia:resource:5> * 8, <avaritia:resource:4> * 16, <enderio:item_big_advanced_item_filter> * 4], <liquid:water_6> * 4000, <contenttweaker:infinity_guolv>);
registerRecipe("zhuangpei_9", 102400000, 3000, [<modularmachinery:blockcasing>, <avaritia:neutron_collector> * 32, <moreplates:crystal_matrix_gear> * 8, <enderio:item_capacitor_stellar>], <liquid:ic2uu_matter> * 100000000, <modularmachinery:zhongzi_factory_controller>);
registerRecipe("zhuangpei_10", 204800000, 6000, [<modularmachinery:blockcasing>, <mets:field_generator> * 64, <enderio:item_capacitor_crystalline> * 16, <efab:upgrade_power> * 16], <liquid:ic2uu_matter> * 100000000, <modularmachinery:energy_factory_controller>);
registerRecipe("zhuangpei_11", 204800000, 12000, [<modularmachinery:blockcasing>, <avaritia:neutronium_compressor> * 24, <contenttweaker:infinity_dianluban> * 8, <avaritia:block_resource> * 32], <liquid:ic2uu_matter> * 100000000, <modularmachinery:stellar_factory_controller>);
registerRecipe("zhuangpei_12", 6400000, 300, [<moreplates:end_steel_plate> * 16, <moreplates:stellar_alloy_plate> * 4, <moreplates:stellar_alloy_gear>, <mets:neutron_plate> * 16], <liquid:ic2uu_matter> * 100000, <contenttweaker:star_coil>);
registerRecipe("zhuangpei_13", 102400000, 300, [<moreplates:end_steel_plate> * 16, <moreplates:awakened_draconium_plate> * 4, <moreplates:awakened_draconium_gear>, <mets:neutron_plate> * 64], <liquid:ic2uu_matter> * 1000000, <contenttweaker:dragon_coil>);
registerRecipe("zhuangpei_14", 25600000, 300, [<moreplates:end_steel_plate> * 16, <moreplates:infinity_plate> * 4, <moreplates:infinity_gear>, <mets:neutron_plate> * 32], <liquid:ic2uu_matter> * 500000, <contenttweaker:infinity_coil>);
registerRecipe("zhuangpei_15", 204800000, 6000, [<modularmachinery:blockcasing>, <avaritiaio:infinitecapacitor>,<botania:specialflower>.withTag({type: "asgardandelion"}), <avaritiatweaks:infinitato> * 8, <botania:overgrowthseed> * 12, <botaniverse:morerune> * 64, <botaniverse:morerune:1> * 64, <botaniverse:morerune:2> * 64, <botaniverse:morerune:3> * 64], <liquid:mana_fluid> * 16000, <modularmachinery:flower_factory_controller>);
registerRecipe("zhuangpei_16", 51200000, 3000, [<deepmoblearning:data_model_blank>, <deepmoblearning:glitch_heart> * 32], <liquid:water_5> * 10000, <deepmoblearning:data_model_error>);
registerRecipe("zhuangpei_17", 51200000, 3000, [<deepmoblearning:data_model_blank>, <botania:manaresource:14> * 32, <botania:dice> * 6, <botania:overgrowthseed> * 8, <botania:ancientwill:4>, <botania:ancientwill>, <botania:ancientwill:1>, <botania:ancientwill:5>, <botania:ancientwill:3>, <botania:ancientwill:2>, <botania:pinkinator>], <liquid:water_5> * 10000, <deepmoblearning:data_model_gaia>);
registerRecipe("zhuangpei_18", 102400000, 6000, [<modularmachinery:blockcasing>, <deepmoblearning:simulation_chamber> * 512, <mets:field_generator> * 64, <deepmoblearning:polymer_clay> * 7032], <liquid:ic2uu_matter> * 100000000, <modularmachinery:moni_factory_controller>);
registerRecipe("zhuangpei_19", 102400000, 6000, [<modularmachinery:blockcasing>, <deepmoblearning:extraction_chamber> * 512, <mets:field_generator> * 64, <deepmoblearning:polymer_clay> * 7032], <liquid:water_5> * 100000000, <modularmachinery:zhanlipin_factory_controller>);
registerRecipe("zhuangpei_20", 6400000, 3000, [<extrautils2:decorativesolid:8>, <pneumaticcraft:plastic:12> * 64, <pneumaticcraft:plastic:6> * 64, <pneumaticcraft:compressed_iron_block> * 4], <liquid:ic2uu_matter> * 6400000, <deepmoblearning:polymer_clay> * 1536);
registerRecipe("zhuangpei_21", 2147483647, 6000, [<modularmachinery:blockcasing>, <contenttweaker:infinity_dianluban> * 32, <avaritiaio:infinitecapacitor>,<calculator:atomicassembly> * 12], <liquid:water_7> * 5000, <modularmachinery:computer_controller>);
registerRecipe("zhuangpei_22", 8589934588, 300, [<moreplates:end_steel_plate> * 16, <contenttweaker:haipozhen_plate> * 4, <contenttweaker:haipozhen_gear>, <mets:neutron_plate> * 128], <liquid:ic2uu_matter> * 10000000, <contenttweaker:haipozhen_coil>);