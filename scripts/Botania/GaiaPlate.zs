//借鉴于mcmod某教程
#loader crafttweaker reloadableevents
#loader crafttweaker reloadable
#modloaded randomtweaker

import mods.botanicadds.GaiaPlate;
import mods.jei.JEI;

import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;
 
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

GaiaPlate.remove(<botania:manaresource:4>);
GaiaPlate.remove(<botanicadds:gaiasteel_ingot>);
 
static created as bool[int]={};//一个静态变量，方便后续查询是否已经创建IJeiPanel。
function GaiaPlateRecipe(output as IItemStack,mana as int,input as IIngredient[]) as void{
    val iL=input.length % 2;//获取输入物品的种类是奇数还是偶数，如果是奇数则为1，偶数为0。
    if(isNull(created[iL])){//如果当前种类的IJeiPanel还未被创建。
        val gPJ=JEI.createJei("GaiaPlateJei"~iL,"盖亚凝聚板");//新建一个IJeiPanel。
        gPJ.setModid("botanicadds");
        gPJ.setIcon(<botanicadds:gaia_plate>);
        gPJ.addRecipeCatalyst(<botanicadds:gaia_plate>);
        gPJ.setBackground(IJeiUtils.createBackground(0,0,170,130,"randomtweaker:textures/gui/jei/gaia_gui.png"));//设置gui图片，下方有该gui图片。自己改下路径位置就行了。
        gPJ.addSlot(IJeiUtils.createItemSlot("output",77,38,false,false));
        gPJ.addElement(IJeiUtils.createJeiManaBarElement(35,63,mana,0));
        gPJ.addSlot(IJeiUtils.createItemSlot("block0",77,66,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block1",77,82,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block2",61,90,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block3",93,90,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block4",45,98,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block5",77,98,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block6",109,98,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block7",61,106,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block8",93,106,true,false));
        gPJ.addSlot(IJeiUtils.createItemSlot("block9",77,114,true,false));
        val s=iL == 0 ? 67 : 77;//如果输入物品的种类是偶数则将s赋值为67反之77。这两个值是物品输入槽的中心槽的x位置。
        for ig4 in 0 to (s == 67 ? 8 : 9){//如果s值为67，那么此时输入物品种类为偶数，那么最大槽位为8槽。
            var l=ig4 % 2;//这里我的想法比较抽象，不太好表达。反正你知道他能运行就行了。
            var xa=ig4 as float / 2.0f;
            while xa >= 1.0f{
                xa -= 1.0f;
                l += 1;
            }
            if(ig4 % 2 == 0){
                gPJ.addSlot(IJeiUtils.createItemSlot("inputA"~ig4,s - l * 18,0,true,false));
            }else gPJ.addSlot(IJeiUtils.createItemSlot("inputA"~ig4,s + l * 18,0,true,false));
        }
        gPJ.register();
        created[iL]=true;//标记该物品种类的IJeiPanel已创建。
    }
    val gP=JEI.createJeiRecipe("GaiaPlateJei"~iL);
    gP.addElement(IJeiUtils.createFontInfoElement("消耗mana:"~mana,0,68,16718891));
    gP.addInput(<botanicadds:gaia_plate>);
    gP.addInput(<botanicadds:dreamrock>);
    gP.addInput(<botanicadds:elven_lapis_block>);
    gP.addInput(<botanicadds:elven_lapis_block>);
    gP.addInput(<botanicadds:dreamrock>);
    gP.addInput(<botanicadds:dreamrock>);
    gP.addInput(<botanicadds:dreamrock>);
    gP.addInput(<botanicadds:elven_lapis_block>);
    gP.addInput(<botanicadds:elven_lapis_block>);
    gP.addInput(<botanicadds:dreamrock>);
    for ig4 in input{
        gP.addInput(ig4);
    }
    gP.addOutput(output);
    gP.build();
    
    var it=[]as [IItemStack];
    for ii in input{
        it += ii.itemArray[0];
    }
    mods.botanicadds.GaiaPlate.add(output,mana,it);
}
GaiaPlateRecipe(<botanicadds:gaiasteel_ingot>, 1000000, [<botania:manaresource:14>, <lightningcraft:ingot:2>, <botania:manaresource:7>]);
GaiaPlateRecipe(<minecraft:end_portal_frame>, 500000, [<minecraft:obsidian>, <botanicadds:gaiasteel_ingot>]);