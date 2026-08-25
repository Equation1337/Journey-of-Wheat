#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerInteractBlockEvent;

function Deploying(inputItem as IItemStack, inputBlock as string, inputBlock_meta as int, outputBlock as IItemStack, outputBlock_meta as int, itemExpend as bool){
    events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent){
        var Deploying_block = event.block;
        var Deploying_item = event.item;
        var Deploying_position = event.position;
        var world0 = event.world;
        var player = event.player;
        if(world0.remote){
            return;
        }
        if(inputItem.matches(Deploying_item)){
            if(!isNull(Deploying_block) && Deploying_block.definition.id == inputBlock && Deploying_block.meta == inputBlock_meta){
                world0.destroyBlock(Deploying_position, false);
                world0.setBlockState(outputBlock.asBlock().definition.getStateFromMeta(outputBlock_meta), Deploying_position);
                if(itemExpend != false){
                    Deploying_item.mutable().withAmount(Deploying_item.amount - 1);
                }  
            }
        }
    });
}

Deploying(
    <minecraft:blaze_rod>, 
    "minecraft:quartz_block", 
    0, 
    <botania:blazeblock>,
    0, 
    true
);
Deploying(
    <botania:rune:13>, 
    "minecraft:stone", 
    0, 
    <minecraft:netherrack>,
    0, 
    false
);
Deploying(
    <immersiveengineering:metal:38>, 
    "minecraft:redstone_block", 
    0, 
    <immersiveengineering:metal_decoration0>,
    3, 
    true
);
Deploying(
    <immersiveengineering:material:8>,
    "immersiveengineering:sheetmetal", 
    9, 
    <immersiveengineering:metal_decoration0>,
    4, 
    true
);
Deploying(
    <immersiveengineering:material:9>, 
    "immersiveengineering:sheetmetal", 
    8, 
    <immersiveengineering:metal_decoration0>,
    5, 
    true
);
Deploying(
    <immersiveengineering:material:27>, 
    "immersiveengineering:metal_decoration1", 
    5, 
    <immersiveintelligence:metal_decoration>,
    1, 
    true
);
Deploying(
    <immersiveintelligence:material:7>, 
    "immersiveengineering:metal_decoration1", 
    5, 
    <immersiveintelligence:metal_decoration>,
    2, 
    true
);
Deploying(
    <immersiveintelligence:material_spring>, 
    "immersiveengineering:wooden_decoration", 
    1, 
    <immersiveintelligence:metal_decoration>,
    3,
    true
);
Deploying(
    <immersiveintelligence:material_spring:1>, 
    "immersiveengineering:wooden_decoration", 
    1, 
    <immersiveintelligence:metal_decoration>,
    4, 
    true
);
Deploying(
    <immersiveengineering:metal:38>,
    "immersiveengineering:sheetmetal",
    9,
    <ic2:resource:12>,
    12,
    true
);
Deploying(
    <torcherino:blocktorcherino>, 
    "treetweaker:youzi", 
    0, 
    <treetweaker:youzi_charged>,
    0, 
    true
);