#priority 50
#loader crafttweaker reloadable

//导包
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import scripts.libs.Util;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineModifier;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.Sync;
import mods.modularmachinery.RecipeCheckEvent;
import native.net.minecraft.item.ItemStack;

static items as IItemStack[]=[
    <contenttweaker:num_1>,<contenttweaker:num_2>,<contenttweaker:num_3>,<contenttweaker:num_4>,<contenttweaker:num_5>,<contenttweaker:num_6>,<contenttweaker:num_7>,<contenttweaker:num_8>,<contenttweaker:num_9>,<contenttweaker:num_10>,<contenttweaker:num_11>,<contenttweaker:num_12>,<contenttweaker:num_13>,<contenttweaker:num_14>,<contenttweaker:num_15>,<contenttweaker:num_16>,<contenttweaker:num_17>,<contenttweaker:num_18>,<contenttweaker:num_19>,<contenttweaker:num_20>,<contenttweaker:num_21>,<contenttweaker:num_22>,<contenttweaker:num_23>,<contenttweaker:num_24>,<contenttweaker:num_25>,<contenttweaker:num_26>,<contenttweaker:num_27>,<contenttweaker:num_28>,<contenttweaker:num_29>,<contenttweaker:num_30>,<contenttweaker:num_31>,<contenttweaker:num_32>,<contenttweaker:num_33>,<contenttweaker:num_34>,<contenttweaker:num_35>,<contenttweaker:num_36>,<contenttweaker:num_37>,<contenttweaker:num_38>,<contenttweaker:num_39>,<contenttweaker:num_40>,<contenttweaker:num_41>,<contenttweaker:num_42>,<contenttweaker:num_43>,<contenttweaker:num_44>,<contenttweaker:num_45>,<contenttweaker:num_46>,<contenttweaker:num_47>,<contenttweaker:num_48>,<contenttweaker:num_49>,<contenttweaker:num_50>,<contenttweaker:num_51>,<contenttweaker:num_52>,<contenttweaker:num_53>,<contenttweaker:num_54>,<contenttweaker:num_55>,<contenttweaker:num_56>,<contenttweaker:num_57>,<contenttweaker:num_58>,<contenttweaker:num_59>,<contenttweaker:num_60>,<contenttweaker:num_61>,<contenttweaker:num_62>,<contenttweaker:num_63>,<contenttweaker:num_64>,<contenttweaker:num_65>,<contenttweaker:num_66>,<contenttweaker:num_67>,<contenttweaker:num_68>,<contenttweaker:num_69>,<contenttweaker:num_70>,<contenttweaker:num_71>,<contenttweaker:num_72>,<contenttweaker:num_73>,<contenttweaker:num_74>,<contenttweaker:num_75>,<contenttweaker:num_76>,<contenttweaker:num_77>,<contenttweaker:num_78>,<contenttweaker:num_79>,<contenttweaker:num_80>,<contenttweaker:num_81>,<contenttweaker:num_82>,<contenttweaker:num_83>,<contenttweaker:num_84>,<contenttweaker:num_85>,<contenttweaker:num_86>,<contenttweaker:num_87>,<contenttweaker:num_88>,<contenttweaker:num_89>,<contenttweaker:num_90>,<contenttweaker:num_91>,<contenttweaker:num_92>,<contenttweaker:num_93>,<contenttweaker:num_94>,<contenttweaker:num_95>,<contenttweaker:num_96>,<contenttweaker:num_97>,<contenttweaker:num_98>,<contenttweaker:num_99>
    ];
static xyz as int[]=[2,0,2];

static itemsMapA as int[IItemStack]={<contenttweaker:num_1>:1,<contenttweaker:num_2>:2,<contenttweaker:num_3>:3,<contenttweaker:num_4>:4,<contenttweaker:num_5>:5,<contenttweaker:num_6>:6,<contenttweaker:num_7>:7,<contenttweaker:num_8>:8,<contenttweaker:num_9>:9,<contenttweaker:num_10>:10,<contenttweaker:num_11>:11,<contenttweaker:num_12>:12,<contenttweaker:num_13>:13,<contenttweaker:num_14>:14,<contenttweaker:num_15>:15,<contenttweaker:num_16>:16,<contenttweaker:num_17>:17,<contenttweaker:num_18>:18,<contenttweaker:num_19>:19,<contenttweaker:num_20>:20,<contenttweaker:num_21>:21,<contenttweaker:num_22>:22,<contenttweaker:num_23>:23,<contenttweaker:num_24>:24,<contenttweaker:num_25>:25,<contenttweaker:num_26>:26,<contenttweaker:num_27>:27,<contenttweaker:num_28>:28,<contenttweaker:num_29>:29,<contenttweaker:num_30>:30,<contenttweaker:num_31>:31,<contenttweaker:num_32>:32,<contenttweaker:num_33>:33,<contenttweaker:num_34>:34,<contenttweaker:num_35>:35,<contenttweaker:num_36>:36,<contenttweaker:num_37>:37,<contenttweaker:num_38>:38,<contenttweaker:num_39>:39,<contenttweaker:num_40>:40,<contenttweaker:num_41>:41,<contenttweaker:num_42>:42,<contenttweaker:num_43>:43,<contenttweaker:num_44>:44,<contenttweaker:num_45>:45,<contenttweaker:num_46>:46,<contenttweaker:num_47>:47,<contenttweaker:num_48>:48,<contenttweaker:num_49>:49,<contenttweaker:num_50>:50,<contenttweaker:num_51>:51,<contenttweaker:num_52>:52,<contenttweaker:num_53>:53,<contenttweaker:num_54>:54,<contenttweaker:num_55>:55,<contenttweaker:num_56>:56,<contenttweaker:num_57>:57,<contenttweaker:num_58>:58,<contenttweaker:num_59>:59,<contenttweaker:num_60>:60,<contenttweaker:num_61>:61,<contenttweaker:num_62>:62,<contenttweaker:num_63>:63,<contenttweaker:num_64>:64,<contenttweaker:num_65>:65,<contenttweaker:num_66>:66,<contenttweaker:num_67>:67,<contenttweaker:num_68>:68,<contenttweaker:num_69>:69,<contenttweaker:num_70>:70,<contenttweaker:num_71>:71,<contenttweaker:num_72>:72,<contenttweaker:num_73>:73,<contenttweaker:num_74>:74,<contenttweaker:num_75>:75,<contenttweaker:num_76>:76,<contenttweaker:num_77>:77,<contenttweaker:num_78>:78,<contenttweaker:num_79>:79,<contenttweaker:num_80>:80,<contenttweaker:num_81>:81,<contenttweaker:num_82>:82,<contenttweaker:num_83>:83,<contenttweaker:num_84>:84,<contenttweaker:num_85>:85,<contenttweaker:num_86>:86,<contenttweaker:num_87>:87,<contenttweaker:num_88>:88,<contenttweaker:num_89>:89,<contenttweaker:num_90>:90,<contenttweaker:num_91>:91,<contenttweaker:num_92>:92,<contenttweaker:num_93>:93,<contenttweaker:num_94>:94,<contenttweaker:num_95>:95,<contenttweaker:num_96>:96,<contenttweaker:num_97>:97,<contenttweaker:num_98>:98,<contenttweaker:num_99>:99,};
static itemsMapB as IItemStack[int]={1:<contenttweaker:num_1>, 2:<contenttweaker:num_2>, 3:<contenttweaker:num_3>, 4:<contenttweaker:num_4>, 5:<contenttweaker:num_5>, 6:<contenttweaker:num_6>, 7:<contenttweaker:num_7>, 8:<contenttweaker:num_8>, 9:<contenttweaker:num_9>, 10:<contenttweaker:num_10>,
11:<contenttweaker:num_11>, 12:<contenttweaker:num_12>, 13:<contenttweaker:num_13>, 14:<contenttweaker:num_14>, 15:<contenttweaker:num_15>, 16:<contenttweaker:num_16>, 17:<contenttweaker:num_17>, 18:<contenttweaker:num_18>, 19:<contenttweaker:num_19>, 20:<contenttweaker:num_20>,
21:<contenttweaker:num_21>, 22:<contenttweaker:num_22>, 23:<contenttweaker:num_23>, 24:<contenttweaker:num_24>, 25:<contenttweaker:num_25>, 26:<contenttweaker:num_26>, 27:<contenttweaker:num_27>, 28:<contenttweaker:num_28>, 29:<contenttweaker:num_29>, 30:<contenttweaker:num_30>,
31:<contenttweaker:num_31>, 32:<contenttweaker:num_32>, 33:<contenttweaker:num_33>, 34:<contenttweaker:num_34>, 35:<contenttweaker:num_35>, 36:<contenttweaker:num_36>, 37:<contenttweaker:num_37>, 38:<contenttweaker:num_38>, 39:<contenttweaker:num_39>, 40:<contenttweaker:num_40>,
41:<contenttweaker:num_41>, 42:<contenttweaker:num_42>, 43:<contenttweaker:num_43>, 44:<contenttweaker:num_44>, 45:<contenttweaker:num_45>, 46:<contenttweaker:num_46>, 47:<contenttweaker:num_47>, 48:<contenttweaker:num_48>, 49:<contenttweaker:num_49>, 50:<contenttweaker:num_50>,
51:<contenttweaker:num_51>, 52:<contenttweaker:num_52>, 53:<contenttweaker:num_53>, 54:<contenttweaker:num_54>, 55:<contenttweaker:num_55>, 56:<contenttweaker:num_56>, 57:<contenttweaker:num_57>, 58:<contenttweaker:num_58>, 59:<contenttweaker:num_59>, 60:<contenttweaker:num_60>,
61:<contenttweaker:num_61>, 62:<contenttweaker:num_62>, 63:<contenttweaker:num_63>, 64:<contenttweaker:num_64>, 65:<contenttweaker:num_65>, 66:<contenttweaker:num_66>, 67:<contenttweaker:num_67>, 68:<contenttweaker:num_68>, 69:<contenttweaker:num_69>, 70:<contenttweaker:num_70>,
71:<contenttweaker:num_71>, 72:<contenttweaker:num_72>, 73:<contenttweaker:num_73>, 74:<contenttweaker:num_74>, 75:<contenttweaker:num_75>, 76:<contenttweaker:num_76>, 77:<contenttweaker:num_77>, 78:<contenttweaker:num_78>, 79:<contenttweaker:num_79>, 80:<contenttweaker:num_80>,
81:<contenttweaker:num_81>, 82:<contenttweaker:num_82>, 83:<contenttweaker:num_83>, 84:<contenttweaker:num_84>, 85:<contenttweaker:num_85>, 86:<contenttweaker:num_86>, 87:<contenttweaker:num_87>, 88:<contenttweaker:num_88>, 89:<contenttweaker:num_89>, 90:<contenttweaker:num_90>,
91:<contenttweaker:num_91>, 92:<contenttweaker:num_92>, 93:<contenttweaker:num_93>, 94:<contenttweaker:num_94>, 95:<contenttweaker:num_95>, 96:<contenttweaker:num_96>, 97:<contenttweaker:num_97>, 98:<contenttweaker:num_98>, 99:<contenttweaker:num_99>};

//JEI示例，实际不运行
RecipeBuilder.newBuilder("fake_recipe","weiyuan",100,0)
.addItemInputs(items)
.addItemOutput(<contenttweaker:memory_matrix>)
.addEnergyPerTickInput(2147483647)
.addRecipeTooltip("按照物品排列顺序输入全部物品即可运行")
.build();

//实际运行
RecipeBuilder.newBuilder("real_recipe_1","weiyuan",100,2)
.addPreCheckHandler(function(event as RecipeCheckEvent){
    val ctrl=event.controller;
    val data=ctrl.customData;
    val pos=ctrl.pos;
    val w=ctrl.world;
    val lI=items[(items.length - 1)];
    val iH=w.getItemHandler(pos.createPosByFacing(ctrl.facing,xyz[0],xyz[1],xyz[2]));
    if(w.remote||isNull(iH))return;
    if(!(!isNull(data.id)&&itemUtils.getItem(data.id.asString()).matches(lI))){
        for i in 0 to iH.size{
            if(!isNull(iH.getStackInSlot(i))&&iH.getStackInSlot(i).matches(lI)){
                val iHI=iH.getStackInSlot(i);
                iH.setStackInSlot(i,(iHI.amount == 1 ? null : iHI.withAmount(iHI.amount - 1)));
                break;
            }
        }
        event.setFailed("未按照物品排列顺序输入物品！");
    }
})
.addFinishHandler(function(event as RecipeFinishEvent){
    event.controller.customData={id:items[0].definition.id} as IData;
})
.addItemInput(items[(items.length - 1)])
.addEnergyPerTickInput(2147483647)
.addItemOutput(<contenttweaker:memory_matrix>)
.build();


MMEvents.onMachinePostTick("weiyuan",function(event as MachineTickEvent){
    val ctrl=event.controller;
    val data=ctrl.customData;
    val pos=ctrl.pos;
    val w=ctrl.world;
    val lI=items[(items.length - 1)];
    val iH=w.getItemHandler(pos.createPosByFacing(ctrl.facing,xyz[0],xyz[1],xyz[2]));
    if(w.remote||isNull(iH))return;
    for i in 0 to iH.size{
        if(!isNull(iH.getStackInSlot(i))&&items has iH.getStackInSlot(i).anyAmount()&&!iH.getStackInSlot(i).anyAmount().matches(lI)){
            val iId=isNull(data.id) ? items[0].definition.id : data.id.asString();
            val item=iH.getStackInSlot(i);
            val needItem=itemUtils.getItem(iId);
            val nextItem=itemsMapB[needItem.matches(lI) ? 0 : (itemsMapA[needItem] + 1)];
            if(item.matches(needItem)){
                ctrl.customData={id:nextItem.definition.id} as IData;
            }
            iH.setStackInSlot(i,(item.amount == 1 ? null : item.withAmount(item.amount - 1)));
            break;
        }
    }
});

 MMEvents.onControllerGUIRender("weiyuan",function(event as ControllerGUIRenderEvent){
     val ctrl=event.controller;
     val data=ctrl.customData;
     val iId=isNull(data.id) ? items[0].definition.id : data.id.asString();
     val needItem=itemUtils.getItem(iId);
     event.extraInfo=["下一个需求物品为："~needItem.displayName];
 });
