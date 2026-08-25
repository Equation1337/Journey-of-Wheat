#priority 50
#loader crafttweaker reloadable

import mods.nuclearcraft.AlloyFurnace;

AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:2>);
AlloyFurnace.removeRecipeWithOutput(<enderio:item_alloy_endergy_ingot:3> * 2);
AlloyFurnace.addRecipe(<contenttweaker:crystal_dust>, <nuclearcraft:compound:1>, <contenttweaker:cirs_white> * 8);