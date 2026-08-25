import mods.immersiveengineering.ArcFurnace;

ArcFurnace.removeRecipe(<qmd:ingot:3>);
ArcFurnace.removeRecipe(<qmd:ingot:1>);

ArcFurnace.addRecipe(<enderio:item_material:51> * 6, <ore:dustQuartz> * 4, <immersiveintelligence:material_dust>, 400, 4096, [<enderio:item_material:50>, <enderio:item_material:48> * 2, <ore:dustLapis> * 2], "Alloying");
ArcFurnace.addRecipe(<enderio:item_material:67> * 4, <ore:dustQuartz> * 4, <immersiveintelligence:material_dust>, 400, 4096, [<enderio:item_material:50>, <enderio:item_material:36> * 4], "Alloying");
ArcFurnace.addRecipe(<enderio:item_material:52> * 6, <ore:dustQuartz> * 4, <immersiveintelligence:material_dust>, 400, 4096, [<enderio:item_material:50>, <enderio:item_material:49> * 2, <enderio:item_material:74> * 2], "Alloying");