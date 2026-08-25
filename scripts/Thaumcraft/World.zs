import mods.randomtweaker.thaumcraft.IPlayer;
import crafttweaker.event.PlayerRightClickItemEvent;

events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent) {
    if(!event.world.remote && <contenttweaker:life_core>.matches(event.item)) {
        event.player.giverDreamJournl();
    }
});