#reloadable
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;

RecipeBuilder.newBuilder("yizhi_1", "yizhi", 3600)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal> * 4)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 1000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0}))
    .build();

RecipeBuilder.newBuilder("yizhi_2", "yizhi", 3600)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:1> * 4)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 1000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "corrosive"}))
    .build();

RecipeBuilder.newBuilder("yizhi_3", "yizhi", 3600)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:2> * 4)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 1000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "destructive"}))
    .build();

RecipeBuilder.newBuilder("yizhi_4", "yizhi", 3600)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:3> * 4)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 1000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "vengeful"}))
    .build();

RecipeBuilder.newBuilder("yizhi_5", "yizhi", 3600)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:4> * 4)
    .addFluidInput(<liquid:lifeessence> * 1000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 1000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "steadfast"}))
    .build();

RecipeBuilder.newBuilder("yizhi_6", "yizhi", 800)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:1>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:2>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:3>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:4>).setChance(0)
    .addFluidInput(<liquid:lifeessence> * 8000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 8000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0}))
    .build();

RecipeBuilder.newBuilder("yizhi_7", "yizhi", 800)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:1>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:1>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:2>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:3>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:4>).setChance(0)
    .addFluidInput(<liquid:lifeessence> * 8000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 8000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "corrosive"}))
    .build();

RecipeBuilder.newBuilder("yizhi_8", "yizhi", 800)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:2>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:1>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:2>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:3>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:4>).setChance(0)
    .addFluidInput(<liquid:lifeessence> * 8000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 8000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "destructive"}))
    .build();

RecipeBuilder.newBuilder("yizhi_9", "yizhi", 800)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:3>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:1>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:2>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:3>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:4>).setChance(0)
    .addFluidInput(<liquid:lifeessence> * 8000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 8000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "vengeful"}))
    .build();

RecipeBuilder.newBuilder("yizhi_10", "yizhi", 800)
    .addItemInput(<bloodmagic:soul_gem:4>)
    .addItemInput(<bloodmagic:item_demon_crystal:4>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:1>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:2>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:3>).setChance(0)
    .addItemInput(<bloodmagic:demon_crystal:4>).setChance(0)
    .addFluidInput(<liquid:lifeessence> * 8000)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 8000)
    .addItemOutput(<bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "steadfast"}))
    .build();