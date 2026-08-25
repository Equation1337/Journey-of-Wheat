#loader crafttweaker reloadable
import crafttweaker.data.IData;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.item.IItemStack;
import mods.nuclearcraft.AlloyFurnace;
import moretweaker.draconicevolution.FusionCrafting;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import novaeng.hypernet.HyperNetHelper;
import novaeng.hypernet.RegistryHyperNet;
import novaeng.hypernet.research.ResearchCognitionData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import crafttweaker.item.IItemDefinition;
import mods.modularmachinery.RecipeFinishEvent;
import crafttweaker.events.IEventManager;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import mods.modularmachinery.MachineStructureFormedEvent;
import crafttweaker.event.ItemTossEvent;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IBlockPos;
import crafttweaker.util.Math;
import mods.modularmachinery.Sync;
import crafttweaker.world.IWorld;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.MachineController;
import novaeng.NovaEngUtils;
import mods.modularmachinery.RecipeEvent;
import mods.modularmachinery.RecipeTickEvent;

RecipeBuilder.newBuilder("music", "jidian", 130)
    .addRecipeTooltip("§b演奏神秘的旋律以工作", "§e提示:F4+L4X4F4+L4X4L4F4+M4R4M4F4+R4","§e演奏顺序为靠控制器一侧左边第一个开始","§e向右演奏并按照S型向后延伸" , "§c工作完成后音符盒将被消耗")
    .addItemInputs([<extendedcrafting:singularity_ultimate>, <extrautils2:suncrystal> * 10000000, <draconicevolution:chaotic_core> * 8, <draconicadditions:chaotic_energy_core> * 8, <extendedcrafting:material:32> * 512, <contenttweaker:life_core>, <thaumcraft:causality_collapser> * 16])
    .addItemOutput(<contenttweaker:juzhen>)
    .addEnergyPerTickInput(2000000000)
    .addPreTickHandler(function(event as RecipeTickEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val world = ctrl.world;
        val pos = ctrl.pos;
        val active = ctrl.activeRecipe;
        val blockPos as IBlockPos = pos.createPosByFacing(ctrl.facing, 4, 1, 3);
        val blockPos_1 as IBlockPos = pos.createPosByFacing(ctrl.facing, 0, 1, 3);
        val blockPos_2 as IBlockPos = pos.createPosByFacing(ctrl.facing, -4, 1, 3);
        val blockPos_3 as IBlockPos = pos.createPosByFacing(ctrl.facing, -2, 1, 5);
        val blockPos_4 as IBlockPos = pos.createPosByFacing(ctrl.facing, 2, 1, 5);
        val blockPos_5 as IBlockPos = pos.createPosByFacing(ctrl.facing, 4, 1, 7);
        val blockPos_6 as IBlockPos = pos.createPosByFacing(ctrl.facing, 0, 1, 7);
        val blockPos_7 as IBlockPos = pos.createPosByFacing(ctrl.facing, -4, 1, 7);
        val blockPos_8 as IBlockPos = pos.createPosByFacing(ctrl.facing, -2, 1, 9);
        val blockPos_9 as IBlockPos = pos.createPosByFacing(ctrl.facing, 2, 1, 9);
        val blockPos_10 as IBlockPos = pos.createPosByFacing(ctrl.facing, 4, 1, 11);
        val blockPos_11 as IBlockPos = pos.createPosByFacing(ctrl.facing, 0, 1, 11);
        val blockPos_12 as IBlockPos = pos.createPosByFacing(ctrl.facing, -4, 1, 11);
            if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos).meta == 0){                  
                val block = world.getBlock(blockPos); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 12 && Power == 1 && timer == 0) {
                        active.tick = 10;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_1))&&!isNull(world.getBlock(blockPos_1).definition)&&world.getBlock(blockPos_1).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_1).meta == 0){                  
                val block = world.getBlock(blockPos_1); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 13 && Power == 1 && timer == 1) {
                        active.tick = 20;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_2))&&!isNull(world.getBlock(blockPos_2).definition)&&world.getBlock(blockPos_2).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_2).meta == 0){                  
                val block = world.getBlock(blockPos_2); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 5 && Power == 1 && timer == 2) {
                        active.tick = 30;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_3))&&!isNull(world.getBlock(blockPos_3).definition)&&world.getBlock(blockPos_3).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_3).meta == 0){                  
                val block = world.getBlock(blockPos_3); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 12 && Power == 1 && timer == 3) {
                        active.tick = 40; 
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_4))&&!isNull(world.getBlock(blockPos_4).definition)&&world.getBlock(blockPos_4).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_4).meta == 0){                  
                val block = world.getBlock(blockPos_4); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 13 && Power == 1 && timer == 4) {
                        active.tick = 50;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_5))&&!isNull(world.getBlock(blockPos_5).definition)&&world.getBlock(blockPos_5).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_5).meta == 0){                  
                val block = world.getBlock(blockPos_5); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 5 && Power == 1 && timer == 5) {
                        active.tick = 60;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_6))&&!isNull(world.getBlock(blockPos_6).definition)&&world.getBlock(blockPos_6).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_6).meta == 0){                  
                val block = world.getBlock(blockPos_6); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 13 && Power == 1 && timer == 6) {
                        active.tick = 70;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_7))&&!isNull(world.getBlock(blockPos_7).definition)&&world.getBlock(blockPos_7).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_7).meta == 0){                  
                val block = world.getBlock(blockPos_7); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 12 && Power == 1 && timer == 7) {
                        active.tick = 80;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_8))&&!isNull(world.getBlock(blockPos_8).definition)&&world.getBlock(blockPos_8).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_8).meta == 0){                  
                val block = world.getBlock(blockPos_8); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 10 && Power == 1 && timer == 8) {
                        active.tick = 90;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_9))&&!isNull(world.getBlock(blockPos_9).definition)&&world.getBlock(blockPos_9).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_9).meta == 0){                  
                val block = world.getBlock(blockPos_9); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 9 && Power == 1 && timer == 9) {
                        active.tick = 100;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_10))&&!isNull(world.getBlock(blockPos_10).definition)&&world.getBlock(blockPos_10).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_10).meta == 0){                  
                val block = world.getBlock(blockPos_10); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 10 && Power == 1 && timer == 10) {
                        active.tick = 110;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_11))&&!isNull(world.getBlock(blockPos_11).definition)&&world.getBlock(blockPos_11).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_11).meta == 0){                  
                val block = world.getBlock(blockPos_11); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 12 && Power == 1 && timer == 11) {
                        active.tick = 120;
                        map["timer"] = timer + 1;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
            if(!isNull(world.getBlock(blockPos_12))&&!isNull(world.getBlock(blockPos_12).definition)&&world.getBlock(blockPos_12).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos_12).meta == 0){                  
                val block = world.getBlock(blockPos_12); 
                val Note = block.data.note;
                val Power = block.data.powered;
                val timer = isNull(map["timer"]) ? 0 : map["timer"].asInt();
                    if (Note == 9 && Power == 1 && timer == 12) {
                        active.tick = active.totalTick;
                        map["timer"] = 0;
                        ctrl.customData = data;
                    }
                    else {
                        event.preventProgressing("不和谐之音！");
                    }
            }
    })
    .addFinishHandler(function(event as RecipeFinishEvent) {
        val ctrl = event.controller;
        val world = ctrl.world;
        val pos = ctrl.pos;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, 4, 1, 3);
        val posTwo as IBlockPos = pos.createPosByFacing(ctrl.facing, -4, 1, 11);
        val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
        for blockPos in posCollection {
            if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "minecraft:noteblock"&&world.getBlock(blockPos).meta == 0){                  
                world.setBlockState(<blockstate:minecraft:air>, blockPos);  
            }
        }
    })
    .build();