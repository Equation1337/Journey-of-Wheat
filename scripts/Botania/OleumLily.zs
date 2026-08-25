//石油百合：机能花，每秒消耗500Mana，在该花同一平面(Y不变)5*5范围内随机生成<liquid:oil>的石油源方块
#loader crafttweaker reloadable
import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math;
import mods.randomtweaker.botania.IBotaniaFXHelper;
import mods.zenutils.NetworkHandler;
import mods.zenutils.IByteBuf;
import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;

//每秒消耗的魔力与工作间隔(单位: tick)
static OLEUM_MANA_COST as int = 500;
static OLEUM_INTERVAL as int = 20;

//JEI显示页面：花本体 -> 一桶油 + 文字说明
JEI.createJei("oleumlily_jei", "石油生成")
    .setModid("botania")
    .setBackground(IJeiUtils.createBackground(160, 41))
    .addSlot(IJeiUtils.createItemSlot(8, 4, true))
    .addElement(IJeiUtils.createArrowElement(32, 5, 0))
    .addSlot(IJeiUtils.createItemSlot(56, 4, false))
    .addElement(IJeiUtils.createFontInfoElement("消耗 500 Mana/秒", 82, 10, 0x404040))
    .addElement(IJeiUtils.createFontInfoElement("同平面5x5随机产油", 82, 24, 0x404040))
    .setIcon(<botania:specialflower>.withTag({type: "oleumlily"}))
.register();
JEI.createJeiRecipe("oleumlily_jei")
    .setInputs([ <botania:specialflower>.withTag({type: "oleumlily"})])
    .addOutput(<forge:bucketfilled>.withTag({FluidName: "oil", Amount: 1000}))
    .build();

<cotSubTile:oleumlily>.onUpdate = function(tile, world, pos) {
    if (world.remote) return;

    //用customData做秒级计时器(不依赖getTicksExisted，兼容RandomTweaker 1.4.7)
    var d as IData = tile.getCustomData();
    var t as int = (!isNull(d) && !isNull(d.timer)) ? d.timer.asInt() : 0;
    t = t + 1;
    if (t >= OLEUM_INTERVAL) {
        t = 0;
        //内部魔力缓冲由Botania自动从附近魔力池抽取填满(maxMana=1000)
        if (tile.getMana() >= OLEUM_MANA_COST) {
            tile.consumeMana(OLEUM_MANA_COST);
            //同一平面(Y不变)5*5内随机取一格
            var dx as int = ((Math.random() * 5) as int) - 2;
            var dz as int = ((Math.random() * 5) as int) - 2;
            val target as IBlockPos = IBlockPos.create(pos.x + dx, pos.y, pos.z + dz);
            if (world.isAirBlock(target)) {
                world.setBlockState(<liquid:oil>.definition.block.definition.defaultState, target);
                //ZenUtils向逻辑客户端发包，在产油位置扔粒子
                NetworkHandler.sendToAllAround("OleumLilyFX",
                    pos.x, pos.y, pos.z, 16, world.getDimension(), function(b) {
                        b.writeBlockPos(target);
                    });
            }
        }
    }
    tile.updateCustomData({"timer": t});
};

//客户端收到信息，在产油位置扔黑色油滴粒子
NetworkHandler.registerServer2ClientMessage("OleumLilyFX", function(p, b) {
    val pos as IBlockPos = b.readBlockPos();
    for i in 0 to 5 {
        IBotaniaFXHelper.wispFX(
            0.5 + pos.x, 0.6 + pos.y, 0.5 + pos.z,
            0.15, 0.12, 0.08, 0.3,
            ((Math.random() - 0.5) * 0.1) as float,
            (0.02 + Math.random() * 0.06) as float,
            ((Math.random() - 0.5) * 0.1) as float,
            3
        );
    }
});