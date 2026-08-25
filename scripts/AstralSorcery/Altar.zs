import mods.astralsorcery.Altar;
import mods.astralsorcery.Utils;

val myCrystals = Utils.getCrystalORIngredient(false, false);
val myStarCrystal = Utils.getCrystalORIngredient(true, false);
val MyStarCrystal = Utils.getCrystalORIngredient(true, true);

Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/starlightinfuser");

Altar.addDiscoveryAltarRecipe("astralsorcery:shaped/internal/altar/lightwell", <astralsorcery:blockwell>, 200, 20, [
            <astralsorcery:blockmarble:6>, <botania:rune:11>, <astralsorcery:blockmarble:6>,
            <astralsorcery:blockmarble:4>, myCrystals, <astralsorcery:blockmarble:4>,
            myCrystals, <astralsorcery:blockmarble:6>, myCrystals]);
Altar.addAttunementAltarRecipe("astralsorcery:shaped/attunementaltar", <astralsorcery:blockattunementaltar>, 1500, 300, [
            myStarCrystal, <liquid:astralsorcery.liquidstarlight>, myStarCrystal,
            <contenttweaker:xinghui_block>, myStarCrystal, <contenttweaker:xinghui_block>,
            <astralsorcery:blockmarble:6>, <astralsorcery:blockattunementrelay>, <astralsorcery:blockmarble:6>,
            <astralsorcery:itemcraftingcomponent>, <astralsorcery:itemcraftingcomponent>, <astralsorcery:blockmarble:6>, <astralsorcery:blockmarble:6>]);
Altar.addConstellationAltarRecipe("gecraftxi:shaped/internal/altar/eatstar", <modularmachinery:phase_etchingstar_controller>, 3500, 300, [
			<modularmachinery:blockcasing:4>, MyStarCrystal, <modularmachinery:blockcasing:4>,
			MyStarCrystal, <modularmachinery:blockcasing:4>, MyStarCrystal,
			<modularmachinery:blockcasing:4>, MyStarCrystal, <modularmachinery:blockcasing:4>,
			<astralsorcery:itemcoloredlens:6>, <astralsorcery:itemcoloredlens:6>, <astralsorcery:itemcoloredlens:6>, <astralsorcery:itemcoloredlens:6>,
			<astralsorcery:itemcraftingcomponent:1>, <astralsorcery:itemcraftingcomponent:1>,
			<astralsorcery:itemcraftingcomponent:1>, <astralsorcery:itemcraftingcomponent:1>,
			<astralsorcery:itemcraftingcomponent:1>, <astralsorcery:itemcraftingcomponent:1>,
			<astralsorcery:itemcraftingcomponent:1>, <astralsorcery:itemcraftingcomponent:1>]);
Altar.addTraitAltarRecipe("gecraftxi:shaped/internal/altar/star_ingot", <contenttweaker:star_ingot> * 4, 6888, 20, [
  			<astralsorcery:itemcraftingcomponent:1>, <avaritia:resource:1>, <astralsorcery:itemcraftingcomponent:1>,<avaritia:resource:1>, <astralsorcery:itemcraftingcomponent:4>,
  			<avaritia:resource:1>, <astralsorcery:itemcraftingcomponent:1>, <avaritia:resource:1>, <astralsorcery:itemcraftingcomponent:1>,<botania:manaresource:4>,
  			<botania:manaresource:4>, <botania:manaresource:4>, <botania:manaresource:4>,<astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>,
  			<astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>, <astralsorcery:itemusabledust>,<astralsorcery:itemusabledust>,
  			<astralsorcery:itemusabledust>,<contenttweaker:mobiwusi_ingot>, <contenttweaker:mobiwusi_ingot>,<contenttweaker:mobiwusi_ingot>, <contenttweaker:mobiwusi_ingot>,
  			//Outer Items, indices 25+
  			<appliedenergistics2:material:45>, <libvulpes:productdust>, <appliedenergistics2:material:45>, <libvulpes:productdust>, <appliedenergistics2:material:45>, <libvulpes:productdust>, <appliedenergistics2:material:45>, <libvulpes:productdust>
			],
			"astralsorcery.constellation.horologium");