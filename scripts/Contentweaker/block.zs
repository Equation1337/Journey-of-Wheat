#priority 1467
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

var Xinghui = VanillaFactory.createBlock("xinghui_block", <blockmaterial:iron>);
Xinghui.setLightOpacity(3);
Xinghui.setLightValue(0);
Xinghui.setBlockHardness(5.0);
Xinghui.setBlockResistance(5.0);
Xinghui.setToolClass("pickaxe");
Xinghui.setToolLevel(0);
Xinghui.setBlockSoundType(<soundtype:metal>);
Xinghui.setSlipperiness(0.3);
Xinghui.register();

val starcoil as Block = VanillaFactory.createBlock("star_coil", <blockmaterial:iron>);
starcoil.fullBlock = true;
starcoil.setLightOpacity(255);
starcoil.translucent = true;
starcoil.setLightValue(0);
starcoil.setBlockHardness(7.5);
starcoil.setBlockResistance(100.0);
starcoil.setToolClass("pickaxe");
starcoil.setToolLevel(3);
starcoil.setBlockSoundType(<soundtype:metal>);
starcoil.register();

val infinitycoil as Block = VanillaFactory.createBlock("infinity_coil", <blockmaterial:iron>);
infinitycoil.fullBlock = true;
infinitycoil.setLightOpacity(255);
infinitycoil.translucent = true;
infinitycoil.setLightValue(0);
infinitycoil.setBlockHardness(7.5);
infinitycoil.setBlockResistance(100.0);
infinitycoil.setToolClass("pickaxe");
infinitycoil.setToolLevel(3);
infinitycoil.setBlockSoundType(<soundtype:metal>);
infinitycoil.register();

val dragoncoil as Block = VanillaFactory.createBlock("dragon_coil", <blockmaterial:iron>);
dragoncoil.fullBlock = true;
dragoncoil.setLightOpacity(255);
dragoncoil.translucent = true;
dragoncoil.setLightValue(0);
dragoncoil.setBlockHardness(7.5);
dragoncoil.setBlockResistance(100.0);
dragoncoil.setToolClass("pickaxe");
dragoncoil.setToolLevel(3);
dragoncoil.setBlockSoundType(<soundtype:metal>);
dragoncoil.register();

val electrum as Block = VanillaFactory.createBlock("electrum_flux", <blockmaterial:iron>);
electrum.fullBlock = true;
electrum.setLightOpacity(255);
electrum.translucent = true;
electrum.setLightValue(0);
electrum.setBlockHardness(7.5);
electrum.setBlockResistance(100.0);
electrum.setToolClass("pickaxe");
electrum.setToolLevel(3);
electrum.setBlockSoundType(<soundtype:metal>);
electrum.register();

val memory as Block = VanillaFactory.createBlock("memory_matrix", <blockmaterial:iron>);
memory.fullBlock = false;
memory.setLightOpacity(255);
memory.translucent = true;
memory.setLightValue(0);
memory.setBlockHardness(7.5);
memory.setBlockResistance(100.0);
memory.setToolClass("pickaxe");
memory.setToolLevel(3);
memory.setBlockSoundType(<soundtype:metal>);
memory.register();

val haipozhen as Block = VanillaFactory.createBlock("haipozhen_coil", <blockmaterial:iron>);
haipozhen.fullBlock = false;
haipozhen.setLightOpacity(255);
haipozhen.translucent = true;
haipozhen.setLightValue(0);
haipozhen.setBlockHardness(7.5);
haipozhen.setBlockResistance(100.0);
haipozhen.setToolClass("pickaxe");
haipozhen.setToolLevel(3);
haipozhen.setBlockSoundType(<soundtype:metal>);
haipozhen.register();

val youzi as Block = VanillaFactory.createBlock("youzi_leaf", <blockmaterial:iron>);
youzi.fullBlock = false;
youzi.setLightOpacity(255);
youzi.translucent = true;
youzi.setLightValue(0);
youzi.setBlockHardness(7.5);
youzi.setBlockResistance(100.0);
youzi.setToolClass("pickaxe");
youzi.setToolLevel(3);
youzi.setBlockSoundType(<soundtype:metal>);
youzi.register();

val youzi_charged as Block = VanillaFactory.createBlock("youzi_charged_leaf", <blockmaterial:iron>);
youzi_charged.fullBlock = false;
youzi_charged.setLightOpacity(255);
youzi_charged.translucent = true;
youzi_charged.setLightValue(0);
youzi_charged.setBlockHardness(7.5);
youzi_charged.setBlockResistance(100.0);
youzi_charged.setBlockSoundType(<soundtype:metal>);
youzi_charged.register();