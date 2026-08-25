import mods.efabct.EFabRecipe;

EFabRecipe.shaped(<botania:blazeblock>, [[<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]])
    .tier("GEARBOX")
    .tier("LIQUID")
    .fluid(<liquid:lava> * 1000)
    .time(600);
EFabRecipe.shaped(<efab:manareceptacle>, [[<botania:livingrock>, <botania:rune:8>, <botania:livingrock>], [<botania:rune:10>, <efab:base>, <botania:rune:11>], [<botania:livingrock>, <botanicadds:rune_energy>, <botania:livingrock>]])
    .tier("GEARBOX")
    .time(3000);
EFabRecipe.shaped(<efab:upgrade_magic>, [[<botania:manaresource:1>, <botania:manaresource:2>, <botania:manaresource:1>], [<botania:manaresource:2>, <botania:storage>, <botania:manaresource:2>], [<botania:manaresource:1>, <botania:manaresource:2>, <botania:manaresource:1>]])
    .tier("GEARBOX")
    .tier("MANA")
    .manaPerTick(20)
    .time(3000);
EFabRecipe.shaped(<roots:pyre>, [[null, <ore:logWood>, null], [<ore:logWood>, <roots:terra_moss>, <ore:logWood>], [<minecraft:stone>, <roots:wildroot>, <minecraft:stone>]])
    .tier("GEARBOX")
    .tier("UPGRADE_MAGIC")
    .tier("MANA")
    .manaPerTick(20)
    .time(3000);
EFabRecipe.shaped(<efab:upgrade_armory>, [[<botania:blazeblock>, <minecraft:blaze_rod>, <botania:blazeblock>], [<minecraft:blaze_rod>, <minecraft:nether_star>, <minecraft:blaze_rod>], [<botania:blazeblock>, <minecraft:blaze_rod>, <botania:blazeblock>]])
    .tier("GEARBOX")
    .time(3000);
EFabRecipe.shaped(<roots:fey_crafter>, [[<ore:treeSapling>, null, <ore:treeSapling>], [<roots:wildroot>, <ore:treeSapling>, <roots:terra_moss>], [<ore:treeSapling>, <ore:logWood>, <ore:treeSapling>]])
    .tier("GEARBOX")
    .tier("UPGRADE_ARMORY")
    .time(3000);
EFabRecipe.shaped(<roots:grove_stone>, [[null, <minecraft:stone>, null], [null, <minecraft:stone>, null], [<minecraft:stone>, <minecraft:nether_star>, <minecraft:stone>]])
    .tier("GEARBOX")
    .tier("UPGRADE_ARMORY")
    .time(3000);
EFabRecipe.shaped(<fartgen:generator>, [[<minecraft:iron_bars>, null, null], [<minecraft:iron_bars>, <minecraft:iron_bars>, null], [<forestry:sturdy_machine>, <minecraft:redstone_block>, <minecraft:redstone_block>]])
    .tier("GEARBOX")
    .tier("STEAM")
    .time(3000);
EFabRecipe.shaped(<forestry:carpenter>, [[<ore:ingotBronze>, <minecraft:glass>, <ore:ingotBronze>], [<ore:ingotBronze>, <forestry:sturdy_machine>, <ore:ingotBronze>], [<ore:ingotBronze>, <minecraft:glass>, <ore:ingotBronze>]])
    .tier("GEARBOX")
    .tier("RF")
    .rfPerTick(30)
    .time(3000);
EFabRecipe.shaped(<forestry:squeezer>, [[<ore:ingotTin>, <minecraft:glass>, <ore:ingotTin>], [<ore:ingotTin>, <forestry:sturdy_machine>, <ore:ingotTin>], [<ore:ingotTin>, <minecraft:glass>, <ore:ingotTin>]])
    .tier("GEARBOX")
    .tier("RF")
    .rfPerTick(30)
    .time(3000);
EFabRecipe.shaped(<forestry:fabricator>, [[<minecraft:gold_ingot>, <minecraft:glass>, <minecraft:gold_ingot>], [<minecraft:glass>, <forestry:sturdy_machine>, <minecraft:glass>], [<minecraft:gold_ingot>, <minecraft:chest>, <minecraft:gold_ingot>]])
    .tier("GEARBOX")
    .tier("RF")
    .rfPerTick(30)
    .time(3000);
EFabRecipe.shaped(<forestry:centrifuge>, [[<ore:ingotCopper>, <minecraft:glass>, <ore:ingotCopper>], [<ore:ingotCopper>, <forestry:sturdy_machine>, <ore:ingotCopper>], [<ore:ingotCopper>, <minecraft:glass>, <ore:ingotCopper>]])
    .tier("GEARBOX")
    .tier("RF")
    .rfPerTick(30)
    .time(3000);
EFabRecipe.shaped(<forestry:apiary>, [[<ore:slabWoodOak>, <ore:slabWoodOak>, <ore:slabWoodOak>], [<ore:plankWood>, <forestry:impregnated_casing>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]])
    .tier("GEARBOX")
    .tier("STEAM")
    .time(3000);
EFabRecipe.shaped(<buildcraftsilicon:laser>, [[null, <magneticraft:tesla_tower>, null], [null, <magneticraft:tesla_tower>, null], [<magneticraft:multiblock_parts>, <magneticraft:multiblock_parts>, <magneticraft:multiblock_parts>]])
    .tier("GEARBOX")
    .tier("STEAM")
    .time(1500);
EFabRecipe.shaped(<efab:upgrade_power>, [[<ic2:crafting:24>, <immersiveengineering:material:27>, <ic2:crafting:24>], [<immersiveengineering:material:27>, <ic2:crafting:18>, <immersiveengineering:material:27>], [<ic2:crafting:24>, <immersiveengineering:material:27>, <ic2:crafting:24>]])
    .tier("GEARBOX")
    .tier("RF")
    .rfPerTick(8192)
    .time(3000);
EFabRecipe.shaped(<lightningcraft:golf_club_gold>, [[null, <minecraft:gold_ingot>, <minecraft:gold_ingot>], [null, <ore:rodGold>, null], [<immersiveengineering:material:27>, null, null]])
    .tier("GEARBOX")
    .tier("UPGRADE_POWER")
    .time(1500);
EFabRecipe.shaped(<lightningcraft:air_terminal:6>, [[null, <ore:rodCopper>, null], [null, <ore:rodCopper>, null], [<ore:plateCopper>, <immersiveengineering:material:27>, <ore:plateCopper>]])
    .tier("GEARBOX")
    .tier("UPGRADE_POWER")
    .time(1500);
EFabRecipe.shaped(<lightningcraft:lightning_infuser>, [[<lightningcraft:stone_block>, <lightningcraft:rod:7>, <lightningcraft:stone_block>], [<lightningcraft:stone_block>, <immersiveengineering:material:27>, <lightningcraft:stone_block>], [<lightningcraft:stone_block>, <ore:plateGold>, <lightningcraft:stone_block>]])
    .tier("GEARBOX")
    .tier("UPGRADE_POWER")
    .time(1500);
EFabRecipe.shaped(<efab:upgrade_digital>, [[<refraction:sensor>, <refraction:optic_fiber>, <refraction:sensor>], [<refraction:optic_fiber>, <refraction:reflection_chamber>, <refraction:optic_fiber>], [<refraction:axyz>, <refraction:optic_fiber>, <refraction:axyz>]])
    .tier("GEARBOX")
    .tier("UPGRADE_POWER")
    .time(3000);
EFabRecipe.shaped(<calculator:calculator>, [[<refraction:optic_fiber>, <calculator:calculatorscreen>, <refraction:optic_fiber>], [<refraction:reflective_alloy>, <calculator:calculatorassembly>, <refraction:reflective_alloy>], [<refraction:optic_fiber>, <refraction:optic_fiber>, <refraction:optic_fiber>]])
    .tier("GEARBOX")
    .tier("UPGRADE_DIGITAL")
    .time(1500);
EFabRecipe.shaped(<calculator:scientificcalculator>, [[<calculator:enrichedgoldingot>, <calculator:calculatorscreen>, <calculator:enrichedgoldingot>], [<refraction:sensor>, <calculator:calculatorassembly>, <refraction:sensor>], [<calculator:enrichedgoldingot>, <calculator:calculatorassembly>, <calculator:enrichedgoldingot>]])
    .tier("GEARBOX")
    .tier("UPGRADE_DIGITAL")
    .time(1500);
EFabRecipe.shaped(<calculator:atomiccalculator>, [[<sonarcore:reinforcedstoneblock>, <calculator:calculatorscreen>, <sonarcore:reinforcedstoneblock>], [<calculator:largetanzanite>, <calculator:atomicassembly>, <calculator:largetanzanite>], [<sonarcore:reinforcedstoneblock>, <calculator:largetanzanite>, <sonarcore:reinforcedstoneblock>]])
    .tier("GEARBOX")
    .tier("UPGRADE_DIGITAL")
    .time(1500);
EFabRecipe.shaped(<calculator:algorithmseparator>, [[<calculator:material:3>, <calculator:powercube>, <calculator:material:3>], [<calculator:stoneseparator>, <refraction:electric_laser>, <calculator:stoneseparator>], [<calculator:material:3>, <calculator:powercube>, <calculator:material:3>]])
    .tier("GEARBOX")
    .tier("UPGRADE_DIGITAL")
    .time(1500);