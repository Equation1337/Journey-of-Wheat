import mods.aetherworks.MetalFormer;

MetalFormer.removeRecipesByOutput(<aetherworks:item_resource:4>); 
MetalFormer.removeRecipesByOutput(<aetherworks:item_resource:3>); 
MetalFormer.removeRecipesByOutput(<aetherworks:item_resource:5>); 

MetalFormer.addRecipe(<botania:manaresource:14>, <liquid:aetherworks.aetherium_gas> * 144, <aetherworks:item_resource:4>, 2200);
MetalFormer.addRecipe(<moreplates:gaia_spirit_plate>, <liquid:aetherworks.aetherium_gas> * 144, <aetherworks:item_resource:3>, 2200);
MetalFormer.addRecipe(<calculator:enddiamond>, <liquid:aetherworks.aetherium_gas> * 576, <aetherworks:item_resource:5>, 2600);