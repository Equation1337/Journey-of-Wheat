#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemDefinition;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import crafttweaker.event.BlockPlaceEvent;
import crafttweaker.util.Math;
import moretweaker.draconicevolution.FusionCrafting;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.PlayerBreakSpeedEvent;
import mods.jei.JEI;

//通量自动无限制
events.onBlockPlace(function(event as BlockPlaceEvent){
        val pos = event.position;
        val world = event.world;
        val blockstate = event.blockState;
        val block = event.block;
        if (block.definition.id.startsWith("fluxnetworks") && block.definition.id != "fluxnetworks:fluxblock"){
            world.setBlockState(blockstate,{2:1 as byte,3:0 as byte},pos);
        }
    });

//100以内运算
for i in 1 .. 100 {
    for e in 1 .. 100 {
        //加
        if (i + e <= 99) {
            recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + (i + e)), [
                [null,null,null],
                [itemUtils.getItem("contenttweaker:num_" + i), <contenttweaker:jia>.reuse(), itemUtils.getItem("contenttweaker:num_" + e)],
                [null,null,null]]);
        }
        //减
        if (i - e >= 1) {
            recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + (i - e)), [
                [null,null,null],
                [itemUtils.getItem("contenttweaker:num_" + i), <contenttweaker:jian>.reuse(), itemUtils.getItem("contenttweaker:num_" + e)],
                [null,null,null]]);
        }
        //乘
        if (i * e <= 99) {
            recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + (i * e)), [
                [null,null,null],
                [itemUtils.getItem("contenttweaker:num_" + i), <contenttweaker:cheng>.reuse(), itemUtils.getItem("contenttweaker:num_" + e)],
                [null,null,null]]);
        }
        //除
        if (i % e == 0) {
            recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + (i / e)), [
                [null,null,null],
                [itemUtils.getItem("contenttweaker:num_" + i), <contenttweaker:chu>.reuse(), itemUtils.getItem("contenttweaker:num_" + e)],
                [null,null,null]]);
        }
        //乘方
        if (pow(i, e) <= 99) {
            recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + Math.round(pow(i , e))), [
                [null,null,null],
                [itemUtils.getItem("contenttweaker:num_" + i), <contenttweaker:chengfang>.reuse(), itemUtils.getItem("contenttweaker:num_" + e)],
                [null,null,null]]);
        }
        //取余
        if (i % e != 0) {
            recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + (i % e)), [
                [null,null,null],
                [itemUtils.getItem("contenttweaker:num_" + i), <contenttweaker:quyu>.reuse(), itemUtils.getItem("contenttweaker:num_" + e)],
                [null,null,null]]);
        }
    }
    //算术开平方
    if (Math.sqrt(i) % 1 == 0) {
        recipes.addShaped(itemUtils.getItem("contenttweaker:num_" + Math.round(Math.sqrt(i))), [
            [null,null,null],
            [null, <contenttweaker:kaifang>.reuse(), null],
            [null,itemUtils.getItem("contenttweaker:num_" + i),null]]);
    }
}
//龙研究升级套件(by Circulation)
    //配方
        recipes.addShapeless(<contenttweaker:draconic_conversion_device>,[<contenttweaker:draconic_upgrade_device>,<contenttweaker:wyvern_upgrade_device>]);
        recipes.addShapeless(<contenttweaker:chaotic_conversion_device>,[<contenttweaker:chaotic_upgrade_device>,<contenttweaker:draconic_upgrade_device>,<contenttweaker:wyvern_upgrade_device>]);
        recipes.addShapeless(<contenttweaker:chaotic_conversion_device>,[<contenttweaker:chaotic_upgrade_device>,<contenttweaker:draconic_conversion_device>]);
        FusionCrafting.add(<contenttweaker:wyvern_upgrade_device>,<draconicevolution:draconium_ingot>,0,256000,[<draconicevolution:wyvern_core>,<draconicevolution:draconic_core>,<draconicevolution:draconic_core>,<ore:blockDraconium>,<ore:gemDiamond>,<ore:gemDiamond>,<ore:gemDiamond>,<ore:gemDiamond>,]);
        FusionCrafting.add(<contenttweaker:draconic_upgrade_device>,<draconicevolution:draconium_ingot>,1,1792000,[<ore:gemDiamond>,<draconicevolution:wyvern_core>,<draconicevolution:wyvern_core>,<ore:gemDiamond>,<ore:gemDiamond>,<ore:blockDraconiumAwakened>,<ore:gemDiamond>]);
        FusionCrafting.add(<contenttweaker:chaotic_upgrade_device>,<draconicevolution:draconium_ingot>,2,48000000,[<ore:gemDiamond>,<draconicevolution:chaotic_core>,<ore:gemDiamond>,<ore:gemDiamond>,<ore:dragonEgg>,<ore:gemDiamond>]);
        FusionCrafting.add(<contenttweaker:draconic_conversion_device>,<contenttweaker:wyvern_upgrade_device>,1,1792000,[<ore:gemDiamond>,<draconicevolution:wyvern_core>,<draconicevolution:wyvern_core>,<ore:gemDiamond>,<ore:gemDiamond>,<ore:blockDraconiumAwakened>,<ore:gemDiamond>]);
        FusionCrafting.add(<contenttweaker:chaotic_conversion_device>,<contenttweaker:draconic_conversion_device>,2,48000000,[<ore:gemDiamond>,<draconicevolution:chaotic_core>,<ore:gemDiamond>,<ore:gemDiamond>,<ore:dragonEgg>,<ore:gemDiamond>]);
    //运行
    function Tooltip(item as IItemStack,conversion as bool = true){
        if (conversion){
            item.addShiftTooltip("§a潜行右键将目标方块完整升级到指定等级","按住§e§oshift§r获取更多信息");
            item.addShiftTooltip("§6可在任何低级别的方块上使用");
    
        } else {
            item.addShiftTooltip("§a潜行右键将目标方块提升一个等级","按住§e§oshift§r获取更多信息");
            item.addShiftTooltip("§6目标方块必须比该升级低一级"); 
        }
    }
    Tooltip(<contenttweaker:draconic_conversion_device>);
    Tooltip(<contenttweaker:chaotic_conversion_device>);
    Tooltip(<contenttweaker:draconic_upgrade_device>,false);
    Tooltip(<contenttweaker:chaotic_upgrade_device>,false);
    Tooltip(<contenttweaker:wyvern_upgrade_device>,false);
    events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent){
        val item = event.item;
        if(!event.world.remote && !isNull(item) && event.player.isSneaking){
            if (item.definition.id.startsWith("contenttweaker")){
                if (item.definition.id.endsWith("upgrade_device") || item.definition.id.endsWith("conversion_device")){
                    zrqd(event);
                    event.player.setCooldown(item, 10);
                }
            }
        }
    });
    function zrqd(event as PlayerInteractBlockEvent) as void{
        val block = event.block;
        val item = event.item;
        val itemDefinition = event.item.definition;
        val world = event.world;
        val pos = event.position;
        var itemdzb as int[IItemDefinition] = {};
        var device as bool = false;
        if (item.definition.id.endsWith("upgrade_device")) {
            itemdzb = {
                <contenttweaker:wyvern_upgrade_device>.definition : 1,
                <contenttweaker:draconic_upgrade_device>.definition : 2,
                <contenttweaker:chaotic_upgrade_device>.definition : 3
            };
            device = true;
        } else if (item.definition.id.endsWith("conversion_device")) {
            itemdzb = {
                <contenttweaker:draconic_conversion_device>.definition : 2,
                <contenttweaker:chaotic_conversion_device>.definition : 3
            };
        }
        val dzb as string[int] = {
            0 : "basic",
            1 : "wyvern",
            2 : "draconic",
            3 : "chaotic",
        };
        val fxdzb as int[string] = {
            "basic" : 0,
            "wyvern" : 1,
            "draconic" : 2,
            "chaotic" : 3,
        };
        if (block.definition.id == "draconicevolution:crafting_injector"){
            val tier = block.meta;

            if(tier < itemdzb[item.definition]){
                if (device){
                    if ((tier + 1) == itemdzb[item.definition]){
                        world.setBlockState(<blockstate:draconicevolution:crafting_injector:tier=${dzb[itemdzb[item.definition]]}>,pos);
                        item.mutable().shrink(1);
                        event.player.sendMessage("升级完毕！");
                        event.cancel();
                    }
                } else {
                    world.setBlockState(<blockstate:draconicevolution:crafting_injector:tier=${dzb[itemdzb[item.definition]]}>,pos);
                    item.mutable().shrink(1);
                    event.player.sendMessage("升级完毕！");
                    event.cancel();
                }
            }
        }
    }

//修复锂离子电池
    recipes.remove(<nuclearcraft:lithium_ion_cell>);
    recipes.addShaped(<nuclearcraft:lithium_ion_cell>.withTag({energyStorage: {energy: 0 as long, capacity: 8000000 as long}}),
    [[<nuclearcraft:alloy:2>, <nuclearcraft:alloy:2>,<nuclearcraft:alloy:2>],
    [<nuclearcraft:alloy:6>, <nuclearcraft:ingot:6>,<nuclearcraft:alloy:6>],
    [<nuclearcraft:alloy:4>, <nuclearcraft:alloy:4>, <nuclearcraft:alloy:4>]]);

//ic2模式存储复制
    events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent){
        val item = event.item;
        if(!event.player.isSneaking && !event.world.remote && !isNull(item) && wpdb(<ic2:te:62>,item)){
            val block = event.block.data;
            if (!isNull(block) && !isNull(block.id) && block.id == "ic2:pattern_storage"){
                item.mutable().updateTag({patterns : block.patterns});
                event.cancel();
            }
        } 
    });

//光波增幅器
    events.onPlayerBreakSpeed(function(event as PlayerBreakSpeedEvent){
        if (!event.player.world.remote && !event.player.fake) {
            if (event.block.definition.id == "packagedastral:marked_relay") {
                event.newSpeed = 1000.0f;
            }
        }
    });

//无法破坏物品(A part from Circulation)
    var h = <mets:field_generator>.withTag({display: {Lore: ["§b与任意工具或武器合成以获取无法破坏词条", "§b不会被消耗"], Name: "§b维度跃迁装置"}});
    var gzh = <mets:field_generator>.withTag({display: {Lore: ["§b与任意工具或武器合成以获取无法破坏词条", "§b不会被消耗"]}});
    var c = <ic2:crafting:4>.withTag({display: {Lore: ["§b与任意工具或武器合成以获取无法破坏词条", "§4会被消耗"], Name: "§e强互作用力镀层"}});
    var gzc = <ic2:crafting:4>.withTag({display: {Lore: ["§b与任意工具或武器合成以获取无法破坏词条", "§4会被消耗"]}});
    var xzhx = <packagedastral:constellation_focus>; 
    var e = null; 
    var wj = <avaritia:resource:5>; 
    recipes.addShapeless("fake_recipe",<minecraft:wooden_pickaxe>.withTag({Unbreakable: 1 as byte, display: {Lore: ["§b这是一个合成示例", "§b过程中保留附魔，并且添加无法破坏"]}}),[<minecraft:wooden_pickaxe>,c|h],
        function (out,ins,info) {
            return null;
        },
    null);
    recipes.addHiddenShapeless("wa",<tinymobfarm:lasso>.withTag({display: {Name: "§4不许偷鸡，给你没收了！"}}),[
        gzh.reuse()|gzc,<tinymobfarm:lasso>.anyDamage().noReturn()],
    null);
    recipes.addHiddenShapeless("bs",<enderio:item_capacitor_totemic>.withTag({ench: [{lvl: 5 as short, id: 32}], RepairCost: 1, Unbreakable: 1 as byte}),[
        gzh.reuse()|gzc,<enderio:item_capacitor_totemic>.anyDamage().noReturn()],
    null);
    recipes.addHiddenShapeless("sm",<immersiveengineering:graphite_electrode>.withTag({Unbreakable: 1 as byte}),[
        gzh.reuse()|gzc,<immersiveengineering:graphite_electrode>.anyDamage().noReturn()],
    null);
    recipes.addHiddenShapeless("ww",<minecraft:diamond>,[
        <*>.noReturn().marked("p"),gzh.reuse()|gzc],
        function(out,ins,info){
            var data as IData = ins.p.tag;
            if (!ins.p.isDamageable || ins.p.isStackable){
                return null;
            } else {
                if(ins.p.name == "item.tinymobfarm:lasso") {
                    return null;
                } else {
                    return ins.p.withTag(data).mutable().updateTag({"Unbreakable":1 as byte});
                }
            }
        },
    null);
    mods.astralsorcery.Altar.addTraitAltarRecipe("gecraft:shaped/internal/altar/yuanshen", h, 6000, 200, [
        wj,xzhx,wj,xzhx,c,xzhx,wj,xzhx,wj,
        e,e,e,e,e,e,e,e,e,
        e,e,e,e,e,e,e,e,e,
        e,e,e,e,e,e,e,e,e,
    ],
    "astralsorcery.constellation.horologium");
    JEI.addItem(h);
    JEI.addItem(c);
    mods.botania.ManaInfusion.addInfusion(<randomthings:ingredient:2>.withTag({display: {Lore: ["§b和除去魔力符文的15种符文一同接受一池魔力，它会展现出全新的样子"], Name: "§b不定形的等离子体"}}),<astralsorcery:itemshiftingstar>.withTag({astralsorcery: {}}),1000000);
    mods.botania.RuneAltar.addRecipe(<teslacorelib:base_addon>.withTag({display: {Lore: ["§b试试用旋律合金与它混合后定型？"], Name: "§b二维展开薄膜"}}),[<randomthings:ingredient:2>.withTag({display: {Lore: ["§b和除去魔力符文的15种符文一同接受一池魔力，它会展现出全新的样子"], Name: "§b不定形的等离子体"}}),<botania:rune>,<botania:rune:1>,<botania:rune:2>,<botania:rune:3>,<botania:rune:4>,<botania:rune:5>,<botania:rune:6>,<botania:rune:7>,<botania:rune:9>,<botania:rune:10>,<botania:rune:11>,<botania:rune:12>,<botania:rune:13>,<botania:rune:14>,<botania:rune:15>,],1000000);
    mods.enderio.AlloySmelter.addRecipe(<teslacorelib:base_addon>.withTag({display: {Lore: ["§b试试用旋律合金与它混合后定型？"], Name: "§b二维展开薄膜"}}) , [<enderio:item_alloy_endergy_ingot:2> , <pneumaticcraft:plastic:5>.withTag({display: {Lore: ["§b熔炼而出的一片数据？", "§b或许可以在4阶以上血之祭坛里用114514生命源质让它充满活力"], Name: "§b二维转录的数据"}})]);
    mods.bloodmagic.BloodAltar.addRecipe(<thaumcraft:primordial_pearl>.withTag({display: {Lore: ["§5你将接触到终极", "§b将它放入混沌的聚合核心吧，与2个混沌龙芯聚合"], Name: "§b轮转不息的核心"}}),<pneumaticcraft:plastic:5>.withTag({display: {Lore: ["§b熔炼而出的一片数据？", "§b或许可以在4阶以上血之祭坛里用114514生命源质让它充满活力"], Name: "§b二维转录的数据"}}),3,114514,2000,0);
    FusionCrafting.add(<mets:super_iridium_compress_plate>.withTag({display: {Lore: ["§b你离高等文明的造物只有一步之遥", "§b把它放在五彩祭坛的中央吧，接受纯粹的星能灌注"], Name: "§b完美无瑕的镀层§b"}}), <thaumcraft:primordial_pearl>.withTag({display: {Lore: ["§5你将接触到终极", "§b将它放入混沌的聚合核心吧，与2个混沌龙芯聚合"], Name: "§b轮转不息的核心"}}), FusionCrafting.CHAOTIC, 100000000,[<draconicevolution:chaotic_core>, <draconicevolution:chaotic_core>]);
    mods.astralsorcery.Altar.addTraitAltarRecipe("gecraft:shaped/internal/altar/qidong", c, 6000, 200, [
        e,e,e,e,<mets:super_iridium_compress_plate>.withTag({display: {Lore: ["§b你离高等文明的造物只有一步之遥", "§b把它放在五彩祭坛的中央吧，接受纯粹的星能灌注"], Name: "§b完美无瑕的镀层§b"}}),e,e,e,e,
        e,e,e,e,e,e,e,e,e,
        e,e,e,e,e,e,e,e,e,
        e,e,e,e,e,e,e,e,e,
    ],
    null);