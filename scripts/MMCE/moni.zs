//craft by circulation
#loader crafttweaker reloadable
#priority 50
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.IngredientArrayBuilder;
import novaeng.hypernet.HyperNetHelper;
import crafttweaker.util.Math;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IMutableItemStack;
import crafttweaker.oredict.IOreDictEntry;
import novaeng.hypernet.RegistryHyperNet;
import novaeng.hypernet.research.ResearchCognitionData;

MachineModifier.setInternalParallelism("moni",128);
//循环预设
    val inscriberModels as string[] = [
            "收容单元#0",
            "收容单元#1",
            "收容单元#2",
            "收容单元#3"
        ];
    val ysqnames as string[] = [
            "ysqname1",
            "ysqname2",
            "ysqname3",
            "ysqname4"
        ];
    val ysqidxss as string[] = [
            "ysqidxs1",
            "ysqidxs2",
            "ysqidxs3",
            "ysqidxs4"
        ];
    val ysqddcss as string[] = [
            "ysqddcs1",
            "ysqddcs2",
            "ysqddcs3",
            "ysqddcs4"
        ];
//工厂设置
    MachineModifier.setMaxThreads("moni", 0);
    MachineModifier.addCoreThread("moni", FactoryRecipeThread.createCoreThread("收容单元#0"));
    MachineModifier.addCoreThread("moni", FactoryRecipeThread.createCoreThread("收容单元#1"));
    MachineModifier.addCoreThread("moni", FactoryRecipeThread.createCoreThread("收容单元#2"));
    MachineModifier.addCoreThread("moni", FactoryRecipeThread.createCoreThread("收容单元#3"));
//GUI
    MMEvents.onControllerGUIRender("moni", function(event as ControllerGUIRenderEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val dData = D(data);
        val ysqname1 = dData.getString("ysqname1","暂无");
        val ysqname2 = dData.getString("ysqname2","暂无");
        val ysqname3 = dData.getString("ysqname3","暂无");
        val ysqname4 = dData.getString("ysqname4","暂无");
        val ysqddcs1 = dData.getLong("ysqddcs1",0);
        val ysqddcs2 = dData.getLong("ysqddcs2",0);
        val ysqddcs3 = dData.getLong("ysqddcs3",0);
        val ysqddcs4 = dData.getLong("ysqddcs4",0);
        var info as string[] = [];
        info += "当前记录模型：" + ysqname1;
        info += "当前迭代次数：" + ysqddcs1;
        info += "当前记录模型：" + ysqname2;
        info += "当前迭代次数：" + ysqddcs2;
        info += "当前记录模型：" + ysqname3;
        info += "当前迭代次数：" + ysqddcs3;
        info += "当前记录模型：" + ysqname4;
        info += "当前迭代次数：" + ysqddcs4;
        event.extraInfo = info;
    });
//添加矿词
    <ore:dataModel>.add(itemUtils.getItemsByRegexRegistryName(".*g.data_model.*"));
    <ore:livingMatter>.add(itemUtils.getItemsByRegexRegistryName(".*living_matter.*"));
    <ore:pristine>.add(itemUtils.getItemsByRegexRegistryName(".*pristine_matter.*"));
    <ore:dataModel>.remove(<deepmoblearning:data_model_blank>); 
//写入数据
    for i, ysqname in ysqnames {
        RecipeBuilder.newBuilder("moxll" + i, "moni", 1,0)
            .addItemInput(<ore:dataModel>).setTag("dataModel")
            .setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
                val id = item.definition.name.replaceAll(".*data_model_","");
                val namesc = item.displayName;
                val name = namesc.replaceAll("[(]缺陷.*|[(]卓越.*|[(]高级.*|[(]自我.*|[(]基础.*","");
                val dataCount = D(item.tag).getInt("dataCount", 0);
                val tier = D(item.tag).getInt("tier", 0);
                val data = ctrl.customData;
                val map = data.asMap();

                map["namehcq"] = name;
                map["idhcq"] = id;
                map["dataCount"] = dataCount;
                map["tier"] = tier;
                ctrl.customData = data;
                return true;
            })
            .addPreCheckHandler(function(event as RecipeCheckEvent) {
                val ctrl = event.controller;
                val data = ctrl.customData;
                val dData = D(data);
                val ysqnamea = dData.getString(ysqname,"暂无");

                if (ysqnamea != "暂无") {
                    event.setFailed("数据模块注入完成，可以开始演算");
                    return;
                }
            })
            .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent) {
                val ctrl = event.controller;
                val data = ctrl.customData;
                val dData = D(data);
                val map = data.asMap();
                val ysqnamea = dData.getString(ysqname,"暂无");
                val namehcq = dData.getString("namehcq","无");
                val idhcq = dData.getString("idhcq","无");
                val dataCount = dData.getInt("dataCount", 0);
                val tier = dData.getInt("tier", 0);
                var tierend = (tier <= 1) ? (32 * tier + dataCount):(dataCount + (tier - 1) * 10000 + 32);


                if (ysqnamea == "暂无"){
                    map[ysqname] = namehcq;
                    map[ysqidxss[i]] = idhcq;
                    map[ysqddcss[i]] = (tierend as long);
                }

                ctrl.customData = data;
            })
            .addOutput(<deepmoblearning:data_model_blank>)
            .setParallelized(false)
            .addRecipeTooltip("将数据模型写入"+inscriberModels[i])
            .addRecipeTooltip("请将数据模型放入控制器正上方的微型物品输入仓中")
            .setThreadName(inscriberModels[i])
        .build();
    }
//输出产物
    for i, ysqname in ysqnames {
        RecipeBuilder.newBuilder("moni" + i, "moni",60,0)
            .addEnergyPerTickInput(1000000)
            .addItemInput(<deepmoblearning:polymer_clay>)
            .addPreCheckHandler(function(event as RecipeCheckEvent) {
                val ctrl = event.controller;
                val data = ctrl.customData;
                val dData = D(data);
                val ysqnamea = dData.getString(ysqname,"暂无");
                val ysqidxs = dData.getString(ysqidxss[i],"暂无");
                if (ysqnamea == "暂无") {
                    event.setFailed("没有数据模型！");
                    return;
                }
            })
            .addFactoryStartHandler(function (event as FactoryRecipeStartEvent) {
                val ctrl = event.controller;
                val data = ctrl.customData;
                val dData = D(data);
                val ysqddcs = dData.getInt(ysqddcss[i],0);
                val bl = event.factoryRecipeThread;
                if (ysqddcs < 32){
                    bl.addModifier("duration", RecipeModifierBuilder.create("modularmachinery:duration", "input",100, 1, false).build());
                    bl.addModifier("energy", RecipeModifierBuilder.create("modularmachinery:energy", "input",50, 1, false).build());
                }
            })
            .addItemOutput(<ore:pristine>).addItemModifier(function(ctrl as IMachineController, Item as IItemStack) {
                return outputyuanshiwuzhi(ctrl,ysqddcss[i],ysqidxss[i],Item);
            })
            .addItemOutput(<ore:livingMatter>).addItemModifier(function(ctrl as IMachineController, Item as IItemStack) {
                return outputwuzhi(ctrl,ysqidxss[i]);
            }) 
            .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent) {
                val ctrl = event.controller;
                val data = ctrl.customData;
                val dData = D(data);
                val map = data.asMap();
                val ysqddcs = dData.getLong(ysqddcss[i],0);
                val bx = event.factoryRecipeThread.activeRecipe.parallelism;

                map[ysqddcss[i]] = ysqddcs + bx;
                ctrl.customData = data;
            })
            .addRecipeTooltip("使用" + inscriberModels[i] + "进行模拟,并输出原始物质")
            .addRecipeTooltip("概率同模拟室,每个等级额外提高2%")
            .addRecipeTooltip("模型等级为0时需要消耗100倍的时间和50倍能量来进行初步模拟")
            .setThreadName(inscriberModels[i])
        .build();
    }
//修改器
    function outputwuzhi(ctrl as IMachineController,ysqidxss as string) as IItemStack {
        val data = ctrl.customData;
        val dData = D(data);
        val name = dData.getString(ysqidxss,"暂无");
                
            if (name == "creeper"||name == "guardian"||name == "skeleton"||name == "slime"||name == "spider"||name == "witch"||name == "zombie"||name == "mo_android"){
                return <deepmoblearning:living_matter_overworldian> * 1;
            }
            if (name == "blaze"||name == "ghast"||name == "wither_skeleton"){
                return <deepmoblearning:living_matter_hellish> * 1;
            } 
            if (name == "dragon"||name == "enderman"||name == "shulker"||name == "wither"){
                return <deepmoblearning:living_matter_extraterrestrial> * 1;
            } 
            if (name == "error"||name == "chaosguardian"||name == "gaia"){
                return <deepmoblearning:living_matter_void> * 1;
            }
    }
    function outputyuanshiwuzhi(ctrl as IMachineController,ysqddcss as string,ysqidxss as string,item as IItemStack) as IItemStack {
        val data = ctrl.customData;
        val world = ctrl.world;
        val Random = world.getRandom().nextInt(1,100);
        val dData = D(data);
        val ysqddcs = dData.getLong(ysqddcss,0);
        val ysqidxs = dData.getString(ysqidxss,"暂无");
        val pristine as IOreDictEntry = <ore:pristine>;
        var IStack as IItemStack[] = [];

        for item in pristine.items{
            if (item.definition.id == "deepmoblearning:pristine_matter_" + ysqidxs) {
                IStack += item;
            }
        }

        var itemsl = 0;        
            if (ysqddcs >= 32){
                if (ysqddcs < 10032){
                    itemsl += (6 >= Random) ? 1:0;
                } else if (ysqddcs < 20032){
                    itemsl += (12 >= Random) ? 1:0;
                } else if (ysqddcs < 30032){
                    itemsl += (14 >= Random) ? 1:0;
                } else {
                    itemsl += (20 >= Random) ? 1:0;
                }
            }
        if (itemsl == 0) {
            return item * 0;
        } else {
            return IStack[0] * 1;
        }
    }
    function outputdata(ctrl as IMachineController,ysqddcss as string,ysqidxss as string,ysqname as string) as IItemStack {
        val data = ctrl.customData;
        val dData = D(data);
        val map = data.asMap();
        val ysqddcs = dData.getLong(ysqddcss,0) as int;
        val ysqidxs = dData.getString(ysqidxss,"暂无");
        val Model as IOreDictEntry = <ore:dataModel>;
        var IStack as IItemStack[] = [];

        for item in Model.items{
            if (item.definition.id == "deepmoblearning:data_model_" + ysqidxs) {
                IStack += item;
            }
        }

        var tiers = 0;
        var dataCounts = 0;
        if (ysqddcs < 32) {
            tiers = 0;
            dataCounts += ysqddcs;
        } else if (ysqddcs < 10032){
            tiers += 1;
            dataCounts += (ysqddcs - 32);
        } else if (ysqddcs < 20032){
            tiers += 2;
            dataCounts += (ysqddcs - 10032);
        } else if (ysqddcs < 30032){
            tiers += 3;
            dataCounts += (ysqddcs - 20032);
        } else {
            tiers += 4;
        }

        map[ysqname] = "暂无";
        map[ysqddcss] = 0;
        map[ysqidxss] = "暂无";
        ctrl.customData = data;

        return IStack[0].withTag({
            totalSimulationCount : ysqddcs,
            tier : tiers,
            dataCount : dataCounts
        });
    }
//模型导出
    for i, ysqname in ysqnames {
        RecipeBuilder.newBuilder("mxdc" + i, "moni", 1)
            .addItemInput(<deepmoblearning:data_model_blank>)
            .addPreCheckHandler(function(event as RecipeCheckEvent) {
                val ctrl = event.controller;
                val data = ctrl.customData;
                val dData = D(data);
                val ysqnamea = dData.getString(ysqname,"暂无"); 

                if (ysqnamea == "暂无") {
                    event.setFailed("没有可以导出的数据");
                    return;
                }
            })
            .addOutput(<ore:dataModel>)
                .setPreViewNBT({display: {Lore: ["§6提取出写入的模型"]}})
            .addItemModifier(function(ctrl as IMachineController, item as IItemStack) {
                return outputdata(ctrl,ysqddcss[i],ysqidxss[i],ysqname);
            })
            .setParallelized(false)
            .addRecipeTooltip("将数据模型从" + inscriberModels[i] + "导出")
            .setThreadName(inscriberModels[i])
        .build();
    }
