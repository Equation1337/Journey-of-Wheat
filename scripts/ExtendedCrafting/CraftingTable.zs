import mods.extendedcrafting.TableCrafting;

TableCrafting.addShaped(1, <extendedcrafting:table_advanced>, [
	[<extendedcrafting:material:15>, <extendedcrafting:material:9>, <extendedcrafting:material:15>], 
	[<extendedcrafting:table_basic>, <ore:blockGold>, <extendedcrafting:table_basic>], 
	[<extendedcrafting:material:15>, <extendedcrafting:material:2>, <extendedcrafting:material:15>]
]);

TableCrafting.addShaped(1, <extendedcrafting:material:15> * 4, [
	[<extendedcrafting:material:14>, <extendedcrafting:material:14>, <extendedcrafting:material:14>], 
	[<extendedcrafting:material:7>, <extendedcrafting:material:7>, <extendedcrafting:material:14>], 
	[<mets:super_circuit>, <extendedcrafting:material:7>, <extendedcrafting:material:14>]
]);

TableCrafting.addShaped(1, <extendedcrafting:material:9>, [
	[<mets:niobium_titanium_plate>, <extendedcrafting:material:15>, <mets:niobium_titanium_plate>], 
	[<extendedcrafting:material:15>, <ore:circuitUltimate>, <extendedcrafting:material:15>], 
	[<mets:niobium_titanium_plate>, <extendedcrafting:material:15>, <mets:niobium_titanium_plate>]
]);

TableCrafting.addShaped(1, <deepmoblearning:soot_covered_plate> * 4, [
	[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>], 
	[<enderio:block_reinforced_obsidian>, <ore:ingotDarkSteel>, <enderio:block_reinforced_obsidian>], 
	[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>]
]);

TableCrafting.addShaped(2, <deepmoblearningbm:digital_agonizer>, [
	[<bloodmagic:inscription_tool:5>, <bloodmagic:blood_rune:3>, <bloodmagic:slate:3>, <bloodmagic:blood_rune:3>, <bloodmagic:inscription_tool:5>], 
	[<bloodmagic:blood_rune:3>, <bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "corrosive"}), <deepmoblearning:machine_casing>, <bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "vengeful"}), <bloodmagic:blood_rune:3>], 
	[<bloodmagic:slate:3>, <mets:living_circuit>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}), <mets:living_circuit>, <bloodmagic:slate:3>], 
	[<bloodmagic:blood_rune:3>, <bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "destructive"}), <deepmoblearning:machine_casing>, <bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "steadfast"}), <bloodmagic:blood_rune:3>], 
	[<bloodmagic:inscription_tool:5>, <bloodmagic:blood_rune:3>, <bloodmagic:slate:3>, <bloodmagic:blood_rune:3>, <bloodmagic:inscription_tool:5>]
]);

TableCrafting.addShaped(2, <ic2:te:61>, [
	[<contenttweaker:mobiwusi_ingot>, <ore:cesium>, <contenttweaker:mobiwusi_ingot>, <ore:cesium>, <contenttweaker:mobiwusi_ingot>], 
	[<ore:cesium>, <ore:circuitUltimate>, <ore:machineBlockAdvanced>, <ore:circuitUltimate>, <ore:cesium>], 
	[<contenttweaker:mobiwusi_ingot>, <ore:machineBlockAdvanced>, <advanced_solar_panels:crafting:13>, <ore:machineBlockAdvanced>, <contenttweaker:mobiwusi_ingot>], 
	[<ore:cesium>, <ore:circuitUltimate>, <ore:machineBlockAdvanced>, <ore:circuitUltimate>, <ore:cesium>], 
	[<contenttweaker:mobiwusi_ingot>, <ore:cesium>, <contenttweaker:mobiwusi_ingot>, <ore:cesium>, <contenttweaker:mobiwusi_ingot>]
]);

TableCrafting.addShaped(2, <ic2:te:63>, [
	[<mets:te:34>, <mets:super_iridium_compress_plate>, <ore:circuitUltimate>, <mets:super_iridium_compress_plate>, <mets:te:34>], 
	[<mets:super_iridium_compress_plate>, <advanced_solar_panels:crafting:13>, <ic2:te:61>, <advanced_solar_panels:crafting:13>, <mets:super_iridium_compress_plate>], 
	[<ore:circuitUltimate>, <ic2:te:61>, <ore:craftingMolecularTransformer>, <ic2:te:61>, <ore:circuitUltimate>], 
	[<mets:super_iridium_compress_plate>, <advanced_solar_panels:crafting:13>, <ic2:te:61>, <advanced_solar_panels:crafting:13>, <mets:super_iridium_compress_plate>], 
	[<mets:te:34>, <mets:super_iridium_compress_plate>, <ore:circuitUltimate>, <mets:super_iridium_compress_plate>, <mets:te:34>]
]);

TableCrafting.addShaped(2, <mets:te:22>, [
	[<ic2:te:61>, <mets:te:34>, <mets:field_generator>, <mets:te:34>, <ic2:te:61>], 
	[<mets:te:34>, <ore:circuitProcessor>, <ore:machineBlockAdvanced>, <ore:circuitProcessor>, <mets:te:34>], 
	[<mets:field_generator>, <ore:machineBlockAdvanced>, <ore:craftingMolecularTransformer>, <ore:machineBlockAdvanced>, <mets:field_generator>], 
	[<mets:te:34>, <ore:circuitProcessor>, <ore:machineBlockAdvanced>, <ore:circuitProcessor>, <mets:te:34>], 
	[<ic2:te:61>, <mets:te:34>, <mets:field_generator>, <mets:te:34>, <ic2:te:61>]
]);

TableCrafting.addShaped(2, <environmentaltech:structure_frame_5> * 3, [
	[<ore:circuitUltimate>, <ore:crystalIonite>, <environmentaltech:mica>, <ore:crystalIonite>, <ore:circuitUltimate>], 
	[<ore:crystalIonite>, <mets:neutron_plate>, <environmentaltech:structure_frame_4>, <mets:neutron_plate>, <ore:crystalIonite>], 
	[<environmentaltech:mica>, <environmentaltech:structure_frame_4>, <mets:super_iridium_compress_plate>, <environmentaltech:structure_frame_4>, <environmentaltech:mica>], 
	[<ore:crystalIonite>, <mets:neutron_plate>, <environmentaltech:structure_frame_4>, <mets:neutron_plate>, <ore:crystalIonite>], 
	[<ore:circuitUltimate>, <ore:crystalIonite>, <environmentaltech:mica>, <ore:crystalIonite>, <ore:circuitUltimate>]
]);

TableCrafting.addShaped(2, <environmentaltech:void_ore_miner_cont_5>, [
	[<mets:neutron_plate>, <mets:neutron_plate>, <mets:neutron_plate>, <mets:neutron_plate>, <mets:neutron_plate>], 
	[<mets:neutron_plate>, <ore:blockIonite>, <mets:field_generator>, <ore:blockIonite>, <mets:neutron_plate>], 
	[<mets:neutron_plate>, <mets:field_generator>, <environmentaltech:void_ore_miner_cont_4>, <mets:field_generator>, <mets:neutron_plate>], 
	[<mets:neutron_plate>, <ore:blockIonite>, <ore:etLaserLens>, <ore:blockIonite>, <mets:neutron_plate>], 
	[<extendedcrafting:material:9>, <extendedcrafting:material:9>, <ore:etLaserLens>, <extendedcrafting:material:9>, <extendedcrafting:material:9>]
]);

TableCrafting.addShaped(2, <environmentaltech:solar_cont_5>, [
	[<ore:etSolarCell>, <ore:etSolarCell>, <extendedcrafting:material:9>, <ore:etSolarCell>, <ore:etSolarCell>], 
	[<mets:neutron_plate>, <ore:blockIonite>, <extendedcrafting:material:9>, <ore:blockIonite>, <mets:neutron_plate>], 
	[<mets:neutron_plate>, <mets:field_generator>, <environmentaltech:solar_cont_4>, <mets:field_generator>, <mets:neutron_plate>], 
	[<mets:neutron_plate>, <ore:blockIonite>, <mets:field_generator>, <ore:blockIonite>, <mets:neutron_plate>], 
	[<mets:neutron_plate>, <mets:neutron_plate>, <mets:neutron_plate>, <mets:neutron_plate>, <mets:neutron_plate>]
]);

TableCrafting.addShaped(2, <modularmachinery:dianci_factory_controller>, [
	[null, null, <mets:geomagnetic_antenna>, null, null], 
	[null, <mets:geomagnetic_antenna>, <mets:geomagnetic_antenna>, <mets:geomagnetic_antenna>, null], 
	[<mets:geomagnetic_antenna>, <mets:geomagnetic_antenna>, <mets:te:21>, <mets:geomagnetic_antenna>, <mets:geomagnetic_antenna>], 
	[<mets:geomagnetic_pedestal>, <mets:te:21>, <mets:te:21>, <mets:te:21>, <mets:geomagnetic_pedestal>], 
	[<mets:geomagnetic_pedestal>, <mets:geomagnetic_pedestal>, <mets:geomagnetic_pedestal>, <mets:geomagnetic_pedestal>, <mets:geomagnetic_pedestal>]
]);

TableCrafting.addShaped(2, <modularmachinery:uu_factory_controller>, [
	[<mets:te:34>, <mets:super_iridium_compress_plate>, <ore:circuitUltimate>, <mets:super_iridium_compress_plate>, <mets:te:34>], 
	[<mets:super_iridium_compress_plate>, <advanced_solar_panels:crafting:13>, <ic2:te:61>, <advanced_solar_panels:crafting:13>, <mets:super_iridium_compress_plate>], 
	[<ore:circuitUltimate>, <ic2:te:61>, <mets:te:22>, <ic2:te:61>, <ore:circuitUltimate>], 
	[<mets:super_iridium_compress_plate>, <advanced_solar_panels:crafting:13>, <ic2:te:61>, <advanced_solar_panels:crafting:13>, <mets:super_iridium_compress_plate>], 
	[<mets:te:34>, <mets:super_iridium_compress_plate>, <ore:circuitUltimate>, <mets:super_iridium_compress_plate>, <mets:te:34>]
]);

TableCrafting.addShaped(2, <modularmachinery:zhuangpei_factory_controller>, [
	[<bloodmagic:slate:4>, <modularmachinery:blockcasing:5>, <mets:neutron_plate>, <modularmachinery:blockcasing:5>, <bloodmagic:slate:4>], 
	[<modularmachinery:blockcasing:5>, <ore:craftingMTCore>, <mets:field_generator>, <ore:craftingMTCore>, <modularmachinery:blockcasing:5>], 
	[<mets:neutron_plate>, <mets:field_generator>, <modularmachinery:assembly_line_factory_controller>, <mets:field_generator>, <mets:neutron_plate>], 
	[<modularmachinery:blockcasing:5>, <ore:craftingMTCore>, <mets:field_generator>, <ore:craftingMTCore>, <modularmachinery:blockcasing:5>], 
	[<bloodmagic:slate:4>, <modularmachinery:blockcasing:5>, <mets:neutron_plate>, <modularmachinery:blockcasing:5>, <bloodmagic:slate:4>]
]);

TableCrafting.addShaped(2, <extendedcrafting:material:16> * 3, [
	[null, null, null, <ore:ingotCrystalMatrix>, null], 
	[<ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>, <ore:ingotCrystalMatrix>], 
	[null, <extendedcrafting:material:15>, <extendedcrafting:material:15>, <ore:ingotCrystalMatrix>, null], 
	[null, <extendedcrafting:material:15>, <extendedcrafting:material:15>, <ore:ingotCrystalMatrix>, null], 
	[null, null, null, <ore:ingotCrystalMatrix>, null]
]);

TableCrafting.addShaped(3, <avaritia:extreme_crafting_table>, [
	[<ore:plateCrystalMatrix>, <extendedcrafting:material:12>, <ore:plateCrystalMatrix>, <extendedcrafting:material:12>, <ore:plateCrystalMatrix>, <extendedcrafting:material:12>, <ore:plateCrystalMatrix>], 
	[<extendedcrafting:material:12>, <ore:craftingMTCore>, <ore:ingotStellarAlloy>, <ore:craftingMTCore>, <ore:ingotStellarAlloy>, <ore:craftingMTCore>, <extendedcrafting:material:12>], 
	[<ore:plateCrystalMatrix>, <ore:ingotStellarAlloy>, <avaritia:double_compressed_crafting_table>, <extendedcrafting:material:10>, <avaritia:double_compressed_crafting_table>, <ore:ingotStellarAlloy>, <ore:plateCrystalMatrix>], 
	[<extendedcrafting:material:12>, <ore:craftingMTCore>, <extendedcrafting:material:10>, <ore:blockCrystalMatrix>, <extendedcrafting:material:10>, <ore:craftingMTCore>, <extendedcrafting:material:12>], 
	[<ore:plateCrystalMatrix>, <ore:ingotStellarAlloy>, <avaritia:double_compressed_crafting_table>, <extendedcrafting:material:10>, <avaritia:double_compressed_crafting_table>, <ore:ingotStellarAlloy>, <ore:plateCrystalMatrix>], 
	[<extendedcrafting:material:12>, <ore:craftingMTCore>, <ore:ingotStellarAlloy>, <ore:craftingMTCore>, <ore:ingotStellarAlloy>, <ore:craftingMTCore>, <extendedcrafting:material:12>], 
	[<ore:plateCrystalMatrix>, <extendedcrafting:material:12>, <ore:plateCrystalMatrix>, <extendedcrafting:material:12>, <ore:plateCrystalMatrix>, <extendedcrafting:material:12>, <ore:plateCrystalMatrix>]
]);

TableCrafting.addShaped(3, <extendedcrafting:material:18> * 6, [
	[null, null, null, null, null, <ore:ingotCrystaltine>, null], 
	[<ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotCrystaltine>, <ore:ingotCrystaltine>], 
	[null, null, <extendedcrafting:material:16>, <extendedcrafting:material:16>, <extendedcrafting:material:16>, <ore:ingotCrystaltine>, null], 
	[null, null, <extendedcrafting:material:16>, <extendedcrafting:material:16>, <extendedcrafting:material:16>, <ore:ingotCrystaltine>, null], 
	[null, null, <extendedcrafting:material:16>, <extendedcrafting:material:16>, <extendedcrafting:material:16>, <ore:ingotCrystaltine>, null], 
	[null, null, null, null, null, <ore:ingotCrystaltine>, null], 
	[null, null, null, null, null, <ore:ingotCrystaltine>, null]
]);

TableCrafting.addShaped(3, <avaritia:cosmic_meatballs> * 12, [
	[null, null, null, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, null, null], 
	[null, null, <ore:ingotCosmicNeutronium>, <minecraft:cooked_chicken>, <minecraft:cooked_rabbit>, <ore:ingotCosmicNeutronium>, null], 
	[null, null, <ore:ingotCosmicNeutronium>, <minecraft:cooked_mutton>, <minecraft:cooked_beef>, <ore:ingotCosmicNeutronium>, null], 
	[null, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, null], 
	[<ore:ingotCosmicNeutronium>, <minecraft:cooked_fish>, <minecraft:cooked_fish:1>, <ore:ingotCosmicNeutronium>, <minecraft:rotten_flesh>, <ore:ingredientKebabSeafood>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <minecraft:fish:2>, <minecraft:fish:3>, <ore:ingotCosmicNeutronium>, <tp:cooked_bacon>, <minecraft:cooked_porkchop>, <ore:ingotCosmicNeutronium>], 
	[null, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, null, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, null]
]);

TableCrafting.addShaped(3, <avaritia:ultimate_stew> * 26, [
	[null, <ore:ingotCosmicNeutronium>, <minecraft:dragon_breath>, <minecraft:speckled_melon>, <minecraft:chorus_fruit_popped>, <ore:ingotCosmicNeutronium>, null], 
	[<ore:ingotCosmicNeutronium>, <maplesyrup:pancakes:4>, <maplesyrup:pancakemix>, <maplesyrup:pancakes:1>, <maplesyrup:pancakes:2>, <maplesyrup:pancakes:3>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <tp:bams_pizza>, <futuremc:suspicious_stew>, <mysticalworld:stewed_eggplant>, <mysticalworld:beetroot_salad>, <ore:foodBread>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <minecraft:pumpkin_pie>, <minecraft:golden_carrot>, <minecraft:baked_potato>, <enderio:item_ender_food>, <tp:bacon_eggs_sandwhich>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <minecraft:rabbit_stew>, <minecraft:cake>, <minecraft:beetroot_soup>, <minecraft:cookie>, <ore:cropNetherWart>, <ore:ingotCosmicNeutronium>], 
	[null, <ore:ingotCosmicNeutronium>, <minecraft:mushroom_stew>, <tp:toasted_bread>, <minecraft:golden_apple:1>, <ore:ingotCosmicNeutronium>, null], 
	[<ore:ingotCosmicNeutronium>, null, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, null, <ore:ingotCosmicNeutronium>]
]);

TableCrafting.addShaped(3, <modularmachinery:nianheji_controller>, [
	[<ore:plateDU>, <ore:plateDU>, <ore:plateDU>, <ore:servo>, <ore:plateDU>, <ore:plateDU>, <ore:plateDU>], 
	[<ore:plateDU>, <nuclearcraft:foursmore>, <nuclearcraft:foursmore>, <avaritiaio:infinitecapacitor>, <nuclearcraft:foursmore>, <nuclearcraft:foursmore>, <ore:plateDU>], 
	[<ore:plateDU>, <nuclearcraft:foursmore>, <calculator:flawlessassembly>, <contenttweaker:gaia_heart>, <calculator:flawlessassembly>, <nuclearcraft:foursmore>, <ore:plateDU>], 
	[<ore:actuator>, <calculator:flawlessassembly>, <contenttweaker:gaia_heart>, <ore:chassis>, <contenttweaker:gaia_heart>, <calculator:flawlessassembly>, <ore:actuator>], 
	[<ore:plateDU>, <nuclearcraft:foursmore>, <calculator:flawlessassembly>, <contenttweaker:gaia_heart>, <calculator:flawlessassembly>, <nuclearcraft:foursmore>, <ore:plateDU>], 
	[<ore:plateDU>, <nuclearcraft:foursmore>, <nuclearcraft:foursmore>, <avaritiaio:infinitecapacitor>, <nuclearcraft:foursmore>, <nuclearcraft:foursmore>, <ore:plateDU>], 
	[<ore:plateDU>, <ore:plateDU>, <ore:plateDU>, <ore:motor>, <ore:plateDU>, <ore:plateDU>, <ore:plateDU>]
]);

TableCrafting.addShaped(3, <contenttweaker:num_1> * 64, [
	[null, null, null, null, null, null, null], 
	[null, <contenttweaker:cir_light_blue>, <contenttweaker:cir_pink>, <contenttweaker:cir_orange>, <contenttweaker:cir_magenta>, <contenttweaker:cir_black>, null], 
	[null, <contenttweaker:cir_red>, null, null, null, <contenttweaker:cir_lime>, null], 
	[null, <contenttweaker:cir_green>, null, null, null, <contenttweaker:cir_brown>, null], 
	[null, <contenttweaker:cir_white>, null, null, null, <contenttweaker:cir_cyan>, null], 
	[null, <contenttweaker:cir_gray>, <contenttweaker:cir_blue>, <contenttweaker:cir_light_gray>, <contenttweaker:cir_yellow>, <contenttweaker:cir_purple>, null], 
	[null, null, null, null, null, null, null]
]);

TableCrafting.addShaped(3, <modularmachinery:weiyuan_controller>, [
	[<ore:plateElite>, <ore:plateElite>, <ore:plateElite>, <avaritiaio:infinitecapacitor>, <ore:plateElite>, <ore:plateElite>, <ore:plateElite>], 
	[<ore:plateElite>, <contenttweaker:chengfang>, <appliedenergistics2:controller>, <ore:chassis>, <appliedenergistics2:controller>, <contenttweaker:quyu>, <ore:plateElite>], 
	[<ore:plateElite>, <ore:servo>, <novaeng_core:estorage_cell_item_64m>, <contenttweaker:jia>, <novaeng_core:estorage_cell_fluid_64m>, <ore:servo>, <ore:plateElite>], 
	[<avaritiaio:infinitecapacitor>, <nuclearcraft:lithium_ion_battery_elite>, <contenttweaker:jian>, <modularmachinery:blockcasing>, <contenttweaker:chu>, <nuclearcraft:lithium_ion_battery_elite>, <avaritiaio:infinitecapacitor>], 
	[<ore:plateElite>, <ore:servo>, <novaeng_core:estorage_cell_fluid_64m>, <contenttweaker:cheng>, <novaeng_core:estorage_cell_item_64m>, <ore:servo>, <ore:plateElite>], 
	[<ore:plateElite>, <contenttweaker:num_99>, <appliedenergistics2:controller>, <ore:chassis>, <appliedenergistics2:controller>, <contenttweaker:kaifang>, <ore:plateElite>], 
	[<ore:plateElite>, <ore:plateElite>, <ore:plateElite>, <avaritiaio:infinitecapacitor>, <ore:plateElite>, <ore:plateElite>, <ore:plateElite>]
]);

TableCrafting.addShaped(4, <extendedcrafting:singularity_ultimate>, [
	[<eternalsingularity:eternal_singularity>, null, null, null, <appliedenergistics2:material:48>, null, null, null, <eternalsingularity:eternal_singularity>], 
	[null, <appliedenergistics2:material:48>, null, null, <extendedcrafting:singularity:22>, null, null, <appliedenergistics2:material:48>, null], 
	[null, null, <appliedenergistics2:material:48>, <extendedcrafting:singularity>, <extendedcrafting:singularity:17>, <extendedcrafting:singularity:65>, <appliedenergistics2:material:48>, null, null], 
	[null, null, <extendedcrafting:singularity:2>, <extendedcrafting:singularity:3>, <extendedcrafting:singularity:30>, <extendedcrafting:singularity:4>, <extendedcrafting:singularity:5>, null, null], 
	[<appliedenergistics2:material:48>, <extendedcrafting:singularity:18>, <extendedcrafting:singularity:19>, <extendedcrafting:singularity:20>, <extendedcrafting:singularity:1>, <extendedcrafting:singularity:23>, <extendedcrafting:singularity:24>, <extendedcrafting:singularity:25>, <appliedenergistics2:material:48>], 
	[null, null, <extendedcrafting:singularity:31>, <extendedcrafting:singularity:32>, <extendedcrafting:singularity:34>, <extendedcrafting:singularity:35>, <extendedcrafting:singularity:27>, null, null], 
	[null, null, <appliedenergistics2:material:48>, <extendedcrafting:singularity:26>, <extendedcrafting:singularity:16>, <extendedcrafting:singularity:7>, <appliedenergistics2:material:48>, null, null], 
	[null, <appliedenergistics2:material:48>, null, null, <extendedcrafting:singularity:6>, null, null, <appliedenergistics2:material:48>, null], 
	[<eternalsingularity:eternal_singularity>, null, null, null, <appliedenergistics2:material:48>, null, null, null, <eternalsingularity:eternal_singularity>]
]);

TableCrafting.addShaped(3, <extendedcrafting:material:17> * 4, [
	[null, null, null, null, null, <extendedcrafting:material:18>, null], 
	[<extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>, <extendedcrafting:material:18>], 
	[null, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <contenttweaker:memory_matrix>, <extendedcrafting:material:18>, null], 
	[null, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <extendedcrafting:material:18>, null], 
	[null, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <extendedcrafting:material:18>, null], 
	[null, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <ore:gemBoronNitride>, <extendedcrafting:material:18>, null], 
	[null, null, null, null, null, <extendedcrafting:material:18>, null]
]);

TableCrafting.addShaped(4, <extendedcrafting:material:13>, [
	[<extendedcrafting:material:11>, null, null, null, <extendedcrafting:material:11>, null, null, null, <extendedcrafting:material:11>], 
	[null, <extendedcrafting:material:19>, null, null, <extendedcrafting:material:19>, null, null, <extendedcrafting:material:19>, null], 
	[null, null, <extendedcrafting:material:19>, null, <extendedcrafting:material:19>, null, <extendedcrafting:material:19>, null, null], 
	[null, null, null, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, null, null, null], 
	[<extendedcrafting:material:11>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <extendedcrafting:material:11>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <extendedcrafting:material:11>], 
	[null, null, null, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, null, null, null], 
	[null, null, <extendedcrafting:material:19>, null, <extendedcrafting:material:19>, null, <extendedcrafting:material:19>, null, null], 
	[null, <extendedcrafting:material:19>, null, null, <extendedcrafting:material:19>, null, null, <extendedcrafting:material:19>, null], 
	[<extendedcrafting:material:11>, null, null, null, <extendedcrafting:material:11>, null, null, null, <extendedcrafting:material:11>]
]);

TableCrafting.addShaped(4, <extendedcrafting:material:19>* 4 , [
	[null, null, null, null, null, null, null, <extendedcrafting:material:17>, null], 
	[<extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>, <extendedcrafting:material:17>], 
	[null, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <extendedcrafting:material:17>, null], 
	[null, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <extendedcrafting:material:17>, null], 
	[null, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <extendedcrafting:material:17>, null], 
	[null, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <extendedcrafting:material:17>, null], 
	[null, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <extendedcrafting:material:17>, null], 
	[null, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <extendedcrafting:material:17>, null], 
	[null, null, null, null, null, null, null, <extendedcrafting:material:17>, null]
]);

TableCrafting.addShaped(4, <extendedcrafting:compressor> * 4, [
	[<ore:blockInfinity>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <ore:blockInfinity>], 
	[<extendedcrafting:frame>, <mets:te:7>, <ore:compressed3xDustBedrock>, <avaritiaddons:infinity_compressor>, <nuclearcraft:pressurizer>, <avaritiaddons:infinity_compressor>, <ore:compressed3xDustBedrock>, <mets:te:7>, <extendedcrafting:frame>], 
	[<extendedcrafting:frame>, <ore:compressed3xDustBedrock>, <modularmachinery:stellar_factory_controller>, <ore:blockCosmicNeutronium>, <ore:blockCosmicNeutronium>, <ore:blockCosmicNeutronium>, <modularmachinery:stellar_factory_controller>, <ore:compressed3xDustBedrock>, <extendedcrafting:frame>], 
	[<extendedcrafting:frame>, <avaritiaddons:infinity_compressor>, <ore:blockCosmicNeutronium>, <contenttweaker:memory_matrix>, <astralsorcery:itemperkgem>, <contenttweaker:memory_matrix>, <ore:blockCosmicNeutronium>, <avaritiaddons:infinity_compressor>, <extendedcrafting:frame>], 
	[<extendedcrafting:frame>, <nuclearcraft:pressurizer>, <ore:blockCosmicNeutronium>, <astralsorcery:itemperkgem:1>, <extendedcrafting:material:13>, <astralsorcery:itemperkgem:2>, <ore:blockCosmicNeutronium>, <nuclearcraft:pressurizer>, <extendedcrafting:frame>], 
	[<extendedcrafting:frame>, <avaritiaddons:infinity_compressor>, <ore:blockCosmicNeutronium>, <contenttweaker:memory_matrix>, <astralsorcery:itemperkgem>, <contenttweaker:memory_matrix>, <ore:blockCosmicNeutronium>, <avaritiaddons:infinity_compressor>, <extendedcrafting:frame>], 
	[<extendedcrafting:frame>, <ore:compressed3xDustBedrock>, <modularmachinery:stellar_factory_controller>, <ore:blockCosmicNeutronium>, <ore:blockCosmicNeutronium>, <ore:blockCosmicNeutronium>, <modularmachinery:stellar_factory_controller>, <ore:compressed3xDustBedrock>, <extendedcrafting:frame>], 
	[<extendedcrafting:frame>, <mets:te:7>, <ore:compressed3xDustBedrock>, <avaritiaddons:infinity_compressor>, <nuclearcraft:pressurizer>, <avaritiaddons:infinity_compressor>, <ore:compressed3xDustBedrock>, <mets:te:7>, <extendedcrafting:frame>], 
	[<ore:blockInfinity>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <extendedcrafting:frame>, <ore:blockInfinity>]
]);

TableCrafting.addShaped(4, <modularmachinery:jidian_controller>, [
	[<modularmachinery:blockcasing>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <modularmachinery:blockcasing>], 
	[<ore:plateInfinity>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <draconicevolution:chaotic_core>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <ore:plateInfinity>], 
	[<ore:plateInfinity>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <draconicevolution:chaotic_core>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <ore:plateInfinity>], 
	[<ore:plateInfinity>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <extendedcrafting:singularity_ultimate>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <ore:plateInfinity>], 
	[<ore:plateInfinity>, <draconicevolution:chaotic_core>, <draconicevolution:chaotic_core>, <extendedcrafting:singularity_ultimate>, <modularmachinery:blockcasing>, <extendedcrafting:singularity_ultimate>, <draconicevolution:chaotic_core>, <draconicevolution:chaotic_core>, <ore:plateInfinity>], 
	[<ore:plateInfinity>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <extendedcrafting:singularity_ultimate>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <ore:plateInfinity>], 
	[<ore:plateInfinity>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <draconicevolution:chaotic_core>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <ore:plateInfinity>], 
	[<ore:plateInfinity>, <contenttweaker:memory_matrix>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <draconicevolution:chaotic_core>, <extendedcrafting:material:19>, <extendedcrafting:material:19>, <contenttweaker:memory_matrix>, <ore:plateInfinity>], 
	[<modularmachinery:blockcasing>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <ore:plateInfinity>, <modularmachinery:blockcasing>]
]);

TableCrafting.addShaped(4, <modularmachinery:sun_controller>, [
	[<modularmachinery:blockcasing>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <modularmachinery:blockcasing>], 
	[<extrautils2:decorativesolid:8>, <avaritiatweaks:enhancement_crystal>, <minecraft:double_plant>, <minecraft:double_plant>, <minecraft:double_plant>, <minecraft:double_plant>, <minecraft:double_plant>, <avaritiatweaks:enhancement_crystal>, <extrautils2:decorativesolid:8>], 
	[<extrautils2:decorativesolid:8>, <contenttweaker:guangzi_guan>, <avaritiatweaks:enhancement_crystal>, <minecraft:double_plant>, <minecraft:double_plant>, <minecraft:double_plant>, <avaritiatweaks:enhancement_crystal>, <thaumictinkerer:energetic_nitor>, <extrautils2:decorativesolid:8>], 
	[<extrautils2:decorativesolid:8>, <contenttweaker:guangzi_guan>, <contenttweaker:guangzi_guan>, <avaritiatweaks:enhancement_crystal>, <extendedcrafting:singularity_ultimate>, <avaritiatweaks:enhancement_crystal>, <thaumictinkerer:energetic_nitor>, <thaumictinkerer:energetic_nitor>, <extrautils2:decorativesolid:8>], 
	[<extrautils2:decorativesolid:8>, <contenttweaker:guangzi_guan>, <contenttweaker:guangzi_guan>, <extendedcrafting:singularity_ultimate>, <contenttweaker:memory_matrix>, <extendedcrafting:singularity_ultimate>, <thaumictinkerer:energetic_nitor>, <thaumictinkerer:energetic_nitor>, <extrautils2:decorativesolid:8>], 
	[<extrautils2:decorativesolid:8>, <contenttweaker:guangzi_guan>, <contenttweaker:guangzi_guan>, <avaritiatweaks:enhancement_crystal>, <extendedcrafting:singularity_ultimate>, <avaritiatweaks:enhancement_crystal>, <thaumictinkerer:energetic_nitor>, <thaumictinkerer:energetic_nitor>, <extrautils2:decorativesolid:8>], 
	[<extrautils2:decorativesolid:8>, <contenttweaker:guangzi_guan>, <avaritiatweaks:enhancement_crystal>, <astralsorcery:itemperkgem:1>, <astralsorcery:itemperkgem:1>, <astralsorcery:itemperkgem:1>, <avaritiatweaks:enhancement_crystal>, <thaumictinkerer:energetic_nitor>, <extrautils2:decorativesolid:8>], 
	[<extrautils2:decorativesolid:8>, <avaritiatweaks:enhancement_crystal>, <astralsorcery:itemperkgem:1>, <astralsorcery:itemperkgem:1>, <astralsorcery:itemperkgem:1>, <astralsorcery:itemperkgem:1>, <astralsorcery:itemperkgem:1>, <avaritiatweaks:enhancement_crystal>, <extrautils2:decorativesolid:8>], 
	[<modularmachinery:blockcasing>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <modularmachinery:blockcasing>]
]);

TableCrafting.addShaped(4, <researchtable:table>, [
	[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <contenttweaker:memory_matrix>, <novaeng_core:estorage_cell_item_256m>, <contenttweaker:memory_matrix>, <contenttweaker:memory_matrix>, <contenttweaker:memory_matrix>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <contenttweaker:memory_matrix>, <astralsorcery:itemknowledgeshare>, <contenttweaker:memory_matrix>, <astralsorcery:itemjournal>, <novaeng_core:estorage_cell_fluid_256m>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <contenttweaker:memory_matrix>, <contenttweaker:memory_matrix>, <extendedcrafting:material:13>, <contenttweaker:memory_matrix>, <contenttweaker:memory_matrix>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <novaeng_core:estorage_cell_fluid_256m>, <thaumictinkerer:share_book>, <contenttweaker:memory_matrix>, <essentialcraft:research_book>, <contenttweaker:memory_matrix>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <contenttweaker:memory_matrix>, <contenttweaker:memory_matrix>, <contenttweaker:memory_matrix>, <novaeng_core:estorage_cell_item_256m>, <contenttweaker:memory_matrix>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <thaumicbases:knowledge_shard>, <ore:ingotUltimate>], 
	[<ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>, <ore:ingotUltimate>]
]);

TableCrafting.addShaped(4, <modularmachinery:yuanzhi_factory_controller>, [
	[<ore:blockInfinity>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockInfinity>], 
	[<ore:blockNetherStar>, <deepmoblearning:infused_ingot_block>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearning:infused_ingot_block>, <ore:blockNetherStar>], 
	[<ore:blockNetherStar>, <deepmoblearningbm:digital_agonizer>, <deepmoblearning:infused_ingot_block>, <contenttweaker:memory_matrix>, <bloodmagic:item_demon_crystal:2>, <contenttweaker:memory_matrix>, <deepmoblearning:infused_ingot_block>, <deepmoblearningbm:digital_agonizer>, <ore:blockNetherStar>], 
	[<ore:blockNetherStar>, <deepmoblearningbm:digital_agonizer>, <contenttweaker:memory_matrix>, <deepmoblearning:infused_ingot_block>, <thaumcraft:void_siphon>, <deepmoblearning:infused_ingot_block>, <contenttweaker:memory_matrix>, <deepmoblearningbm:digital_agonizer>, <ore:blockNetherStar>], 
	[<ore:blockNetherStar>, <deepmoblearningbm:digital_agonizer>, <bloodmagic:item_demon_crystal:1>, <thaumcraft:void_siphon>, <modularmachinery:blockcasing:4>, <thaumcraft:void_siphon>, <bloodmagic:item_demon_crystal:3>, <deepmoblearningbm:digital_agonizer>, <ore:blockNetherStar>], 
	[<ore:blockNetherStar>, <deepmoblearningbm:digital_agonizer>, <contenttweaker:memory_matrix>, <deepmoblearning:infused_ingot_block>, <thaumcraft:void_siphon>, <deepmoblearning:infused_ingot_block>, <contenttweaker:memory_matrix>, <deepmoblearningbm:digital_agonizer>, <ore:blockNetherStar>], 
	[<ore:blockNetherStar>, <deepmoblearningbm:digital_agonizer>, <deepmoblearning:infused_ingot_block>, <contenttweaker:memory_matrix>, <bloodmagic:item_demon_crystal:4>, <contenttweaker:memory_matrix>, <deepmoblearning:infused_ingot_block>, <deepmoblearningbm:digital_agonizer>, <ore:blockNetherStar>], 
	[<ore:blockNetherStar>, <deepmoblearning:infused_ingot_block>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearningbm:digital_will_injector>, <deepmoblearning:infused_ingot_block>, <ore:blockNetherStar>], 
	[<ore:blockInfinity>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockNetherStar>, <ore:blockInfinity>]
]);

TableCrafting.addShaped(4, <modularmachinery:jiexi_controller>, [
	[<extendedcrafting:material:13>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <extendedcrafting:material:13>], 
	[<modularmachinery:blockcasing:4>, <extendedcrafting:material:13>, <appliedenergistics2:controller>, <immersiveengineering:graphite_electrode>, <enderio:item_capacitor_stellar>, <immersiveengineering:graphite_electrode>, <appliedenergistics2:controller>, <extendedcrafting:material:13>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <appliedenergistics2:controller>, <extendedcrafting:material:13>, <extrautils2:drum:3>, <aetherworks:item_axe_prismarine>, <extrautils2:drum:3>, <extendedcrafting:material:13>, <appliedenergistics2:controller>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <immersiveengineering:graphite_electrode>, <extrautils2:drum:3>, <contenttweaker:juzhen>, <extendedcrafting:singularity_ultimate>, <contenttweaker:juzhen>, <extrautils2:drum:3>, <immersiveengineering:graphite_electrode>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <enderio:item_capacitor_stellar>, <aetherworks:item_pickaxe_aether>, <extendedcrafting:singularity_ultimate>, <ore:magic_snow_globe>, <extendedcrafting:singularity_ultimate>, <aetherworks:item_pickaxe_ember>, <enderio:item_capacitor_stellar>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <immersiveengineering:graphite_electrode>, <extrautils2:drum:3>, <contenttweaker:juzhen>, <extendedcrafting:singularity_ultimate>, <contenttweaker:juzhen>, <extrautils2:drum:3>, <immersiveengineering:graphite_electrode>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <appliedenergistics2:controller>, <extendedcrafting:material:13>, <extrautils2:drum:3>, <aetherworks:item_axe_ender>, <extrautils2:drum:3>, <extendedcrafting:material:13>, <appliedenergistics2:controller>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <extendedcrafting:material:13>, <appliedenergistics2:controller>, <immersiveengineering:graphite_electrode>, <enderio:item_capacitor_stellar>, <immersiveengineering:graphite_electrode>, <appliedenergistics2:controller>, <extendedcrafting:material:13>, <modularmachinery:blockcasing:4>], 
	[<extendedcrafting:material:13>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <extendedcrafting:material:13>]
]);

TableCrafting.addShaped(4, <appliedenergistics2:creative_storage_cell>, [
	[<appliedenergistics2:creative_energy_cell>, <botania:pool:1>, <botaniverse:morespreader:4>, <buildcraftcore:engine:3>, <bloodmagic:sacrificial_dagger:1>, <bloodmagic:activation_crystal:2>, <refraction:creative_laser>, <functionalstoragelegacy:creative_vending_upgrade>, <roots:creative_pouch>], 
	[<enderio:block_creative_spawner>, <novaeng_core:ecalculator_cell_16384m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:ecalculator_cell_16384m>, <lightningcraft:lightning_cell:3>], 
	[<embers:creative_ember_source>, <novaeng_core:estorage_cell_item_256m>, <novaeng_core:ecalculator_cell_16384m>, <ore:blockInfinity>, <ore:blockInfinity>, <ore:blockInfinity>, <novaeng_core:ecalculator_cell_16384m>, <novaeng_core:estorage_cell_item_256m>, <projectred-fabrication:ic_chip:1>], 
	[<draconicevolution:draconium_capacitor:2>, <novaeng_core:estorage_cell_item_256m>, <ore:blockInfinity>, <novaeng_core:ecalculator_cell_16384m>, <ore:blockInfinity>, <novaeng_core:ecalculator_cell_16384m>, <ore:blockInfinity>, <novaeng_core:estorage_cell_item_256m>, <qmd:creative_particle_source>], 
	[<deepmoblearning:creative_model_learner>, <novaeng_core:estorage_cell_item_256m>, <ore:blockInfinity>, <ore:blockInfinity>, <extracells:storage.casing>, <ore:blockInfinity>, <ore:blockInfinity>, <novaeng_core:estorage_cell_item_256m>, <opencomputers:material:25>], 
	[<extrautils2:passivegenerator:6>, <novaeng_core:estorage_cell_item_256m>, <ore:blockInfinity>, <novaeng_core:ecalculator_cell_16384m>, <ore:blockInfinity>, <novaeng_core:ecalculator_cell_16384m>, <ore:blockInfinity>, <novaeng_core:estorage_cell_item_256m>, <psi:cad_assembly:5>], 
	[<calculator:creativepowercube>, <novaeng_core:estorage_cell_item_256m>, <novaeng_core:ecalculator_cell_16384m>, <ore:blockInfinity>, <ore:blockInfinity>, <ore:blockInfinity>, <novaeng_core:ecalculator_cell_16384m>, <novaeng_core:estorage_cell_item_256m>, <draconicevolution:creative_rf_source>], 
	[<opencomputers:casecreative>, <novaeng_core:ecalculator_cell_16384m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:estorage_cell_fluid_256m>, <novaeng_core:ecalculator_cell_16384m>, <psicosts:creative_cell>], 
	[<ic2:te:86>, <essentialcraft:device:4>, <extrautils2:spike_creative>, <extrautils2:drum:4>, <pneumaticcraft:creative_compressor>, <opencomputers:upgrade:32>, <opencomputers:component:18>, <opencomputers:component:12>, <opencomputers:material:22>]
]);