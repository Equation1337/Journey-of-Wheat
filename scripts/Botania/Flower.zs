//借鉴于mcmod上123的教程
#loader crafttweaker reloadableevents
#loader crafttweaker reloadable
import crafttweaker.event.BlockNeighborNotifyEvent;
import mods.randomtweaker.botania.IBotaniaFXHelper;
import crafttweaker.command.ICommandManager;
import mods.zenutils.ICatenationBuilder;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import mods.zenutils.NetworkHandler;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math;
import mods.zenutils.IByteBuf;
import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;
//用于判断瞬时产魔花的工作
static MANA_DRAIN as double=160;
static IRISOTOS_RADIUS as int=1;
//给花一格编号
static flowers as int[string] = {
    "hydroangeas":0,
    "endoflame":1,
    "thermalily":2,
    "arcanerose":3,
    "munchdew":4,
    "entropinnyum":5,
    "kekimurus":6,
    "gourmaryllis":7,
    "narslimmus":8,
    "spectrolus":9,
    "dandelifeon":10,
    "rafflowsia":11,
    "shulk_me_not":12
};
//粒子效果颜色。如果花工作了，给它上粒子效果
function getColor(name as string)as int{
    if(name=="hydroangeas")return 0x8888FF;
    if(name=="endoflame")return 0xFF8800;
    if(name=="thermalily")return 0xFF2222;
    if(name=="arcanerose")return 0xCC7777;
    if(name=="munchdew")return 0x77FF77;
    if(name=="entropinnyum")return 0xAA0000;
    if(name=="kekimurus"){
        if(Math.random()<0.7)return 0xFFFFFF;
        return 0xFF0000;
    }
    if(name=="gourmaryllis")return 0xFFFF00;
    if(name=="narslimmus")return 0x77CC77;
    if(name=="spectrolus"){
        var t=Math.random()*3.1416*2;
        var r=128+127*Math.sin(t);
        var g=128+127*Math.sin(t+120);
        var b=128+127*Math.sin(t+240);
        return b+256*(g+256*r);
    }
    if(name=="rafflowsia")return 0xFF44FF;
    if(name=="shulk_me_not")return 0xCC00CC;
    if(name=="dandelifeon"){
        if(Math.random()<0.5)return 0xFF7777;
        return 0x55FF55;
    }
}
function getFlowerName(w as IWorld, p as IBlockPos)as string{
    var d as IData=w.getBlock(p).data;
    if(!isNull(d) && d has "subTileName")return d.subTileName.asString();
    return "";
}
function getFlowerMana(w as IWorld,p as IBlockPos)as int{
    var d as IData=w.getBlock(p).data;
    if(!isNull(d) && d has "subTileCmp")return d.subTileCmp.mana.asInt();
    return 0;
}
function pow(a as int, b as int)as int{
    if(b==1)return a;
    if(b<1)return 1;
    var t=pow(a,b/2);
    if(b%2==1)return t*t*a;
    return t*t;
}
function irisotosWork(world as IWorld,pos as IBlockPos){
    //这里面你可以加点你想要的效果，比如说把附近活石变成“彩虹石”之类的
    val posOne = IBlockPos.create(pos.x + 7, pos.y + 7, pos.z + 7);
    val posTwo = IBlockPos.create(pos.x - 7, pos.y - 7, pos.z - 7);
    val posCollection as IBlockPos[] = IBlockPos.getAllInBox(posOne, posTwo);
    for i in posCollection{
        val blockState as string = world.getBlockState(i).commandString;
        if (!world.remote && blockState == "<blockstate:botania:livingrock>") { 
            world.setBlockState(<blockstate:botaniverse:morerock:variant=ALFHEIM>, i);
        }
    }
}
JEI.createJei("flower_jei", "彩虹转化")
    .setModid("botania")
    .setBackground(IJeiUtils.createBackground(111, 41))
    .addSlot(IJeiUtils.createItemSlot(48,1,true,false))
    .addElement(IJeiUtils.createArrowElement(21,2,0))
    .addElement(IJeiUtils.createArrowElement(68,2,0))
    .addSlot(IJeiUtils.createItemSlot(1,1,true))
    .addSlot(IJeiUtils.createItemSlot(95,1,false))
    .setIcon(<botania:specialflower>.withTag({type: "irisotos"}))
.register();
JEI.createJeiRecipe("flower_jei")
    .setInputs([ <botania:specialflower>.withTag({type: "irisotos"}),<botania:livingrock>])
    .addOutput(<botaniverse:morerock:2>)
    .build();
<cotSubTile:irisotos>.onUpdate = function(tile, world, pos) {
    var r as int=IRISOTOS_RADIUS;         //radius
    var d as int=r*2+1;     //diameter
    //两个彩虹莲不能相隔太近
    for i in 0 to d*2+1{
        for j in 0 to d*2+1{
            for k in 0 to d*2+1{
                var pos1 as IBlockPos=IBlockPos.create(pos.x+i-d,pos.y+j-d,pos.z+k-d);
                var name as string=getFlowerName(world,pos1);
                if(pos1.x!=pos.x||pos1.y!=pos.y||pos1.z!=pos.z)if(name=="irisotos"){
                    //world.setBlockState(<blockstate:minecraft:air>,pos1);
                    if(!world.remote)//world.spawnEntity(<botania:specialflower>.withTag({type: "irisotos"}).createEntityItem(world,pos1));
                        world.destroyBlock(pos1, true);
                    else{
                        //在逻辑客户端生成植魔粒子效果，由RandomTweaker友情提供
                        for ii in 0 to 20{
                            var rat=0.1*ii;
                            var v=0.03;
                            IBotaniaFXHelper.wispFX(
                                0.5+pos1.x+(0.4-rat)*(i-d),0.5+pos1.y+(0.4-rat)*(j-d),0.5+pos1.z+(0.4-rat)*(k-d),
                                1,0,0,0.3,
                                v*(i-d)*(0.1+rat),v*(-0.1+j-d)*(0.1+rat),v*(k-d)*(0.1+rat),2
                            );
                            IBotaniaFXHelper.wispFX(
                                0.5+pos.x+(0.4-rat)*(d-i),0.5+pos.y+(0.4-rat)*(d-j),0.5+pos.z+(0.4-rat)*(d-k),
                                1,0,0,0.3,
                                v*(d-i)*(0.1+rat),v*(-0.1+d-j)*(0.1+rat),v*(d-k)*(0.1+rat),2
                            );
                        }
                    }
                }
            }
        }
    }
    if(world.remote)return;
     
    //运行逻辑
    var flags as int=0;    //还记得说花朵运行要用粒子效果连接花和彩虹莲吗，这里flags起到存储数据的效果。int有32位，而我们要存储26个bool，够了。
    var flagsForClient as int=0;
    var t1 as IData=tile.getCustomData();
    var manas as IData=(!isNull(t1)&&t1 has "manas")?t1.manas:IData.createEmptyMutableDataMap();
    var timers as IData=(!isNull(t1)&&t1 has "timers")?t1.timers:IData.createEmptyMutableDataMap();
    for i in 0 to d{
        for j in 0 to d{
            for k in 0 to d{
                var pos1 as IBlockPos=IBlockPos.create(pos.x+i-r,pos.y+j-r,pos.z+k-r);
                var compressedIndex as int=(d*(d*i+j)+k);
                var ci as string=""~compressedIndex; //compressed index
                var dat as IData=world.getBlock(pos1).data;
                var name as string=getFlowerName(world,pos1);
                dat=(isNull(dat)||!(dat has"subTileCmp"))?IData.createEmptyMutableDataMap():dat.subTileCmp;
                //计时器和魔力统计
                var lastMana=((manas has ci)?manas.memberGet(ci).asInt():0)as double;
                var mana as int=getFlowerMana(world,pos1);
                var time as int=(timers has ci)?timers.memberGet(ci).asInt():0;
                var toUpdate=IData.createEmptyMutableDataMap();
                toUpdate.memberSet(ci,mana);
                manas=manas+toUpdate;
                //检查花朵是否允许
                if(flowers has name){
                    var id as int=flowers[name]as int;
                    var working=false;
                    if(id==0||id==2)working=(dat.burnTime.asInt()>0)||(dat.cooldown.asInt()>0);      //水绣球&炽玫瑰
                    else if(id==1)working=(dat.burnTime.asInt()>0);    //火红莲
                    else if(id==7)working=(dat.cooldown>0);    //彼方兰
                    else if(id==4)working=dat.ateOnce.asBool();    //咀叶花
                    else{
                        //瞬时产魔花判定
                        var ratio as double=1.0;
                        if(id==6)ratio=40.0;
                        if(id==11)ratio=90.0;
                        if(id==10)ratio=2.0;
                        if(id==5)ratio=10.0;
                        //具体逻辑
                        if(lastMana<mana)time=((ratio*mana-lastMana)/MANA_DRAIN+time)as int;
                        if(id==3){
                            //阿卡纳蔷薇比较特殊
                            if(dat.collectorY>=0){
                                var pos2 as IBlockPos=IBlockPos.create(
                                    dat.collectorX.asInt(),dat.collectorY.asInt(),dat.collectorZ.asInt()
                                );
                                var spreader as IBlock=world.getBlock(pos2);
                                var spreaderDat as IData=spreader.data;
                                if(!isNull(spreaderDat)&&spreaderDat has"mana"&&spreaderDat.id=="botania:spreader"){
                                    var mana1=spreaderDat.mana;
                                    var manaCap=(spreader.meta>2)?6400:1000;
                                    time=time+1;
                                }
                            }
                            working=working||(time>0);
                        }else working=(time>0);
                    }
                    if(working){
                        flags=flags|pow(2,id);
                        flagsForClient=flagsForClient|pow(2,compressedIndex);
                    }
                    if(id!=10&&id!=12){
                        if(time>200)time=200;
                    }else if(time>5000)time=5000;
                }
                else time=0;
                toUpdate.memberSet(ci,(time<1)?0:time- 1);
                timers=timers+toUpdate;
            }
        }
    }
    if(!world.remote){
        if(!isNull(world.getBlock(pos).data)&&world.getBlock(pos).data.subTileCmp.ticksExisted>1){
            tile.updateCustomData({"timers":timers,"manas":manas});
            if(flags==pow(2,flowers.keys.length)- 1){
                irisotosWork(world,pos);
                tile.addMana(50000);
            }
        }
        else{
            tile.updateCustomData({"manas":manas});
        }
        //ZenUtils，向逻辑客户端通信。因为服务端扔不了粒子。周围10格内的玩家可以收到信息
        NetworkHandler.sendToAllAround("IrisotosBotFXDat",
            pos.x,pos.y,pos.z,10,world.getDimension(),function(b){
                b.writeBlockPos(pos);
                b.writeInt(flagsForClient);
            });
    }
};
//客户端收到信息，扔粒子
NetworkHandler.registerServer2ClientMessage("IrisotosBotFXDat",function(p,b){
    var world as IWorld=p.world;
    var pos as IBlockPos=b.readBlockPos();
    var flags as int=b.readInt();
    var r as int=IRISOTOS_RADIUS;         //radius
    var d as int=r*2+1;     //diameter
    for i in 0 to d{
        for j in 0 to d{
            for k in 0 to d{
                var ci as int=k+d*(j+i*d);
                var pos1 as IBlockPos=IBlockPos.create(pos.x+i-r,pos.y+j-r,pos.z+k-r);
                var name as string=getFlowerName(world,pos1);
                if((flags/pow(2,ci))%2==1){
                    var v=0.03;
                    var rgbr=1.0/255;
                    if(Math.random()>0)IBotaniaFXHelper.wispFX(
                        0.5+pos1.x,0.5+pos1.y,0.5+pos1.z,
                        rgbr*(getColor(name)/256/256),rgbr*(getColor(name)/256%256),rgbr*(getColor(name)%256),0.2,
                        v*(r-i),v*(-0.3+r-j),v*(r-k),1
                    );
                }
            }
        }
    }
});