import mods.calculator.atomic;

atomic.removeRecipe(<calculator:flawlessdiamond>);
atomic.removeRecipe(<calculator:firediamond>);
atomic.removeRecipe(<calculator:processingchamber>);

atomic.addRecipe(<avaritia:resource>, <calculator:atomicbinder>, <botania:manaresource:2>, <calculator:flawlessdiamond>);
atomic.addRecipe(<botania:blazeblock>, <calculator:flawlessdiamond>, <botania:blazeblock>, <calculator:firediamond>);
atomic.addRecipe(<calculator:firediamond>, <environmentaltech:structure_frame_2>, <calculator:enddiamond>, <environmentaltech:structure_frame_3>);
atomic.addRecipe(<calculator:atomicassembly>, <environmentaltech:void_ore_miner_cont_2>, <calculator:material:8>, <environmentaltech:void_ore_miner_cont_3>);
atomic.addRecipe(<calculator:atomicassembly>, <environmentaltech:solar_cont_2>, <calculator:material:8>, <environmentaltech:solar_cont_3>);
atomic.addRecipe(<calculator:flawlessdiamond>, <minecraft:glass>, <calculator:flawlessdiamond>, <calculator:flawlessglass>);
atomic.addRecipe(<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>, <calculator:purifiedobsidian>);