#priority 101
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.block.state.IBlockState;
import native.vazkii.botania.api.BotaniaAPI;
 
import crafttweaker.item.IItemStack;
 
 
zenClass ManaInfusionR{
    zenConstructor(output as IItemStack,input as IItemStack,mana as int,catalyst as IItemStack){
        val o=output as ItemStack;
        val i=input as ItemStack;
        val c=catalyst.asBlock().definition.getStateFromMeta(catalyst.damage)as IBlockState;
        val r=BotaniaAPI.registerManaInfusionRecipe(o,i,mana);
        r.setCatalyst(c);
    }
}

ManaInfusionR(<embers:blend_caminite>,<botania:manaresource:23>,1000,<environmentaltech:erodium>);
ManaInfusionR(<embers:crystal_ember>,<thaumcraft:nugget:9>,500,<embers:block_caminite_brick>);
ManaInfusionR(<embers:ember_cluster>,<embers:crystal_ember>,5000,<embers:crystal_cell>);
ManaInfusionR(<thaumcraft:salis_mundus>,<botania:manaresource:23>,1000,<thaumicbases:dustblock>);
ManaInfusionR(<thaumcraft:sapling_greatwood>,<minecraft:sapling>,500000,<embers:ember_injector>);
ManaInfusionR(<thaumcraft:sapling_silverwood>,<randomthings:spectresapling>,500000,<embers:ember_injector>);
ManaInfusionR(<botania:alfheimportal>,<botania:livingwood:5>,1000000,<botania:storage:1>);
ManaInfusionR(<botania:manaresource:5>,<botanicadds:gaia_shard>,10000,<botanicadds:terra_catalyst>);