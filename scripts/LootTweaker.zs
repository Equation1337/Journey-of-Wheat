#priority 0
#loader crafttweaker reloadable

import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

    mods.jei.JEI.addDescription(<contenttweaker:fenge_huizhang_unstable>,"凋零:25%掉落1");
    events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){
        var e=event.entityLivingBase;
        var w=e.world;
        if(!w.remote){
            if (!isNull(e.definition)){
                if(e.definition.id == "minecraft:wither"){
                    var roll = w.getRandom().nextInt(0,8);
                    if(roll > 6){
                        e.dropItem(<contenttweaker:fenge_huizhang_unstable> * 1);
                    }
                }
            }
        }
    });