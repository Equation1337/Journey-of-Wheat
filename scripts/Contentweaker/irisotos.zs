#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.cote.ISubTileEntityGenerating;

val flower as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("irisotos");
flower.range = 1;
flower.maxMana = 2147483647;
flower.register();