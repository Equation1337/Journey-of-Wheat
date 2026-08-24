#loader multiblocked

import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.recipe.RecipeMap;

var definition as ComponentDefinition = MBDRegistry.getDefinition("equation:fluid_tranfer");
var ebf = definition as ControllerDefinition;
ebf.recipeMap.start()
    .duration(40)
    .inputFE(50000)
    .inputFluids(<liquid:redstone>*1000)
    .inputItems(<immersiveengineering:metal:7>)
    .outputItems(<contenttweaker:ingot_electrum_flux>)
    .buildAndRegister();