import mods.buildcraft.AssemblyTable;

recipes.remove(<environmentaltech:structure_frame_1>);
recipes.remove(<environmentaltech:interconnect>);

AssemblyTable.addRecipe(<gendustry:industrial_apiary>, 100000, [<forestry:chipsets:3>.withTag({T: 3 as short}) * 4, <forestry:crafting_material:1> * 4, <planttech2:biomass> * 4]);
AssemblyTable.addRecipe(<environmentaltech:structure_frame_1>, 5000, [<environmentaltech:interconnect>, <environmentaltech:litherite_crystal> * 4, <forestry:thermionic_tubes:7> * 2]);
AssemblyTable.addRecipe(<environmentaltech:interconnect>, 5000, [<forestry:thermionic_tubes:7> * 2, <valkyrielib:modifier_component> * 4, <environmentaltech:connector> * 4]);
AssemblyTable.addRecipe(<immersiveengineering:stone_decoration:1>, 5000, [<minecraft:obsidian>, <magneticraft:heavy_plates:2>, <magneticraft:heavy_plates>]);
AssemblyTable.addRecipe(<calculator:atomicassembly>, 100000, [<calculator:advancedassembly> * 16, <calculator:atomicmodule> * 16, <psi:material:2> * 128]);
AssemblyTable.addRecipe(<modularmachinery:wither_controller>, 100000, [<minecraft:nether_star>, <forestry:thermionic_tubes:7> * 16, <enderio:block_reinforced_obsidian> * 32]);
AssemblyTable.addRecipe(<modularmachinery:dragon_controller>, 100000, [<minecraft:nether_star>* 16, <forestry:chipsets:3>.withTag({T: 3 as short}) * 16, <minecraft:obsidian> * 64]);