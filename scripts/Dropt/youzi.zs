import mods.dropt.Dropt;

// 创建一个名称为 "basic_replacement" 的 RuleList 对象
Dropt.list("youzi_replacement")

  // 为父 RuleList 对象添加规则
  .add(
      
      // 创建一个 Rule 对象
      Dropt.rule()
      
      // 为父 Rule 对象添加匹配破坏  "minecraft:stone" 的条件
      .matchBlocks(["contenttweaker:youzi_leaf"])

      // 为父 Rule 对象添加掉落
      .addDrop(
          
          // 创建一个 Drop 对象
          Dropt.drop()
          .selector(
              
              // 设置父选择器的权重为 85
              Dropt.weight(15)
          )

          // 为父 Drop 对象添加掉落物 <minecraft:string>
          .items([<contenttweaker:youzi>,<treetweaker:youzi>])

      )
      .addDrop(
          
          // 创建一个 Drop 对象
          Dropt.drop()
          .selector(
              
              // 设置父选择器的权重为 85
              Dropt.weight(85)
          )


      )
  );
Dropt.list("youzi_charged_replacement")

  // 为父 RuleList 对象添加规则
  .add(
      
      // 创建一个 Rule 对象
      Dropt.rule()
      
      // 为父 Rule 对象添加匹配破坏  "minecraft:stone" 的条件
      .matchBlocks(["contenttweaker:youzi_charged_leaf"])

      // 为父 Rule 对象添加掉落
      .addDrop(
          
          // 创建一个 Drop 对象
          Dropt.drop()
          .selector(
              
              // 设置父选择器的权重为 85
              Dropt.weight(15)
          )

          // 为父 Drop 对象添加掉落物 <minecraft:string>
          .items([<contenttweaker:youzi_charged>,<treetweaker:youzi_charged>])

      )
      .addDrop(
          
          // 创建一个 Drop 对象
          Dropt.drop()
          .selector(
              
              // 设置父选择器的权重为 85
              Dropt.weight(85)
          )


      )
  );