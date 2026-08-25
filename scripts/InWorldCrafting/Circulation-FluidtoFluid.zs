//by Circulation未经允许禁止改动，取用等
#modloaded randomtweaker
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.entity.IEntityItem;
import crafttweaker.entity.IEntity;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.util.Math;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.event.WorldTickEvent;
import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;
import crafttweaker.damage.IDamageSource;

#priority 6000
#reloadable

zenClass FluidToFluid{
    static fluidToTluidRecipes as FluidToFluid[] = [];
    static hcstlb as IEntityItem[] = [];

    var FluidToFluidItem as IIngredient[];
    var FluidToFluidoutputFluid as ILiquidStack;
    var FluidToFluidinputFluid as ILiquidStack;
    var FluidToFluidChance as float;
    var FluidToFluidItemChance as float;

    zenConstructor(item as IIngredient[],fluid as ILiquidStack,fluidout as ILiquidStack,Chance as float,itemchance as float){
        this.FluidToFluidItem = item as IIngredient[];
        this.FluidToFluidinputFluid = fluid as ILiquidStack;
        this.FluidToFluidoutputFluid = fluidout as ILiquidStack;
        this.FluidToFluidChance = Chance as float;
        this.FluidToFluidItemChance = itemchance as float;
    }

    function getOutputFluid() as ILiquidStack{
        return this.FluidToFluidoutputFluid;
    }

    function getInputFluid() as ILiquidStack{
        return this.FluidToFluidinputFluid;
    }

    function getItemInputs() as IItemStack[]{
        return this.FluidToFluidItem;
    }
    
    function getChance() as float{
        return this.FluidToFluidChance;
    }

    function getItemChance() as float{
        return this.FluidToFluidItemChance;
    }
}

JEI.createJei("fluidtofluid_jei", "流体转化")
    .setModid("minecraft")
    .setBackground(IJeiUtils.createBackground(111, 41))
    .addSlot(IJeiUtils.createLiquidSlot(48,1,true,false))
    .addSlot(IJeiUtils.createItemSlot(2147483640,2147483640,true,false))
    .addElement(IJeiUtils.createArrowElement(21,2,0))
    .addElement(IJeiUtils.createArrowElement(68,2,0))
    .addSlot(IJeiUtils.createLiquidSlot(95,1,false,false))
    .addSlot(IJeiUtils.createItemSlot(1,1,true))
    .setIcon(<enderio:item_fluid_filter>)
.register();

addRecipe(<contenttweaker:infinity_guolv>,<liquid:water_6>,<liquid:water_7>,0.5f,0.01f);

//输入物品*支持矿词 转化前流体 转化后流体 转化流体成功率 物品消耗概率
static addRecipe as function(IIngredient,ILiquidStack,ILiquidStack,float,float)void = function (item as IIngredient,fluid as ILiquidStack,fluidout as ILiquidStack,Chance as float,itemchance as float) as void{
    val bfb as string = "" + 1.0f * Math.round(Chance * 1000.0f) / 10;
    val bfb2 as string = "" + 1.0f * Math.round(itemchance * 1000.0f) / 10;
    val tooltip1 = IJeiUtils.createFontInfoElement("将" + item.items[0].displayName + "投入世界中的" + fluid.displayName + "后",0,18,111,8,0x000000);
    val tooltip2 = IJeiUtils.createFontInfoElement("有" + bfb + "%的概率将流体转换为" + fluidout.displayName,0,25,111,8,0x000000);
    var str as string = "";
    if (itemchance == 1){
        str = "物品一定会被消耗";
    } else if (itemchance == 0){
        str = "物品不会被消耗";
    } else {
        str = "有" + bfb2 + "%的概率消耗物品";
    }
    val tooltip3 = IJeiUtils.createFontInfoElement(str,0,33,111,8,0x000000);
    
    FluidToFluid.fluidToTluidRecipes += (FluidToFluid(item.items,fluid,fluidout,Chance,itemchance));
    JEI.createJeiRecipe("fluidtofluid_jei").setInputs([fluid * 1000,item]).addOutput(fluidout * 1000).setElements([tooltip1,tooltip2,tooltip3]).build();
};

global F as function(int)FluidToFluid = function (i as int) as FluidToFluid{
    return FluidToFluid.fluidToTluidRecipes[i];
};

events.onEntityJoinWorld(function(event as EntityJoinWorldEvent){
    val world = event.world;
    if (!world.remote){
        val ent = event.entity;
        if (ent instanceof IEntityItem){
            val entitem as IEntityItem = ent;
            for recipe in FluidToFluid.fluidToTluidRecipes{
                if (isNull(entitem.item)){
                    return;
                }
                if (wpsldb(recipe.getItemInputs(),entitem.item)){
                    FluidToFluid.hcstlb += entitem;
                    entitem.isInvulnerable = true;
                    break;
                }
            }
        } else {
            return;
        }
    }
});

events.onWorldTick(function(event as WorldTickEvent){
    val world = event.world;
    if (!world.remote){
        var list as IEntityItem[] = [];
        for ent in FluidToFluid.hcstlb{
            if (ent.dimension != world.dimension){
                break;
            }
            if (!ent.isAlive()) {
                list += ent;
            } else {
                if (!isNull(world.getBlock(ent.position).fluid)){
                    val fluid = world.getBlock(ent.position).fluid;
                    for recipe in FluidToFluid.fluidToTluidRecipes{
                        var recipeitem = <minecraft:cobblestone>;
                        val item = ent.item;
                        for i in recipe.getItemInputs(){
                            if (wpdb(item,i)){
                                recipeitem = i;
                                break;
                            }
                        }
                        if (wpdb(recipeitem,item) && fluid.name == recipe.getInputFluid().name && world.getBlockState(ent.position).meta == 0){
                            val amount = item.amount;
                            val recipeamount = recipe.getItemInputs()[0].amount;
                            val Chance = recipe.getChance();
                            val itemchance = recipe.getItemChance();

                            if (amount >= recipeamount){
                                if (world.random.nextFloat(0.0f,1.0f) < itemchance){
                                    if ((amount - recipeamount) != 0){
                                        ent.setItem(item * (amount - recipeamount));
                                    } else {
                                        world.removeEntity(ent);
                                    }
                                }
                                if (world.random.nextFloat(0.0f,1.0f) < Chance){
                                    world.setBlockState(recipe.getOutputFluid().definition.block.definition.defaultState,ent.position);
                                }
                            }
                        }
                    }
                }
            }
        }
        if (list.length != 0){
            var list2 as IEntityItem[] = [];
            for ent in FluidToFluid.hcstlb{
                if (!(list in ent)){
                    list2 += ent;
                }
            }
            FluidToFluid.hcstlb = list2;
            list = [];
        }
    }
});