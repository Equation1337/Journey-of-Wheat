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
import mods.modularmachinery.FactoryRecipeFinishEvent;
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
import mods.modularmachinery.MachineController;
import novaeng.NovaEngUtils;
import mods.modularmachinery.RecipeEvent;
import mods.modularmachinery.RecipeTickEvent;

val yitaiThread = FactoryRecipeThread.createCoreThread("以太汲取仓");
val pinkThread = FactoryRecipeThread.createCoreThread("粉红汲取仓");

MachineModifier.setMaxThreads("yuanzhi", 0);
MachineModifier.addCoreThread("yuanzhi", yitaiThread);
MachineModifier.addCoreThread("yuanzhi", pinkThread);

RecipeBuilder.newBuilder("yitai", "yuanzhi", 40, 1, false)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val pos = ctrl.pos;
        val world = ctrl.world;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, 6, 0, 2);
        val posTwo as IBlockPos  = pos.createPosByFacing(ctrl.facing, 2, 6, 6);
        val entity  = world.getEntitiesInArea(posOne, posTwo);
        if (isNull(entity)) {
            event.setFailed("未检测到实体");
            return;
        }
        else {
            for e in entity {
                if (world.remote || e.definition.id != "minecraft:wither") {
                    event.setFailed("实体不正确");
                    return;
                }
            }
        }
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
        val ctrl = event.controller;
        val pos = ctrl.pos;
        val world = ctrl.world;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, 6, 0, 2);
        val posTwo as IBlockPos  = pos.createPosByFacing(ctrl.facing, 2, 6, 6);
        val Pos as IBlockPos  = pos.createPosByFacing(ctrl.facing, 4, 1, 4);
        val entity  = world.getEntitiesInArea(posOne, posTwo);
        var roll = world.getRandom().nextInt(0,4);
        if (roll > 2) {
            for e in entity {
                if (!world.remote || e.definition.id == "minecraft:wither") {
                    e.onKillCommand();
                    <entity:botania:pink_wither>.spawnEntity(world, Pos);
                }
            }
        }
    })
    .addItemInput(<deepmoblearning:data_model_wither>.withTag({tier: 2})).setChance(0).setTag("wither")
    .addEnergyPerTickInput(2147483647)
    .addFluidOutput(<liquid:yitai> * 500).setTag("yitai")
    .setMaxThreads(1)
    .setThreadName("以太汲取仓")
    .addRecipeTooltip("§b左侧仓室为以太源质汲取，需要收容凋零，每次工作概率变为粉红凋零")
    .build();
RecipeBuilder.newBuilder("pink", "yuanzhi", 40, 1, false)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val pos = ctrl.pos;
        val world = ctrl.world;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, -6, 0, 2);
        val posTwo as IBlockPos  = pos.createPosByFacing(ctrl.facing, -2, 6, 6);
        val entity  = world.getEntitiesInArea(posOne, posTwo);
        if (entity.length == 0) {
            event.setFailed("未检测到实体");
            return;
        }
        else {
            for e in entity {
                if (world.remote || e.definition.id != "botania:pink_wither") {
                    event.setFailed("实体不正确");
                    return;
                }
            }
        }
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
        val ctrl = event.controller;
        val pos = ctrl.pos;
        val world = ctrl.world;
        val posOne as IBlockPos = pos.createPosByFacing(ctrl.facing, -6, 0, 2);
        val posTwo as IBlockPos  = pos.createPosByFacing(ctrl.facing, -2, 6, 6);
        val Pos as IBlockPos  = pos.createPosByFacing(ctrl.facing, -4, 1, 4);
        val entity  = world.getEntitiesInArea(posOne, posTwo);
        var roll = world.getRandom().nextInt(0,4);
        if (roll > 2) {
            for e in entity {
                if (!world.remote || e.definition.id == "botania:pink_wither") {
                    e.onKillCommand();
                    <entity:minecraft:wither>.spawnEntity(world, Pos);
                }
            }
        }
    })
    .addItemInput(<deepmoblearning:data_model_wither>.withTag({tier: 3})).setChance(0).setTag("pink_wither")
    .addEnergyPerTickInput(2147483647)
    .addFluidOutput(<liquid:pink> * 500).setTag("pink")
    .setMaxThreads(1)
    .setThreadName("粉红汲取仓")
    .addRecipeTooltip("§d右侧仓室为粉红源质汲取，需要收容粉红凋零，每次工作概率变为凋零")
    .build();