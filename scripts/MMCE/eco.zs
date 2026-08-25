#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import novaeng.hypernet.HyperNetHelper;

MachineModifier.setMaxParallelism("eco", 4);

MachineModifier.setMaxThreads("eco", 0);

val drone0 = FactoryRecipeThread.createCoreThread("CPU #0");
val drone1 = FactoryRecipeThread.createCoreThread("CPU #1");
val drone2 = FactoryRecipeThread.createCoreThread("CPU #2");
val drone3 = FactoryRecipeThread.createCoreThread("CPU #3");

MachineModifier.addCoreThread("eco", drone0);
MachineModifier.addCoreThread("eco", drone1);
MachineModifier.addCoreThread("eco", drone2);
MachineModifier.addCoreThread("eco", drone3);

function registerRecipe(Name as string,Energy as long,Time as int, Inputs as IIngredient[], Fluid as ILiquidStack, Output as IIngredient) {
    RecipeBuilder.newBuilder(Name, "eco", Time)
        .addEnergyPerTickInput(Energy)
        .addFluidInput(Fluid)
        .addItemInputs(Inputs)
        .addItemOutput(Output)
        .build();
}

registerRecipe("L4_1", 65536, 600, [<ic2:crafting:4> * 4, <modularmachinery:blockcasing>, <pneumaticcraft:plastic:15> * 16, <immersiveintelligence:material:7>], <liquid:water_4> * 500, <novaeng_core:estorage_casing>);
registerRecipe("L4_2", 65536, 600, [<novaeng_core:estorage_casing>, <appliedenergistics2:interface>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:estorage_me_channel>);
registerRecipe("L4_3", 65536, 600, [<novaeng_core:estorage_casing>, <modularmachinery:blockcasing:1>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:estorage_vent>);
registerRecipe("L4_4", 65536, 600, [<novaeng_core:estorage_casing>, <appliedenergistics2:dense_energy_cell> * 4, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:estorage_energy_cell_l4>);
registerRecipe("L4_5", 65536, 600, [<novaeng_core:estorage_casing>, <appliedenergistics2:drive>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:estorage_cell_drive>);
registerRecipe("L4_6", 65536, 600, [<novaeng_core:estorage_casing>, <appliedenergistics2:controller>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:extendable_digital_storage_subsystem_l4>);
registerRecipe("L4_7", 65536, 600, [<ic2:crafting:4> * 4, <contenttweaker:mobiwusi_ingot>, <appliedenergistics2:material:38>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:estorage_cell_item_16m>);
registerRecipe("L4_8", 65536, 600, [<ic2:crafting:4> * 4, <contenttweaker:mobiwusi_ingot>, <appliedenergistics2:material:57>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:estorage_cell_fluid_16m>);
registerRecipe("L6_1", 16777216, 600, [<novaeng_core:extendable_digital_storage_subsystem_l4>, <moreplates:stellar_alloy_plate> * 16, <threng:material:14> * 16, <threng:material:6> * 16], <liquid:water_5> * 500, <novaeng_core:extendable_digital_storage_subsystem_l6>);
registerRecipe("L6_2", 16777216, 600, [<novaeng_core:estorage_energy_cell_l4>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:estorage_energy_cell_l6>);
registerRecipe("L6_3", 16777216, 600, [<novaeng_core:estorage_cell_item_16m>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:estorage_cell_item_64m>);
registerRecipe("L6_4", 16777216, 600, [<novaeng_core:estorage_cell_fluid_16m>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:estorage_cell_fluid_64m>);
registerRecipe("L9_1", 2147483647, 600, [<novaeng_core:extendable_digital_storage_subsystem_l6>, <extendedcrafting:material:32> * 256, <threng:material:14> * 256, <draconicevolution:wyvern_core> * 16], <liquid:water_7> * 500, <novaeng_core:extendable_digital_storage_subsystem_l9>);
registerRecipe("L9_2", 2147483647, 600, [<novaeng_core:estorage_energy_cell_l6>, <extendedcrafting:material:32> * 32, <threng:material:14> * 32, <draconicevolution:wyvern_core> * 4], <liquid:water_7> * 500, <novaeng_core:estorage_energy_cell_l9>);
registerRecipe("L9_3", 2147483647, 600, [<novaeng_core:estorage_cell_item_64m>, <extendedcrafting:material:32> * 32, <threng:material:14> * 32, <draconicevolution:wyvern_core> * 4], <liquid:water_7> * 500, <novaeng_core:estorage_cell_item_256m>);
registerRecipe("L9_4", 2147483647, 600, [<novaeng_core:estorage_cell_fluid_64m>, <extendedcrafting:material:32> * 32, <threng:material:14> * 32, <draconicevolution:wyvern_core> * 4], <liquid:water_7> * 500, <novaeng_core:estorage_cell_fluid_256m>);
registerRecipe("F4_1", 65536, 600, [<ic2:crafting:4> * 4, <deepmoblearning:machine_casing>, <pneumaticcraft:plastic> * 16, <immersiveintelligence:material:7>], <liquid:water_4> * 500, <novaeng_core:efabricator_casing>);
registerRecipe("F4_2", 65536, 600, [<novaeng_core:efabricator_casing>, <appliedenergistics2:interface>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:efabricator_me_channel>);
registerRecipe("F4_3", 65536, 600, [<novaeng_core:efabricator_casing>, <modularmachinery:blockcasing:1>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:efabricator_vent>);
registerRecipe("F4_4", 65536, 600, [<novaeng_core:efabricator_casing>, <appliedenergistics2:crafting_storage_64k> * 4, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:efabricator_worker>);
registerRecipe("F4_5", 65536, 600, [<novaeng_core:efabricator_casing>, <threng:big_assembler:3> * 4, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:efabricator_pattern_bus>);
registerRecipe("F4_6", 65536, 600, [<novaeng_core:efabricator_casing>, <threng:big_assembler:2>, <appliedenergistics2:material:43> * 16, <appliedenergistics2:material:44> * 16], <liquid:water_4> * 500, <novaeng_core:extendable_fabricator_subsystem_l4>);
registerRecipe("F4_7", 65536, 600, [<novaeng_core:efabricator_casing>, <threng:big_assembler:4> * 4, <appliedenergistics2:material:43> * 16, <appliedenergistics2:material:44> * 16], <liquid:water_4> * 500, <novaeng_core:efabricator_parallel_proc_l4>);
registerRecipe("F6_1", 16777216, 600, [<novaeng_core:extendable_fabricator_subsystem_l4>, <moreplates:stellar_alloy_plate> * 16, <appliedenergistics2:material:43> * 32, <appliedenergistics2:material:44> * 32], <liquid:water_5> * 500, <novaeng_core:extendable_fabricator_subsystem_l6>);
registerRecipe("F6_2", 16777216, 600, [<novaeng_core:efabricator_parallel_proc_l4>, <moreplates:stellar_alloy_plate> * 4, <appliedenergistics2:material:43> * 32, <appliedenergistics2:material:44> * 32], <liquid:water_5> * 500, <novaeng_core:efabricator_parallel_proc_l6>);
registerRecipe("F9_1", 2147483647, 600, [<novaeng_core:extendable_fabricator_subsystem_l6>, <extendedcrafting:material:32> * 256, <appliedenergistics2:material:43> * 64, <appliedenergistics2:material:44> * 64], <liquid:water_7> * 500, <novaeng_core:extendable_fabricator_subsystem_l9>);
registerRecipe("F9_2", 2147483647, 600, [<novaeng_core:efabricator_parallel_proc_l6>, <extendedcrafting:material:32> * 32, <appliedenergistics2:material:43> * 64, <appliedenergistics2:material:44> * 64], <liquid:water_7> * 500, <novaeng_core:efabricator_parallel_proc_l9>);
registerRecipe("C4_1", 65536, 600, [<mets:neutron_plate> * 4, <modularmachinery:blockcasing>, <pneumaticcraft:plastic:15> * 16, <immersiveintelligence:material:7>], <liquid:water_4> * 500, <novaeng_core:ecalculator_casing>);
registerRecipe("C4_2", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:interface>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_me_channel>);
registerRecipe("C4_3", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:drive>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_cell_drive>);
registerRecipe("C4_4", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:part:60> * 16, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_transmitter_bus>);
registerRecipe("C4_5", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:crafting_storage_64k> * 8, <appliedenergistics2:material:22> * 64, <appliedenergistics2:material:23> * 64, <appliedenergistics2:material:24> * 64], <liquid:water_4> * 500, <novaeng_core:extendable_calculator_subsystem_l4>);
registerRecipe("C4_6", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:crafting_accelerator> * 64, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_parallel_proc_l4>);
registerRecipe("C4_7", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:crafting_storage_64k> * 4, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_thread_core_l4>);
registerRecipe("C4_8", 65536, 600, [<novaeng_core:ecalculator_casing>, <appliedenergistics2:crafting_storage_64k> * 2, <mets:superconducting_cable> * 16, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_thread_core_hyper_l4>);
registerRecipe("C4_9", 65536, 600, [<novaeng_core:ecalculator_casing>, <modularmachinery:blockcasing:1> * 3, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_tail_l4>);
registerRecipe("C4_10", 65536, 600, [<mets:neutron_plate> * 16, <contenttweaker:mobiwusi_ingot> * 8,  <appliedenergistics2:crafting_storage_64k>, <appliedenergistics2:material:22> * 4, <appliedenergistics2:material:23> * 4, <appliedenergistics2:material:24> * 4], <liquid:water_4> * 500, <novaeng_core:ecalculator_cell_64m>);
registerRecipe("C6_1", 16777216, 600, [<novaeng_core:extendable_calculator_subsystem_l4>, <moreplates:stellar_alloy_plate> * 16, <threng:material:14> * 16, <threng:material:6> * 64], <liquid:water_5> * 500, <novaeng_core:extendable_calculator_subsystem_l6>);
registerRecipe("C6_2", 16777216, 600, [<novaeng_core:ecalculator_parallel_proc_l4>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:ecalculator_parallel_proc_l6>);
registerRecipe("C6_3", 16777216, 600, [<novaeng_core:ecalculator_thread_core_l4>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:ecalculator_thread_core_l6>);
registerRecipe("C6_4", 16777216, 600, [<novaeng_core:ecalculator_thread_core_hyper_l4>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:ecalculator_thread_core_hyper_l6>);
registerRecipe("C6_5", 16777216, 600, [<novaeng_core:ecalculator_tail_l4>, <moreplates:stellar_alloy_plate> * 4, <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:ecalculator_tail_l6>);
registerRecipe("C6_6", 16777216, 600, [<novaeng_core:ecalculator_cell_64m>, <moreplates:stellar_alloy_plate> * 4,  <threng:material:14> * 4, <threng:material:6> * 8], <liquid:water_5> * 500, <novaeng_core:ecalculator_cell_1024m>);
registerRecipe("C9_1", 2147483647, 600, [<novaeng_core:extendable_calculator_subsystem_l6>, <extendedcrafting:material:32> * 256, <threng:material:14> * 64, <draconicevolution:chaotic_core>], <liquid:water_7> * 500, <novaeng_core:extendable_calculator_subsystem_l9>);
registerRecipe("C9_2", 2147483647, 600, [<novaeng_core:ecalculator_parallel_proc_l6>, <extendedcrafting:material:32> * 32, <threng:material:14> * 16, <threng:material:6> * 32], <liquid:water_7> * 500, <novaeng_core:ecalculator_parallel_proc_l9>);
registerRecipe("C9_3", 2147483647, 600, [<novaeng_core:ecalculator_thread_core_l6>, <extendedcrafting:material:32> * 32, <threng:material:14> * 16, <threng:material:6> * 32], <liquid:water_7> * 500, <novaeng_core:ecalculator_thread_core_l9>);
registerRecipe("C9_4", 2147483647, 600, [<novaeng_core:ecalculator_thread_core_hyper_l6>, <extendedcrafting:material:32> * 32, <threng:material:14> * 16, <threng:material:6> * 32], <liquid:water_7> * 500, <novaeng_core:ecalculator_thread_core_hyper_l9>);
registerRecipe("C9_5", 2147483647, 600, [<novaeng_core:ecalculator_tail_l6>, <extendedcrafting:material:32> * 32, <threng:material:14> * 16, <threng:material:6> * 32], <liquid:water_7> * 500, <novaeng_core:ecalculator_tail_l9>);
registerRecipe("C9_6", 2147483647, 600, [<novaeng_core:ecalculator_cell_1024m>, <extendedcrafting:material:32> * 32,  <threng:material:14> * 16, <threng:material:6> * 32], <liquid:water_7> * 500, <novaeng_core:ecalculator_cell_16384m>);
