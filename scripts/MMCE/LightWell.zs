#reloadable
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.astralsorcery.Utils;

val myCrystal = Utils.getCrystalORIngredient(false, false);
val myCrystal_1 = Utils.getCrystalORIngredient(false, true);

RecipeBuilder.newBuilder("star_1", "phase_etchingstar", 20)
    .addItemInput(<astralsorcery:itemcraftingcomponent:4>)
    .addFluidOutput(<liquid:astralsorcery.liquidstarlight> * 500)
    .addCatalystInput(<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}),["此催化剂可以提高100%星能液产量"],[RecipeModifierBuilder.create("modularmachinery:fluid", "output", 2, 1, true).build()]).setChance(0.01)
    .build();
RecipeBuilder.newBuilder("star_2", "phase_etchingstar", 100)
    .addItemInput(<astralsorcery:itemrockcrystalsimple>).setChance(0.05)
    .addFluidPerTickOutput(<liquid:astralsorcery.liquidstarlight> * 50)
    .addCatalystInput(<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}),["此催化剂可以提高100%星能液产量"],[RecipeModifierBuilder.create("modularmachinery:fluid", "output", 2, 1, true).build()]).setChance(0.01)
    .build();
RecipeBuilder.newBuilder("star_3", "phase_etchingstar", 50)
    .addItemInput(<astralsorcery:itemcelestialcrystal>).setChance(0.1)
    .addFluidPerTickOutput(<liquid:astralsorcery.liquidstarlight> * 100)
    .addCatalystInput(<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {starAttunement: "astralsorcery.constellation.aevitas"}}),["此催化剂可以提高100%星能液产量"],[RecipeModifierBuilder.create("modularmachinery:fluid", "output", 2, 1, true).build()]).setChance(0.01)
    .build();
RecipeBuilder.newBuilder("aether_1", "phase_etchingstar", 100)
    .addItemInput(<astralsorcery:itemcraftingcomponent>)
    .addFluidOutput(<liquid:aether> * 500)
    .build();
RecipeBuilder.newBuilder("aether_2", "phase_etchingstar", 20)
    .addItemInput(<aetherworks:item_resource:5>)
    .addFluidOutput(<liquid:aetherworks.aetherium_gas> * 1500)
    .build();