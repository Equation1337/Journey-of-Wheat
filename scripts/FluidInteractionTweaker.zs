
import mods.fluidintetweaker.FITweaker;

FITweaker.addRecipe(<liquid:aether>, <liquid:astralsorcery.liquidstarlight>, 
        FITweaker.outputBuilder()
        .addEvent(FITweaker.eventBuilder().createSetBlockEvent(<blockstate:astralsorcery:blockcustomsandore>).done())
        .done());