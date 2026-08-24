#loader crafttweaker reloadable
import crafttweaker.data.IData;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.item.IItemStack;
import crafttweaker.command.ICommandSender;
import crafttweaker.command.ICommand;
import crafttweaker.command.ICommandManager;
import crafttweaker.server.IServer;
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

RecipeBuilder.newBuilder("work", "sun",300, 0, false)
    .addFluidInput(<liquid:sun> * 1000)
    .addStartHandler(function (event as RecipeStartEvent){
        val ctrl = event.controller;
        val pos = ctrl.pos;
        val world = ctrl.world;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, 10, 10, 2);
        val posTwo as IBlockPos  = pos.createPosByFacing(ctrl.facing, -10, 14, 6);
        val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
        server.commandManager.executeCommandSilent(server, "playsound minecraft:record.13 voice @p " + ctrl.pos.x + " " + ctrl.pos.y + " " + ctrl.pos.z + " " + 100.0F + " " + 1.0F + " " + 1.0F);
        for blockPos in posCollection {
            if(!world.remote&&!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "extendedcrafting:storage"&&world.getBlock(blockPos).meta == 0){
                world.setBlockState(<blockstate:extendedcrafting:storage:LUMINESSENCE>, blockPos);
            }
        }
    })
    .addFinishHandler(function (event as RecipeFinishEvent){
        val ctrl = event.controller;
        val world = ctrl.world;
        val pos = ctrl.pos;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, 10, 10, 2);
        val posTwo as IBlockPos  = pos.createPosByFacing(ctrl.facing, -10, 14, 6);
        val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
        server.commandManager.executeCommandSilent(server, "stopsound @p voice minecraft:record.13");
        for blockPos in posCollection {
            if(!world.remote&&!isNull(world.getBlock(blockPos))&&!isNull(world.getBlock(blockPos).definition)&&world.getBlock(blockPos).definition.id has "extendedcrafting:storage"&&world.getBlock(blockPos).meta == 1){
                world.setBlockState(<blockstate:extendedcrafting:storage>, blockPos);
            }
        }
    })
    .addEnergyPerTickInput(2147483647)
    .addItemOutput(<extrautils2:suncrystal> * 1000000)
    .addRecipeTooltip("§e工作时三颗亘古不灭之核同时亮起")
    .setParallelized(false)
    .build();