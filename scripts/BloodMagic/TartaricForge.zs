import mods.bloodmagic.TartaricForge;

TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:iron_sword>]);
TartaricForge.removeRecipe([<minecraft:glowstone_dust>, <minecraft:redstone>, <minecraft:gold_nugget>, <minecraft:gunpowder>]);

TartaricForge.addRecipe(<bloodmagic:sentient_sword>, [<bloodmagic:soul_gem>, <astralsorcery:itemchargedcrystalsword>], 0.00, 0.00);
TartaricForge.addRecipe(<bloodmagic:blood_shard:1>, [<bloodmagic:blood_shard>, <bloodmagic:item_demon_crystal>, <bloodmagic:item_demon_crystal>, <bloodmagic:item_demon_crystal>], 8192.00, 8192.00);
TartaricForge.addRecipe(<bloodmagic:component:8>, [<essentialcraft:genitem:43>, <essentialcraft:playerpentacle>, <essentialcraft:windrune>, <astralsorcery:itemperkseal>], 512.00, 256.00);
TartaricForge.addRecipe(<modularmachinery:yizhi_controller>, [<deepmoblearningbm:digital_will_injector>, <bloodmagic:slate:4>, <astralsorcery:itemcoloredlens:3>, <modularmachinery:blockcasing>], 16384.00, 8192.00);