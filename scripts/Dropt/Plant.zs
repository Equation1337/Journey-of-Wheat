import mods.dropt.Dropt;

Dropt.list("Wheat")
    .add(Dropt.rule()
        .matchBlocks(["minecraft:wheat:7"])
        .matchDrops([<minecraft:wheat>])
        .replaceStrategy("REPLACE_ITEMS")
        .addDrop(
            Dropt.drop()
      )
    );