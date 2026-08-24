#loader preinit
import mods.treetweaker.TreeFactory;
 
var youzi =TreeFactory.createTree("youzi");
youzi.setTreeType("OAK");
youzi.setLog("minecraft:log");
youzi.setLeaf("contenttweaker:youzi_leaf");
youzi.setMinHeight(3);
youzi.setExtraHeight(5);
youzi.addSapling();
youzi.register();

var youzi_charged =TreeFactory.createTree("youzi_charged");
youzi_charged.setTreeType("OAK");
youzi_charged.setLog("minecraft:log");
youzi_charged.setLeaf("contenttweaker:youzi_charged_leaf");
youzi_charged.setMinHeight(3);
youzi_charged.setExtraHeight(5);
youzi_charged.addSapling();
youzi_charged.register();