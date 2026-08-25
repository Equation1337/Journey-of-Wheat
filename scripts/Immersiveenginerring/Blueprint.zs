import mods.immersiveengineering.Blueprint;

Blueprint.removeRecipe(<immersiveengineering:material:26> * 3);
Blueprint.removeRecipe(<immersiveintelligence:material:2> * 3);
Blueprint.removeRecipe(<immersiveintelligence:material:10>);
Blueprint.removeRecipe(<immersiveintelligence:material:5>);
Blueprint.removeRecipe(<immersiveengineering:material:8>);
Blueprint.removeRecipe(<immersiveengineering:material:9>);

Blueprint.addRecipe("components", <immersiveengineering:material:26> * 3, [<ore:plateNickel>, <immersiveengineering:material:20>, <ore:plateSteel>, <forestry:thermionic_tubes:7>, <forestry:crafting_material:1>]);
Blueprint.addRecipe("components", <immersiveengineering:material:8> * 2, [<ore:gearIron>, <forestry:impregnated_casing>]);
Blueprint.addRecipe("components", <immersiveengineering:material:9> * 2, [<ore:gearSteel>, <forestry:impregnated_casing>]);
Blueprint.addRecipe("basic_circuits", <immersiveintelligence:material:2>, [<contenttweaker:oil_plate>, <immersiveengineering:stone_decoration:8>, <immersiveengineering:material:20>, <forestry:crafting_material:1>]);