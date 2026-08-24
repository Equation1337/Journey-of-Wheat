#loader multiblocked

import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.recipe.RecipeMap;

var definition as ComponentDefinition = MBDRegistry.getDefinition("equation:chaoguangsu");
var ebf = definition as ControllerDefinition;
ebf.recipeMap.start()
    .duration(40)
    .inputFE(2147483647)
    .inputItems(<contenttweaker:zhizi_guan>, <contenttweaker:zhongzi_guan>, <contenttweaker:zhengdianzi_guan>, <contenttweaker:guangzi_guan>, <contenttweaker:jiaozi_guan>, <contenttweaker:fandaohe_guan>, <contenttweaker:paijiezi+_guan>)
    .outputItems(<contenttweaker:ke> * 6, <contenttweaker:dragon_guan>)
    .buildAndRegister();