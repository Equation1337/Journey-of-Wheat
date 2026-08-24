import mods.thaumcraft.ArcaneWorkbench;

ArcaneWorkbench.removeRecipe(<thaumcraft:infusion_matrix>);

mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("Infusion", "BASEINFUSION", 888, [<aspect:aer> * 64, <aspect:ignis> * 64, <aspect:terra> * 64, <aspect:aqua> * 64, <aspect:ordo> * 64, <aspect:perditio> * 64], <thaumcraft:infusion_matrix>, [[<thaumcraft:stone_arcane_brick>, <contenttweaker:life_core>, <thaumcraft:stone_arcane_brick>], [<contenttweaker:life_core>, <ore:nitor>, <contenttweaker:life_core>], [<thaumcraft:stone_arcane_brick>, <contenttweaker:life_core>, <thaumcraft:stone_arcane_brick>]]);