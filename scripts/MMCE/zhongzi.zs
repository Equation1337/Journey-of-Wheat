#priority 50
#loader crafttweaker reloadable

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MachineModifier;

MachineModifier.setMaxThreads("zhongzi", 16);

RecipeBuilder.newBuilder("zhongzi_1", "zhongzi", 30)
    .addEnergyPerTickInput(1000000)
    .setAltitude(0, 64)
    .addItemOutput(<avaritia:resource:2> * 2)
    .build();
RecipeBuilder.newBuilder("zhongzi_2", "zhongzi", 30)
    .addEnergyPerTickInput(1250000)
    .setAltitude(65, 128)
    .addItemOutput(<avaritia:resource:2> * 4)
    .build();
RecipeBuilder.newBuilder("zhongzi_3", "zhongzi", 30)
    .addEnergyPerTickInput(1500000)
    .setAltitude(129, 192)
    .addItemOutput(<avaritia:resource:2> * 6)
    .build();
RecipeBuilder.newBuilder("zhongzi_4", "zhongzi", 30)
    .addEnergyPerTickInput(2000000)
    .setAltitude(193, 256)
    .addItemOutput(<avaritia:resource:2> * 9)
    .build();