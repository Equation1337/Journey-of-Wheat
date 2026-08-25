#priority 49
#loader crafttweaker reloadable
#ikwid

import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IItemDefinition;
import crafttweaker.event.ItemTossEvent;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.entity.IEntityItem;
import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockPlaceEvent;
import crafttweaker.event.BlockBreakEvent;

import mods.jei.JEI;

import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.IMachineController;

recipes.addShapeless("fake_recipe",<modularmachinery:juneng1_controller>,[<astralsorcery:itemskyresonator>.reuse(),<astralsorcery:blockcelestialcollectorcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.armara", crystalProperties: {collectiveCapability: 100, size: 900, fract: 0, purity: 100, sizeOverride: -1}, collectorType: 1}})],
    function (out,ins,info) {  // 声明配方函数
        return null;  // 直接返回null，不输出
    },
null);
recipes.addShapeless(<modularmachinery:xinghui_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockaltar:1>]);
recipes.addShapeless(<modularmachinery:tianhui_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockaltar:2>]);
recipes.addShapeless(<modularmachinery:wucai_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockaltar:3>]);
recipes.addShapeless(<modularmachinery:xingju_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockstarlightinfuser>]);
recipes.addShapeless(<modularmachinery:gongming_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockattunementaltar>]);
recipes.addShapeless(<modularmachinery:yishi_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockritualpedestal>]);

var dzb1 as string[int] = {
    0:"kong",
    1:"astralsorcery.constellation.aevitas",
    2:"astralsorcery.constellation.pelotrio",
    3:"astralsorcery.constellation.armara",
    4:"astralsorcery.constellation.bootes",
    5:"astralsorcery.constellation.discidia",
    6:"astralsorcery.constellation.evorsio",
    7:"astralsorcery.constellation.fornax",
    8:"astralsorcery.constellation.vicio",
    9:"astralsorcery.constellation.horologium",
    10:"astralsorcery.constellation.lucerna",
    11:"astralsorcery.constellation.mineralis",
    12:"astralsorcery.constellation.octans"
};
var dzb2 as int[string] = {
    "kong":0,
    "astralsorcery.constellation.aevitas":1,
    "astralsorcery.constellation.pelotrio":2,
    "astralsorcery.constellation.armara":3,
    "astralsorcery.constellation.bootes":4,
    "astralsorcery.constellation.discidia":5,
    "astralsorcery.constellation.evorsio":6,
    "astralsorcery.constellation.fornax":7,
    "astralsorcery.constellation.vicio":8,
    "astralsorcery.constellation.horologium":9,
    "astralsorcery.constellation.lucerna":10,
    "astralsorcery.constellation.mineralis":11,
    "astralsorcery.constellation.octans":12,
};
var hd1 as string[int] = {
    0:"kong",
    1:"astralsorcery.constellation.alcara",
    2:"astralsorcery.constellation.ulteria",
    3:"astralsorcery.constellation.gelu",
    4:"astralsorcery.constellation.vorux"
};
var hd2 as int[string] = {
    "kong":0,
    "astralsorcery.constellation.alcara":1,
    "astralsorcery.constellation.ulteria":2,
    "astralsorcery.constellation.gelu":3,
    "astralsorcery.constellation.vorux":4
};

recipes.addHiddenShapeless("junengshuijing", <modularmachinery:juneng_controller>, [<astralsorcery:itemskyresonator>.reuse(), <astralsorcery:blockcelestialcollectorcrystal>.marked("p")], 
    function(out,ins,info) {
        val data as IData = isNull(ins.p.tag.astralsorcery) ? {astralsorcery : {}} : ins.p.tag.astralsorcery;
        val trait as string = isNull(data.constellationNametrait) ? "kong" : data.constellationNametrait;
        val constellation as string= isNull(data.constellationName) ? "kong" : data.constellationName;
        val size as int = isNull(data.crystalProperties.size) ? 0 : data.crystalProperties.size;
        val purity as int = isNull(data.crystalProperties.purity) ? 0 : data.crystalProperties.purity;
        val collectiveCapability as int = isNull(data.crystalProperties.collectiveCapability) ? 0 : data.crystalProperties.collectiveCapability;
        val hp as int[] = [hd2[trait], dzb2[constellation], size, purity, collectiveCapability];
        return out.withTag({hp:hp});
    }, null
);
JEI.removeAndHide(<modularmachinery:juneng_controller>);
JEI.removeAndHide(<modularmachinery:juneng_factory_controller>);
events.onBlockPlace(function(event as BlockPlaceEvent){
    val world = event.world;
    val player = event.player;
    val Block = event.block;
    val block = event.blockState;
    val pos = event.position;
    val item = player.currentItem.tag;
    val data as IData = {items : {outSlots : item.hp}};
    if (!world.remote && Block.definition.id == "modularmachinery:juneng_controller" ){
        world.setBlockState(block, data, pos);
    }
    else {
        return;
    }
});
events.onBlockBreak(function(event as BlockBreakEvent){
    val Pos = event.position;
    val world = event.world;
    val block = world.getBlock(Pos);
    if (!world.remote && block.definition.id == "modularmachinery:juneng_controller") {
        val Data as IData = isNull(block.data) ? {} :block.data.items.outSlots;
        events.onEntityJoinWorld(function(event as EntityJoinWorldEvent){
            val Entity = event.entity;
            val world= event.world;
            val pos= Entity.position;
            if(world.remote||isNull(Entity)||isNull(Entity.definition)) {
                return;
            }
            else if (Entity instanceof IEntityItem){
                val entityItem as IEntityItem = Entity;
                val Item = entityItem.item;
                if(world.remote||isNull(entityItem)||isNull(Item)||isNull(Item.definition)) {
                    return;
                }
                else if(Item.definition.id == "modularmachinery:juneng_controller") {
                    Item.mutable().updateTag({hp : Data});
                }
            }
        });
    }
    else {
        return;
    }
});

MMEvents.onStructureFormed("xinghui", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    if (!world.remote) {
        world.setBlockState(<blockstate:astralsorcery:blockaltar:altartype=altar_2>, pos);
    }
    });
});
MMEvents.onStructureFormed("tianhui", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    if (!world.remote) {
        world.setBlockState(<blockstate:astralsorcery:blockaltar:altartype=altar_3>, pos);
    }
    });
});
MMEvents.onStructureFormed("wucai", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    if (!world.remote) {
        world.setBlockState(<blockstate:astralsorcery:blockaltar:altartype=altar_4>, pos);
    }
    });
});
MMEvents.onStructureFormed("xingju", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    if (!world.remote) {
        world.setBlockState(<blockstate:astralsorcery:blockstarlightinfuser>, pos);
    }
    });
});
MMEvents.onStructureFormed("gongming", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    if (!world.remote) {
        world.setBlockState(<blockstate:astralsorcery:blockattunementaltar>, pos);
    }
    });
});
MMEvents.onStructureFormed("yishi", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    if (!world.remote) {
        world.setBlockState(<blockstate:astralsorcery:blockritualpedestal>, pos);
    }
    });
});
MMEvents.onStructureFormed("juneng", function(event as MachineStructureFormedEvent) {
    Sync.addSyncTask(function() {
    val ctrl = event.controller;
    val pos = ctrl.pos;
    val world = ctrl.world;
    val block = world.getBlock(pos);
    val Data = block.data.items.outSlots;
    if (!world.remote && Data[0] != 0) {
        val data as IData = {constellationNametrait : hd1[Data[0]], constellationName : dzb1[Data[1]], size : Data[2], purity : Data[3], collect : Data[4], collectorType : 1};// , fract : 0, sizeOverride : -1, ticksExisted : 1, doesSeeSky : 1, linked : {}, multiBlockPresent : 0, wasLinkedBefore : 0, playerRefMost : 12300, playerRefLeast : -7220265544684617936
        world.setBlockState(<blockstate:astralsorcery:blockcelestialcollectorcrystal>, data, pos);
    }
    else if (!world.remote && Data[0] == 0) {
        val data as IData = {constellationName : dzb1[Data[1]], size : Data[2], purity : Data[3], collect : Data[4], collectorType : 1};
        world.setBlockState(<blockstate:astralsorcery:blockcelestialcollectorcrystal>, data, pos);
    }
    else{
        return;
    }
    });
});

events.onItemToss(function(event as ItemTossEvent){
        val Item = event.item;
        val IItem = Item.item;
        val world = Item.world;
        val Definition = IItem.definition;
        val ID = Definition.id;

        if(world.remote||isNull(Item)||isNull(IItem)||isNull(IItem.definition)) {
            return;
        }
        else if(ID == "modularmachinery:xinghui_controller"||
        ID == "modularmachinery:tianhui_controller"||
        ID == "modularmachinery:wucai_controller"||
        ID == "modularmachinery:xingju_controller"||
        ID == "modularmachinery:gongming_controller"||
        ID == "modularmachinery:juneng_controller"||
        ID == "modularmachinery:yishi_controller") {
            IItem.mutable().updateTag({isPlayer:1});
        }
    });

events.onEntityJoinWorld(function(event as EntityJoinWorldEvent){
        val Entity = event.entity;
        val world= event.world;
        val pos= Entity.position;
        if(world.remote||isNull(Entity)||isNull(Entity.definition)) {
            return;
        }
        else if (Entity instanceof IEntityItem){
            val entityItem as IEntityItem = Entity;
            val Item=entityItem.item;
            if(isNull(Item)||isNull(Item.definition)||(!isNull(Item.tag)&&!isNull(Item.tag.isPlayer))) {
                return;
            }
            else {
            if (Item.definition.id == "modularmachinery:xinghui_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockaltar"&&world.getBlock(blockPos).meta == 1){
                        event.cancel();
                    }
                }
            }
            if (Item.definition.id == "modularmachinery:tianhui_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockaltar"&&world.getBlock(blockPos).meta == 2){
                        event.cancel();
                    }
                }
            }
            if (Item.definition.id == "modularmachinery:wucai_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockaltar"&&world.getBlock(blockPos).meta == 3){
                        event.cancel();
                    }
                }
            }
            if (Item.definition.id == "modularmachinery:xingju_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockstarlightinfuser"&&world.getBlock(blockPos).meta == 0){
                        event.cancel();
                    }
                }
            }
            if (Item.definition.id == "modularmachinery:gongming_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockattunementaltar"&&world.getBlock(blockPos).meta == 0){
                        event.cancel();
                    }
                }
            }
            if (Item.definition.id == "modularmachinery:yishi_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockritualpedestal"&&world.getBlock(blockPos).meta == 0){
                        event.cancel();
                    }
                }
            }
            if (Item.definition.id == "modularmachinery:juneng_controller") {
                val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
                val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
                val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "astralsorcery:blockcelestialcollectorcrystal"&&world.getBlock(blockPos).meta == 0){
                        event.cancel();
                    }
                }
            }
            }
        }
    });