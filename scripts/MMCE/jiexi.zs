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
import mods.modularmachinery.IngredientArrayBuilder;

MMEvents.onControllerGUIRender("jiexi", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val amount = isNull(map["fluidAmount"]) ? 0 : map["fluidAmount"].asInt();

    var info as string[] = [
        "§6§l ---------- §l解析之心显示器 §6----------",
        "§b当前所需流体数：§a" + amount + " mb",
        "§6 ---------------------------------------------"
    ];

    event.extraInfo = info;
});

MMEvents.onMachinePreTick("jiexi", function(event as MachineTickEvent) {
    val ctrl = event.controller;
    val world = ctrl.world;
    if (event.controller.world.worldInfo.worldTotalTime % 10 == 7) {
        val liquidHandlerOne = world.getLiquidHandler(ctrl.relativePos(2, 2, 2));
        val liquidHandlerTwo = world.getLiquidHandler(ctrl.relativePos(-2, 2, 2));
        Sync.addSyncTask(function() {
            val content = liquidHandlerOne.tankProperties[0].contents;
            if (!isNull(content) && content.definition.name != "yitai") {
                return;
            }
            val fluidAmount = isNull(content) ? 0 : content.amount;
            val minValue = max(-1500, -fluidAmount);
            val maxValue = min(1500, 128000 - fluidAmount);
            val amount = world.random.nextInt(minValue, maxValue);
            if (amount > 0) {
                liquidHandlerOne.fill(<liquid:yitai>.withAmount(amount), true);
            } else if (amount < 0) {
                liquidHandlerOne.drain(-amount, true);
            }
        });
        Sync.addSyncTask(function() {
            val content = liquidHandlerTwo.tankProperties[0].contents;
            if (!isNull(content) && content.definition.name != "pink") {
                return;
            }
            val fluidAmount = isNull(content) ? 0 : content.amount;
            val minValue = max(-1500, -fluidAmount);
            val maxValue = min(1500, 128000 - fluidAmount);
            val amount = world.random.nextInt(minValue, maxValue);
            if (amount > 0) {
                liquidHandlerTwo.fill(<liquid:pink>.withAmount(amount), true);
            } else if (amount < 0) {
                liquidHandlerTwo.drain(-amount, true);
            }
        });
    }
});

RecipeBuilder.newBuilder("creative", "jiexi", 100)
    .addRecipeTooltip("§b机器两侧的铁桶内流体数会实时变化", "§e左桶为以太源质, 右桶为粉红源质", "§a每次工作两桶所需流体数随机为500~2000mb", "§a需保证桶内流体与此值相差不大", "§c注意: 左右两桶内流体数必须一致")
    .addItemInput(<contenttweaker:juzhen> * 16).setChance(0)
    .addEnergyPerTickInput(21474836470)
    .addRandomItemOutput(
        IngredientArrayBuilder.newBuilder()
        .addIngredient(<appliedenergistics2:creative_energy_cell>).setChance(0.3)
        .addIngredient(<botania:pool:1>).setChance(0.3)
        .addIngredient(<botaniverse:morespreader:4>).setChance(0.3)
        .addIngredient(<buildcraftcore:engine:3>).setChance(0.3)
        .addIngredient(<bloodmagic:sacrificial_dagger:1>).setChance(0.3)
        .addIngredient(<bloodmagic:activation_crystal:2>).setChance(0.3)
        .addIngredient(<refraction:creative_laser>).setChance(0.3)
        .addIngredient(<functionalstoragelegacy:creative_vending_upgrade>).setChance(0.3)
        .addIngredient(<roots:creative_pouch>).setChance(0.3)
        .addIngredient(<enderio:block_creative_spawner>).setChance(0.3)
        .addIngredient(<embers:creative_ember_source>).setChance(0.3)
        .addIngredient(<draconicevolution:draconium_capacitor:2>).setChance(0.3)
        .addIngredient(<deepmoblearning:creative_model_learner>).setChance(0.3)
        .addIngredient(<calculator:creativepowercube>).setChance(0.3)
        .addIngredient(<qmd:creative_particle_source>).setChance(0.3)
        .addIngredient(<psi:cad_assembly:5>).setChance(0.3)
        .addIngredient(<psicosts:creative_cell>).setChance(0.3)
        .addIngredient(<lightningcraft:lightning_cell:3>).setChance(0.3)
        .addIngredient(<ic2:te:86>).setChance(0.3)
        .addIngredient(<essentialcraft:device:4>).setChance(0.3)
        .addIngredient(<extrautils2:spike_creative>).setChance(0.3)
        .addIngredient(<extrautils2:drum:4>).setChance(0.3)
        .addIngredient(<extrautils2:passivegenerator:6>).setChance(0.3)
        .addIngredient(<opencomputers:casecreative>).setChance(0.3)
        .addIngredient(<opencomputers:material:25>).setChance(0.3)
        .addIngredient(<opencomputers:material:22>).setChance(0.3)
        .addIngredient(<opencomputers:component:12>).setChance(0.3)
        .addIngredient(<opencomputers:component:18>).setChance(0.3)
        .addIngredient(<opencomputers:upgrade:32>).setChance(0.3)
        .addIngredient(<pneumaticcraft:creative_compressor>).setChance(0.3)
        .addIngredient(<projectred-fabrication:ic_chip:1>).setChance(0.3)
        .addIngredient(<draconicevolution:creative_rf_source>).setChance(0.3)
    )
    .addStartHandler(function (event as RecipeStartEvent){
        val ctrl = event.controller;
        val world = ctrl.world;
        val data = ctrl.customData;
        val map = data.asMap();
        val amount = world.random.nextInt(500, 2000);
        map["fluidAmount"] = amount;
        ctrl.customData = data;
    })
    .addPreTickHandler(function(event as RecipeTickEvent) {
        val ctrl = event.controller;
        val world = ctrl.world;
        val liquidHandlerOne = world.getLiquidHandler(ctrl.relativePos(2, 2, 2));
        val liquidHandlerTwo = world.getLiquidHandler(ctrl.relativePos(-2, 2, 2));
        val contentOne = liquidHandlerOne.tankProperties[0].contents;
        val contentTwo = liquidHandlerTwo.tankProperties[0].contents;
        val data = ctrl.customData;
        val map = data.asMap();
        val amount = isNull(map["fluidAmount"]) ? 0 : map["fluidAmount"].asInt();
        if (contentOne.definition.name == "yitai" && contentOne.definition.name == "pink" && Math.abs(contentOne.amount - 128000) <= amount && Math.abs(contentTwo.amount - 128000) <= amount && Math.abs(contentOne.amount - 128000) == Math.abs(contentTwo.amount - 128000)) {
            return;
        }
        event.setFailed(false, "流体数量不匹配");
    })
    .build();