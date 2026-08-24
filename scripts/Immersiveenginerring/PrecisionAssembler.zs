import mods.immersiveintelligence.PrecisionAssembler;

PrecisionAssembler.removeRecipe(<immersiveintelligence:material:1>);
PrecisionAssembler.removeRecipe(<immersiveengineering:material:26> * 4);

mods.immersiveintelligence.PrecisionAssembler.addRecipe(<immersiveintelligence:material:1>,null,[<immersiveengineering:material:26>, <forestry:chipsets:3>.withTag({T: 3 as short}), <ore:plateNickel>, <minecraft:redstone> * 4], ["inserter","solderer","drill"], ["inserter pick first","solderer work second","drill work third"], 8000, 1);