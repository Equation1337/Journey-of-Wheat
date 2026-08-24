//by Circulation 未经允许禁止修改，取用
#priority 10000
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

global wpdb as function(IIngredient,IIngredient)bool = function (IIngredient1 as IIngredient,IIngredient2 as IIngredient) as bool {
//对比物品是否相同
    return (IIngredient1.amount(1).commandString.replaceAll(">.*","") == IIngredient2.amount(1).commandString.replaceAll(">.*",""));
};
global wpsldb as function(IIngredient[],IIngredient)bool = function (IIngredient1 as IIngredient[],IIngredient2 as IIngredient) as bool{
//物品是否在数组里
    var i = 0;
    if (IIngredient1.length == 0){
        return false;
    }
    for item in IIngredient1 {
        if(wpdb(item,IIngredient2)){
            break;
        } else {
            i += 1; 
        }
    }
    if (i == IIngredient1.length){
        return false;
    } else {
        return true;
    }
};