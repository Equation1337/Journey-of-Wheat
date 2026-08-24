import mods.bloodmagic.BloodAltar;

// ============================================================
// 注意：BloodAltar.removeRecipe 的参数是祭坛的【输入物品】
// （放在祭坛里被转化的东西），不是产物！
// 原脚本传的是产物（石板/宝珠/匕首），导致一个都匹配不上，
// 原版配方全部保留、删除不生效。已按原版输入逐一修正：
//   石头 -> 空白石板          钻石 -> 弱血宝珠
//   空白石板 -> 强化石板      红石块 -> 初学者宝珠
//   强化石板 -> 浸润石板      金块 -> 法师宝珠
//   浸润石板 -> 恶魔石板      血之碎片 -> 大师宝珠
//   恶魔石板 -> 空灵石板      下界之星 -> 大贤者宝珠
//   铁剑 -> 献祭匕首
// ============================================================

BloodAltar.removeRecipe(<minecraft:stone>);
BloodAltar.removeRecipe(<bloodmagic:slate>);
BloodAltar.removeRecipe(<bloodmagic:slate:1>);
BloodAltar.removeRecipe(<bloodmagic:slate:2>);
BloodAltar.removeRecipe(<bloodmagic:slate:3>);
BloodAltar.removeRecipe(<minecraft:diamond>);
BloodAltar.removeRecipe(<minecraft:redstone_block>);
BloodAltar.removeRecipe(<minecraft:gold_block>);
BloodAltar.removeRecipe(<bloodmagic:blood_shard>);
BloodAltar.removeRecipe(<minecraft:nether_star>);
BloodAltar.removeRecipe(<minecraft:iron_sword>);

BloodAltar.addRecipe(<bloodmagic:dagger_of_sacrifice>, <astralsorcery:itemcrystalsword>, 1, 3000, 100, 20);
BloodAltar.addRecipe(<bloodmagic:slate>, <astralsorcery:blockblackmarble>, 0, 1000, 100, 20);
BloodAltar.addRecipe(<bloodmagic:slate:1>, <bloodmagic:blood_rune>, 1, 2000, 200, 20);
BloodAltar.addRecipe(<bloodmagic:slate:2>, <bloodmagic:blood_shard>, 2, 5000, 500, 20);
BloodAltar.addRecipe(<bloodmagic:slate:3>, <bloodmagic:item_demon_crystal>, 3, 15000, 1500, 20);
BloodAltar.addRecipe(<bloodmagic:slate:4>, <astralsorcery:itemshiftingstar>, 4, 30000, 3000, 20);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), <essentialcraft:genitem:16>, 0, 2000, 200, 20);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), <bloodmagic:lava_crystal>, 1, 5000, 500, 20);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), <bloodmagic:component:30>, 2, 25000, 2500, 20);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}), <bloodmagic:blood_shard:1>, 3, 40000, 4000, 20);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}), <bloodmagic:soul_gem:4>.withTag({souls: 16384.0, demonWillType: "steadfast"}), 4, 80000, 8000, 20);
