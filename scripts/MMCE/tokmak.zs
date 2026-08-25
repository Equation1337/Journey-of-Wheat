//a part by Circulation
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

var riersshr = 10000;   //能级下单个能源仓输入速度
var riersscc = 100000000;   //能级下单个能源仓提供存储
//启动消耗极限不得超过2147483647
var riers1 = 800000000;   //能级1配方消耗启动能量
var riers2 = 1200000000;   //能级2配方消耗启动能量
var riers3 = 1600000000;   //能级3配方消耗启动能量


//==============================托卡马克聚变反应堆2型==============================
val jubian = FactoryRecipeThread.createCoreThread("聚变反应模块");
val shuru = FactoryRecipeThread.createCoreThread("能量输入模块");

// 工厂线程数设置
MachineModifier.setMaxThreads("tokmak", 0);
MachineModifier.addCoreThread("tokmak", jubian);
MachineModifier.addCoreThread("tokmak", shuru);

//参数设置
MMEvents.onStructureFormed("tokmak", function(event as MachineStructureFormedEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val dData = D(data);
    val nycs = dData.getInt("nycs", 0);
    val ccl = dData.getInt("ccl", 0);
    val map = data.asMap();
    val world=ctrl.world;
    val pos=ctrl.pos;
    val cjfw = ctrl.getBlocksInPattern(<modularmachinery:blockenergyinputhatch:*>);
    map["bh"] = 0;
    map["nycs"] = cjfw;
    ctrl.customData = data;
});

//添加控制器 GUI 信息
MMEvents.onControllerGUIRender("tokmak", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val dData = D(data);
    val nycs = dData.getInt("nycs", 0);
    val ccl = dData.getInt("ccl", 0);
    val map = data.asMap();
    val world=ctrl.world;
    val pos=ctrl.pos;
    var info as string[] = [
        "§4//////////// mk2型聚变反应堆 ////////////",
        "§4启动能量缓存：§a" + ccl + " / " + riersscc * nycs,
    ];

    event.extraInfo = info;
});
HyperNetHelper.proxyMachineForHyperNet("tokmak");

//启动能源输入
RecipeBuilder.newBuilder("tokmak_shuru", "tokmak", 10, 0, false)
    .addEnergyPerTickInput(riersshr)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val bl = event.factoryRecipeThread;
        val data = ctrl.customData;
        val map = data.asMap();
        val dData = D(data);
        val nycs = dData.getInt("nycs", 0);
        
        bl.addModifier("typeMultiplier", RecipeModifierBuilder.create("modularmachinery:energy", "input",nycs, 1, false).build());
    })
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val dData = D(data);
        val nycs = dData.getInt("nycs", 0);
        val ccl = dData.getInt("ccl", 0);
        if (ccl >= nycs * riersscc) {
            event.setFailed("§6启动能量已满，准备反应！");
            return;
        }
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val dData = D(data);
        val nycs = dData.getInt("nycs", 0);
        val ccl = dData.getInt("ccl", 0);
        val map = data.asMap();
        map["ccl"] = ccl + riersshr * 10 * nycs;
        ctrl.customData = data;
    })
    .setParallelized(false)
    .addRecipeTooltip("§6此配方用于输入启动能量")
    .addRecipeTooltip("§2实际的启动能量输入速度为能源仓数量乘"+ riersshr + "/t")
    .addRecipeTooltip("§4启动能量不足将无法运行配方！")
    .setThreadName("能量输入模块")
    .build();

//聚变配方运行
//riers决定配方能级
function registerRecipe(Name as string,riers as int, Inputs as ILiquidStack[],Output as ILiquidStack) {
    RecipeBuilder.newBuilder(Name,"tokmak", 5)
        .addEnergyPerTickInput(100000000)
        .addFluidInputs(Inputs)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val dData = D(data);
            val ccl = dData.getInt("ccl", 0);
            val bh = dData.getInt("bh", 0);
            if(bh < riers){
                if (ccl < riers) {
                    event.setFailed("§6启动能量缓存不足，无法开始配方！");
                    return;
                }
            }
        })
        .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val dData = D(data);
            val map = data.asMap();
            val ccl = dData.getInt("ccl", 0);
            val bh = dData.getInt("bh", 0);
            if(bh < riers){
                map["ccl"] = ccl - riers;
                map["bh"] = riers;
                ctrl.customData = data;
            } else {
                map["ccl"] = ccl - 0;
                ctrl.customData = data;
            }
        })
        .addFluidOutput(Output)
        .addRecipeTooltip("§6此配方启动能量消耗为" + riers)
        .addRecipeTooltip( "§6持续运行中不消耗第二次启动能量，", "§6若是运行中断将会导致重新扣除能量", "§6中途切换为其他配方若启动能量相同或更低时不需要重新启动")
        .setThreadName("聚变反应模块")
        .build();
}
//终结聚变  用于重置配方使能量正常消耗
RecipeBuilder.newBuilder("tokmak_zhongzhi", "tokmak", 1, 999, false)
    .addEnergyPerTickInput(1)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val dData = D(data);
        val bh = dData.getInt("bh", 0);
        val map = data.asMap();
        if(bh == 0){
            event.setFailed("§2当前反应堆空载中");
            return;
        } else {
            map["bh"] = bh - bh;
            ctrl.customData = data;
        }
    })
    .setParallelized(false)
    .addRecipeTooltip("§6此配方启动代表聚变周期结束", "§6需要重新消耗启动能量")
    .setThreadName("聚变反应模块")
    .build();

registerRecipe("t_1", riers1, [<liquid:santai> * 16, <liquid:shuangli> * 16], <liquid:santai_shuangli_hejin> * 16);
registerRecipe("t_2", riers2, [<liquid:infinity> * 16, <liquid:santai_shuangli_hejin> * 16], <liquid:lugenuo> * 16);
registerRecipe("t_3", riers3, [<liquid:lugenuo> * 16, <liquid:dragon_blood> * 100], <liquid:haipozhen> * 16);