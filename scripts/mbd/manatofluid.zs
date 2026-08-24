#loader multiblocked

import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.recipe.RecipeMap;

var definition as ComponentDefinition = MBDRegistry.getDefinition("equation:mana_to_fluid_1");
var ebf = definition as ControllerDefinition;

ebf.recipeMap.start()
    .duration(1)
    .inputMana(1000)
    .outputFluids(<liquid:mana_fluid> * 1)
    .buildAndRegister();

