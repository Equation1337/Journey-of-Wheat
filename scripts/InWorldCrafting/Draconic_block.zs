#priority 49
#loader crafttweaker reloadable

import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityItem;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;
import mods.zenutils.ICatenationBuilder;
import crafttweaker.command.ICommandSender;
import crafttweaker.command.ICommand;
import crafttweaker.command.ICommandManager;
import crafttweaker.server.IServer;

events.onEntityJoinWorld(function(event as EntityJoinWorldEvent) {
    val Entity = event.entity;
    val world= event.world;
    val pos = Entity.position;
    if(world.remote||isNull(Entity)||isNull(Entity.definition)) {
        return;
    }
    else if (Entity instanceof IEntityItem){
        val entityItem as IEntityItem = Entity;
        val Item=entityItem.item;
        if(isNull(Item)||isNull(Item.definition)) {
            return;
        }
        else if (Item.definition.id == "draconicevolution:dragon_heart") {
            val posOne = IBlockPos.create(pos.x, pos.y + 2, pos.z);
            val posTwo = IBlockPos.create(pos.x, pos.y - 2, pos.z);
            val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
            for blockPos in posCollection {
                if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "draconicevolution:draconium_block"&&world.getBlock(blockPos).meta == 1){                  
                    <entity:draconicevolution:dragonheartitem>.spawnEntity(world, pos);
                    event.cancel();
                    break;
                }
            }
        }
    }
});
events.onEntityJoinWorld(function(event as EntityJoinWorldEvent) {
    val Entity = event.entity;
    val world= event.world;
    val pos = Entity.position;
    if(world.remote||isNull(Entity)||isNull(Entity.definition)) {
        return;
    }
    else if (Entity.definition.id == "draconicevolution:dragonheartitem") {
        server.commandManager.executeCommandSilent(server, "playsound nuclearcraft:block.nc.fusion_run voice @p " + pos.x + " " + pos.y + " " + pos.z + " " + 100.0F + " " + 1.0F + " " + 1.0F);
        val posOne = IBlockPos.create(pos.x + 2, pos.y + 2, pos.z + 2);
        val posTwo = IBlockPos.create(pos.x - 2, pos.y - 2, pos.z - 2);
        val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
        world.catenation()
             .sleep(120).run(function(world, context) {  
                server.commandManager.executeCommandSilent(server, "playsound nuclearcraft:block.nc.fusion_run voice @p " + pos.x + " " + pos.y + " " + pos.z + " " + 100.0F + " " + 1.0F + " " + 1.0F);
             })
             .sleep(120).run(function(world, context) {  
                server.commandManager.executeCommandSilent(server, "playsound nuclearcraft:block.nc.fusion_run voice @p " + pos.x + " " + pos.y + " " + pos.z + " " + 100.0F + " " + 1.0F + " " + 1.0F);
             })
             .sleep(120).run(function(world, context) {  
                server.commandManager.executeCommandSilent(server, "playsound nuclearcraft:block.nc.fusion_run voice @p " + pos.x + " " + pos.y + " " + pos.z + " " + 100.0F + " " + 1.0F + " " + 1.0F);
             })
             .sleep(40).run(function(world, context) { 
                server.commandManager.executeCommandSilent(server, "stopsound @p voice nuclearcraft:block.nc.fusion_run");
                var timer as int = 0;
                for blockPos in posCollection {
                    if(!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "draconicevolution:draconium_block"&&world.getBlock(blockPos).meta == 1){                  
                        world.setBlockState(<blockstate:draconicevolution:draconic_block>, blockPos);
                        timer += 1;
                        if (timer >= 4) {
                            timer = 0;
                            Entity.removeFromWorld();
                            world.performExplosion(null, pos.x, pos.y, pos.z, 5.0, true, true);
                            break;
                        }
                    }
                }
             })
             .start();
    }
});