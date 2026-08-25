import mods.pneumaticcraft.pressurechamber;

pressurechamber.removeRecipe([<pneumaticcraft:ingot_iron_compressed>]);
pressurechamber.removeRecipe([<pneumaticcraft:compressed_iron_block>]);
pressurechamber.removeRecipe([<forge:bucketfilled>.withTag({FluidName: "etchacid", Amount: 1000})]);
pressurechamber.removeRecipe([<pneumaticcraft:capacitor>]);
pressurechamber.removeRecipe([<pneumaticcraft:transistor>]);
pressurechamber.removeRecipe([<pneumaticcraft:empty_pcb:100>]);

pressurechamber.addRecipe([<pneumaticcraft:plastic:6>, <pneumaticcraft:plastic:15>, <pneumaticcraft:ingot_iron_compressed>, <calculator:redstoneingot>, <calculator:largetanzanite>], 2.0, [<pneumaticcraft:capacitor>]);
pressurechamber.addRecipe([<pneumaticcraft:plastic>, <pneumaticcraft:plastic:15>, <pneumaticcraft:ingot_iron_compressed>, <calculator:redstoneingot>, <calculator:electricdiamond>], 2.0, [<pneumaticcraft:transistor>]);
pressurechamber.addRecipe([<calculator:reinforcedironingot>], 2.0, [<pneumaticcraft:ingot_iron_compressed>]);
pressurechamber.addRecipe([<calculator:material:3>], 2.0, [<pneumaticcraft:compressed_iron_block>]);
pressurechamber.addRecipe([<calculator:material:8>, <pneumaticcraft:plastic:10> * 16, <pneumaticcraft:plastic:8> * 16, <pneumaticcraft:plastic> * 16, <pneumaticcraft:gps_tool>, <pneumaticcraft:air_canister>, <pneumaticcraft:ingot_iron_compressed> * 16], 2.5, [<pneumaticcraft:amadron_tablet>]);
pressurechamber.addRecipe([<forge:bucketfilled>.withTag({FluidName: "etching_acid", Amount: 1000}), <forge:bucketfilled>.withTag({FluidName: "hydrofluoric_acid", Amount: 1000}), <pneumaticcraft:plastic:2> * 8, <minecraft:rotten_flesh> * 32, <minecraft:gunpowder> * 32, <minecraft:spider_eye> * 32], 2.0, [<forge:bucketfilled>.withTag({FluidName: "etchacid", Amount: 1000})]);
pressurechamber.addRecipe([<pneumaticcraft:plastic:2>, <pneumaticcraft:ingot_iron_compressed>, <immersiveengineering:material:27>], 2.5, [<pneumaticcraft:empty_pcb:100>]);
pressurechamber.addRecipe([<pneumaticcraft:unassembled_pcb>, <pneumaticcraft:capacitor> * 4, <pneumaticcraft:transistor> * 4], 2.5, [<pneumaticcraft:printed_circuit_board>]);
pressurechamber.addRecipe([<pneumaticcraft:plastic:15>, <pneumaticcraft:ingot_iron_compressed>, <calculator:enrichedgoldingot>, <refraction:reflective_alloy>, <calculator:enddiamond>], 3.0, [<modularmachinery:itemmodularium> * 3]);
pressurechamber.addRecipe([<pneumaticcraft:printed_circuit_board> * 8, <extrautils2:ingredients> * 32, <pneumaticcraft:plastic> * 16, <pneumaticcraft:compressed_iron_block> * 4], 4.0, [<extrautils2:resonator>]);
pressurechamber.addRecipe([<extrautils2:machine> * 2, <minecraft:enchanted_book>, <extrautils2:decorativesolidwood:1> * 16, <thaumicbases:overchanter>], 4.0, [<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"})]);
pressurechamber.addRecipe([<modularmachinery:blockcasing:4> * 64, <modularmachinery:blockcasing:5> * 32, <modularmachinery:blockcasing:3> * 32, <pneumaticcraft:printed_circuit_board> * 64, <calculator:atomicassembly> * 16, <calculator:material:8> * 16, <contenttweaker:life_core>, <efab:upgrade_power>, <efab:upgrade_digital>], 4.0, [<modularmachinery:assembly_line_factory_controller>]);
pressurechamber.addRecipe([<ic2:crafting:3> * 4, <ic2:misc_resource:1> * 4, <calculator:enddiamond> * 4, <immersiveintelligence:material:17> * 2], 3.0, [<ic2:crafting:4>]);
pressurechamber.addRecipe([<modularmachinery:blockcasing>, <pneumaticcraft:plastic> * 64, <pneumaticcraft:printed_circuit_board> * 16, <immersiveengineering:metal_device1:7> * 16], 4.0, [<modularmachinery:drill_controller>]);
pressurechamber.addRecipe([<modularmachinery:blockcasing>, <pneumaticcraft:plastic:7> * 64, <pneumaticcraft:printed_circuit_board> * 16, <pneumaticcraft:plastic_mixer> * 16], 4.0, [<modularmachinery:plastic_factory_controller>]);