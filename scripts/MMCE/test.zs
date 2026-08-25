/*#priority 49
#loader crafttweaker reloadable

import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IWorld;
import crafttweaker.event.BlockBreakEvent;

events.onBlockBreak(function(event as BlockBreakEvent){
    val Pos = event.position;
    val world = event.world;
    val block = event.blockState.commandString;
    print(block);
});*/