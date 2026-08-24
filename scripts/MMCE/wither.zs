#priority 50
#loader crafttweaker reloadable

import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.command.ICommandSender;
import crafttweaker.command.ICommand;
import crafttweaker.command.ICommandManager;
import crafttweaker.server.IServer;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IBlockPos;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.player.IPlayer;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;

MMEvents.onControllerGUIRender("wither", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val nikabala = isNull(map["nkblAmount"]) ? 3 : map["nkblAmount"].asFloat();
    val result = isNull(map["resultAmount"]) ? 0 : map["resultAmount"].asFloat();

    var info as string[] = [
        "§6§l ---------- §d凋零收容仓监控器 §6----------",
        "§b逆卡巴拉计数器： §e" + nikabala,
    ];

    if (result == 1) {
        info += "§2工作结果: 优!";
    }

    if (result == 2) {
        info += "§e工作结果: 良";
    }
    
    if (result == 3) {
        info += "§4工作结果: 差!";
    }

    info += "§6 ---------------------------------------------";

    event.extraInfo = info;
});

function WORK(event as RecipeFinishEvent) {
    

}

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent) {
    var e=event.entityLivingBase;
    var w= e.world;
    if(!w.remote && !isNull(e.definition)) {
        if(e.definition.id == "minecraft:wither") {
            server.commandManager.executeCommandSilent(server, "stopsound @p voice minecraft:record.11");
        }
    }
});

function NKBL(event as RecipeFinishEvent) as void {
    val ctrl = event.controller;
    val player = ctrl.ownerName;
    val world = ctrl.world;
    val data = ctrl.customData;
    val map = data.asMap();
    val pos as IBlockPos = ctrl.pos.createPosByFacing(ctrl.facing, 0, 1, 4);
    if (!world.remote) {
        <entity:minecraft:wither>.spawnEntity(world, pos);
        server.commandManager.executeCommandSilent(server, "playsound minecraft:record.11 voice " + player + " " + ctrl.pos.x + " " + ctrl.pos.y + " " + ctrl.pos.z + " " + 100.0F + " " + 1.0F + " " + 1.0F);
    }
    else {
        return;
    }
}

function checkMaxNKBL(map as IData[string]) as bool {
    val nikabala = isNull(map["nkblAmount"]) ? 3 : map["nkblAmount"].asFloat();
    return nikabala >= 3;
}

function checkNKBLInputAmount(map as IData[string]) as bool {
    val remainMaintainer = isNull(map["nkblAmount"]) ? 3 : map["nkblAmount"].asFloat();
    return remainMaintainer > 0;
}

RecipeBuilder.newBuilder("diaoling", "wither", 3000)
    .addEnergyPerTickInput(256)
    .addFinishHandler(function (event as RecipeFinishEvent){
        val ctrl = event.controller;
        val world = ctrl.world;
        val data = ctrl.customData;
        val map = data.asMap();
        val roll = world.getRandom().nextInt(1,3);
        val nikabala = isNull(map["nkblAmount"]) ? 3 : map["nkblAmount"].asFloat();
        if (nikabala < 1) {
            NKBL(event); 
            map["nkblAmount"] = 3;
            ctrl.customData = data;
        }
        map["resultAmount"] = roll;
        ctrl.customData = data;
        if (roll == 1 && !checkMaxNKBL(map)) {
            map["nkblAmount"] = nikabala + 1;
            ctrl.customData = data;
        }
        if (roll == 3 && checkNKBLInputAmount(map)) {
            map["nkblAmount"] = nikabala - 1;
            ctrl.customData = data;
        }
    })
    .addItemOutputs(<minecraft:nether_star>, <futuremc:wither_rose>)
    .build();