import mods.botania.ElvenTrade;

ElvenTrade.removeRecipe(<moreplates:elementium_plate>);
ElvenTrade.removeRecipe(<botania:dreamwood>);
ElvenTrade.removeRecipe(<botanicadds:dreamrock>);
ElvenTrade.removeRecipe(<botania:storage:2>);
ElvenTrade.removeRecipe(<botania:manaresource:7>);
ElvenTrade.removeRecipe(<botania:manaresource:8>);
ElvenTrade.removeRecipe(<botania:manaresource:9>);
ElvenTrade.removeRecipe(<botania:storage:4>);

mods.botania.ElvenTrade.addRecipe([<botania:manaresource:7> * 2], [<botania:manaresource>,<psi:material:1>, <ore:ingotThaumium>]);
mods.botania.ElvenTrade.addRecipe([<botania:storage:2> * 2], [<botania:storage>,<ore:blockThaumium>,<psi:psi_decorative:1>]);
mods.botania.ElvenTrade.addRecipe([<botania:manaresource:9>], [<psi:material:2>]);
mods.botania.ElvenTrade.addRecipe([<botania:storage:4>], [<psi:psi_decorative:2>]);
mods.botania.ElvenTrade.addRecipe([<botania:manaresource:8>], [<thaumcraft:void_seed>]);
mods.botania.ElvenTrade.addRecipe([<botania:dreamwood>], [<thaumcraft:log_greatwood>]);
mods.botania.ElvenTrade.addRecipe([<botanicadds:dreamrock>], [<thaumcraft:stone_arcane>]);