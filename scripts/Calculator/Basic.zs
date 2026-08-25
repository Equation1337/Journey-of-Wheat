import mods.calculator.basic;

basic.removeRecipe(<calculator:enrichedgold> * 4);
basic.removeRecipe(<calculator:reinforcedironingot>);
basic.removeRecipe(<sonarcore:reinforcedstoneblock>);
basic.removeRecipe(<sonarcore:reinforcedstoneblock> * 4);

basic.addRecipe(<refraction:reflective_alloy>, <psi:material>, <calculator:enrichedgold> * 4);
basic.addRecipe(<ore:ingotSteel>, <psi:material:1>, <calculator:reinforcedironingot>);
basic.addRecipe(<lightningcraft:stone_block>, <lightningcraft:stone_block>, <sonarcore:reinforcedstoneblock> * 4);