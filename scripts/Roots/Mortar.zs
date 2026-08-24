import mods.roots.Mortar;

Mortar.removeRecipe(<roots:spell_icon>.withTag({spell_storage: {s: "roots:spell_chrysopoeia"}}));

Mortar.addRecipe("lianjin", <roots:spell_dust>.withTag({spell_storage: {s: "roots:spell_chrysopoeia"}}), [<roots:moonglow_leaf>, <roots:cloud_berry>, <roots:dewgonia>, <roots:stalicripe>, <roots:infernal_bulb>]);
Mortar.addRecipe("shifen", <ic2:dust:15> * 4, [<minecraft:stone>]);