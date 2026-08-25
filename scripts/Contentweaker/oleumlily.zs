#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.cote.ISubTileEntityFunctional;

//石油百合：机能花，每秒消耗500Mana在同平面5*5范围内随机生成石油源方块
val flower as ISubTileEntityFunctional = VanillaFactory.createSubTileFunctional("oleumlily", 0x333333);
flower.range = 2;
flower.maxMana = 1000;
flower.register();