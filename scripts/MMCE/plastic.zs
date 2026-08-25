#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IBlockState;

import novaeng.hypernet.HyperNetHelper;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineStructureFormedEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

val hd2 as string[int] = {
    0:".black",
    1:".red",
    2:".green",
    3:".brown",
    4:".blue",
    5:".purple",
    6:".cyan",
    7:".silver",
    8:".gray",
    9:".pink",
    10:".lime",
    11:".yellow",
    12:".lightBlue",
    13:".magenta",
    14:".orange",
    15:".white"
};

val red = FactoryRecipeThread.createCoreThread("染料混合器#R");
val green = FactoryRecipeThread.createCoreThread("染料混合器#G");
val blue = FactoryRecipeThread.createCoreThread("染料混合器#B");
val plastic = FactoryRecipeThread.createCoreThread("塑料成型器#P");

MachineModifier.setMaxThreads("plastic", 0);
MachineModifier.addCoreThread("plastic", red);
MachineModifier.addCoreThread("plastic", green);
MachineModifier.addCoreThread("plastic", blue);
MachineModifier.addCoreThread("plastic", plastic);

//控制器gui
MMEvents.onControllerGUIRender("plastic", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val red = isNull(map["redAmount"]) ? 0 : map["redAmount"].asInt();
    val green = isNull(map["greenAmount"]) ? 0 : map["greenAmount"].asInt();
    val blue = isNull(map["blueAmount"]) ? 0 : map["blueAmount"].asInt();
    val displayname = isNull(map["displayname"]) ? "null" : map["displayname"].asString();

    var info as string[] = [
        "§6§l ---------- §e塑料混合器显示器 §6----------",
        "§cR: " + red,
        "§aG: " + green,
        "§9B: " + blue,
        "§b当前塑料板: " + displayname,
        "§6 ---------------------------------------------"
    ];

    event.extraInfo = info;
});

<ore:biaojiwu>.add(<pneumaticcraft:plastic:*>);

RecipeBuilder.newBuilder("biaoji", "plastic",20, 0, false)
    .addInput(<ore:biaojiwu>).setTag("biaojiwu").setChance(0)
        .setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
            val name_1 = item.definition.name;
            val meta = item.metadata;
            val name = name_1 + hd2[meta];
            val displayname = item.displayName;
            val data = ctrl.customData;
            val map = data.asMap();
            map["name"] = name;
            map["displayname"] = displayname;
            ctrl.customData = data;
            return true;
        })
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val name = isNull(map["name"]) ? "null" : map["name"].asString();
        val world = ctrl.world;
        val Pos = IBlockPos.create(ctrl.pos.x,ctrl.pos.y + 1,ctrl.pos.z);
        val iitem = world.getItemHandler(Pos);
        if (!world.remote && !isNull(iitem)) {
            val item = iitem.getStackInSlot(0);
            val Item = item.name;
            if(name != "null" && name == Item) {
                event.setFailed("塑料板已经写入，可以正常运行");
                return;
            }   
        }
        else {
            return;
        }
    })
    .addRecipeTooltip("§b标记用的电路板需要放置在","§b控制器正上方的微型物品输入仓内","§b只需要一个")
    .setParallelized(false)
    .setThreadName("塑料成型器#P")
    .build();

//红
RecipeBuilder.newBuilder("red", "plastic", 1)
    .addItemInput(<ore:dyeRed>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val red = isNull(map["redAmount"]) ? 0 : map["redAmount"].asInt();
        if (red >= 100) {
            event.setFailed("红色染料已满");
            return;
        }
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val red = isNull(map["redAmount"]) ? 0 : map["redAmount"].asInt();
        map["redAmount"] = red + 1;
        ctrl.customData = data;
    })
    .addRecipeTooltip("§c为混合机添加 红色 染料")
    .setMaxThreads(1)
    .setThreadName("染料混合器#R")
    .setParallelized(false)
    .build();
//绿
RecipeBuilder.newBuilder("green", "plastic", 1)
    .addItemInput(<ore:dyeGreen>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val green = isNull(map["greenAmount"]) ? 0 : map["greenAmount"].asInt();
        if (green >= 100) {
            event.setFailed("绿色染料已满");
            return;
        }
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val green = isNull(map["greenAmount"]) ? 0 : map["greenAmount"].asInt();
        map["greenAmount"] = green + 1;
        ctrl.customData = data;
    })
    .addRecipeTooltip("§a为混合机添加 绿色 染料")
    .setMaxThreads(1)
    .setThreadName("染料混合器#G")
    .setParallelized(false)
    .build();
//蓝
RecipeBuilder.newBuilder("blue", "plastic", 1)
    .addItemInput(<ore:dyeBlue>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val blue = isNull(map["blueAmount"]) ? 0 : map["blueAmount"].asInt();
        if (blue >= 100) {
            event.setFailed("蓝色染料已满");
            return;
        }
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val blue = isNull(map["blueAmount"]) ? 0 : map["blueAmount"].asInt();
        map["blueAmount"] = blue + 1;
        ctrl.customData = data;
    })
    .addRecipeTooltip("§9为混合机添加 蓝色 染料")
    .setMaxThreads(1)
    .setThreadName("染料混合器#B")
    .setParallelized(false)
    .build();

function assembly(Name as string, Output as IIngredient, R as int, G as int, B as int){
    <ore:biaojiwu>.add(Output.itemArray[0]);
    RecipeBuilder.newBuilder(Name, "plastic",1,1,false)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val blue = isNull(map["blueAmount"]) ? 0 : map["blueAmount"].asInt();
        val green = isNull(map["greenAmount"]) ? 0 : map["greenAmount"].asInt();
        val red = isNull(map["redAmount"]) ? 0 : map["redAmount"].asInt();
        if (blue <= 0 && B >= 1) {
            event.setFailed("染料不足");
            return;
        }
        if (green <= 0 && G >= 1) {
            event.setFailed("染料不足");
            return;
        }
        if (red <= 0 && R >= 1) {
            event.setFailed("染料不足");
            return;
        }
        })
        .addPostCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val name = isNull(map["name"]) ? "null" : map["name"].asString();
            val itemname = Output.itemArray[0].name;
            if(name == "null") {
                event.setFailed("标记塑料板不存在，请先标记");
                return;
            } else if(name != itemname) {
                event.setFailed("请输入正确的塑料板");
                return;
            }
        })
        .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent){
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val blue = isNull(map["blueAmount"]) ? 0 : map["blueAmount"].asInt();
            if (B >= 1) {
                map["blueAmount"] = blue - B;
                ctrl.customData = data;
            }
            val green = isNull(map["greenAmount"]) ? 0 : map["greenAmount"].asInt();
            if (G >= 1) {
                map["greenAmount"] = green - G;
                ctrl.customData = data;
            }
            val red = isNull(map["redAmount"]) ? 0 : map["redAmount"].asInt();
            if (R >= 1) {
                map["redAmount"] = red - R;
                ctrl.customData = data;
            }
        })
        .addCompressedAirPerTickInput(2, 100)
        .addFluidInput(<liquid:plastic> * 1000)
        .addOutput(Output)
        .setMaxThreads(1)
        .setParallelized(false)
        .setThreadName("塑料成型器#P")
    .build();
}
assembly("plastic_1", <pneumaticcraft:plastic>, 1, 1, 1);
assembly("plastic_2", <pneumaticcraft:plastic:1>, 1, 0, 0);
assembly("plastic_3", <pneumaticcraft:plastic:2>, 0, 1, 0);
assembly("plastic_4", <pneumaticcraft:plastic:3>, 1, 1, 0);
assembly("plastic_5", <pneumaticcraft:plastic:4>, 0, 0, 1);
assembly("plastic_6", <pneumaticcraft:plastic:5>, 1, 0, 1);
assembly("plastic_7", <pneumaticcraft:plastic:6>, 0, 1, 1);
assembly("plastic_8", <pneumaticcraft:plastic:7>, 1, 1, 1);
assembly("plastic_9", <pneumaticcraft:plastic:8>, 1, 1, 1);
assembly("plastic_10", <pneumaticcraft:plastic:9>, 1, 0, 0);
assembly("plastic_11", <pneumaticcraft:plastic:10>, 0, 1, 0);
assembly("plastic_12", <pneumaticcraft:plastic:11>, 1, 1, 0);
assembly("plastic_13", <pneumaticcraft:plastic:12>, 0, 0, 1);
assembly("plastic_14", <pneumaticcraft:plastic:13>, 2, 0, 1);
assembly("plastic_15", <pneumaticcraft:plastic:14>, 2, 1, 0);
assembly("plastic_16", <pneumaticcraft:plastic:15>, 0, 0, 0);