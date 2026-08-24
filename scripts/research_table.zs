#priority 50
#loader crafttweaker reloadable

import mods.ResearchTable;
import ResearchTable.Category;
import ResearchTable.Builder;

var youzi = ResearchTable.addCategory(<contenttweaker:youzi_charged>, "探寻柚子的真理");
ResearchTable.builder("jiasuhuoba", youzi)
    .setIcons(<torcherino:blocktorcherino>)
    .setTitle("导引时间之力") 
    .setDescription("经由各种装置跨越维度之后，你与时间长河的距离仅差临门一脚，你决定回忆世界本源，来探寻所谓的真相")
    .addCondition(<minecraft:torch>, 114514, "神说，要有光，于是便有了光。神将光与暗分开，称光为昼，称暗为夜。于是有了晚上，有了早晨。")
    .addCondition(<botania:manaresource:15>, 1024, "神说，诸水之向要有空气隔开。神便创造了空气，称它为天。")
    .addCondition(<magneticraft:water_generator>, 1024, "神说，普天之下的水要聚在一处，使旱地露出来。于是，水和旱地便分开。神称旱地为大陆，称众水聚积之处为海洋。神又吩咐，地上要长出青草和各种各样的开花结籽的蔬菜及结果子的树，果子都包着核。世界便照神的话成就了。")
    .addCondition(<extrautils2:suncrystal>, 1000000, "神说，天上要有光体，可以分管昼夜，作记号，定节令、日子、年岁，并要发光普照全地。于是神造就了两个光体，给它们分工，让大的那个管理昼，小的那个管理夜。神又造就了无数的星斗。把它们嵌列在天幕之中。")
    .addCondition(<randomthings:ingredient:2>, 1024, "神说，水要多多滋生有生命之物，要有雀鸟在地面天空中飞翔。神就造出大鱼和各种水中的生命，使它们各从其类；神又造出各样的飞鸟，使它们各从其类。神看到自己的造物，非常喜悦，就赐福这一切，使它们滋生繁衍，普及江海湖汊、平原空谷。")
    .addCondition(<contenttweaker:life_core>, 8, "神说，地要生出活物来；牲畜、昆虫、野兽各从其类。于是，神造出了这些生灵，使它们各从其类。神看到万物并作，生灭有继，便说，我要照着我的形象，按着我的样式造人，派他们管理海里的鱼、空中的鸟、地上的牲畜和地上爬行的一切昆虫。神就照着自己的形象创造了人。神本意让人成为万物之灵，就赐福给他们，对他们说，要生养众多，遍满地面，治理地上的一切，也要管理海里的鱼、空中的鸟和地上各样活物。")
    .addCondition(<contenttweaker:youzi>, 256, "天地万物都造齐了，神完成了创世之功。在这一天里，他歇息了，并赐福给第六天，圣化那一天为特别的日子，因为他在那一天完成了创造，歇工休息。就这样星期日也成为人类休息的日子。")
    .setRewardItems(<torcherino:blocktorcherino>)
    .build();