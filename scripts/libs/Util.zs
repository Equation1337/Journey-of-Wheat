#loader crafttweaker reloadable
#priority 2147483645
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.data.IData;
import mods.modularmachinery.IMachineController;

$expand IBlockPos$offset(pos as IBlockPos) as IBlockPos {
    return this.add(pos.x, pos.y, pos.z);
}

$expand IMachineController$relativePos(x as int, y as int, z as int) as IBlockPos {
    return this.pos.offset(this.rotateWithControllerFacing(IBlockPos.create(x, y, z)));
}

$expand IBlockPos$add(x as int,y as int,z as int)as IBlockPos{
    return IBlockPos.create(this.x + x,this.y + y,this.z + z);
}

$expand IBlockPos$createPosByFacing(facing as IFacing,NorthX as int,NorthY as int,NorthZ as int)as IBlockPos{
    val fN=facing.name;
    val x=NorthX;
    val y=NorthY;
    val z=NorthZ;
    if(fN == "NORTH")return this.add(x,y,z);
    if(fN == "SOUTH")return this.add(0-x,y,0-z);
    if(fN == "EAST")return this.add(0-z,y,x);
    if(fN == "WEST")return this.add(z,y,0-x);
    if(fN == "UP")return this.add(x,0-z,y);
    if(fN == "DOWN")return this.add(x,z,y);
    return this;
}