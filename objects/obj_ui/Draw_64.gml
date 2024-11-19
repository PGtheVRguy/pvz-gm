/// @description Insert description here
// You can write your code in this editor


mx = ((mouse_x div 24) * 24) + offsetX
my = ((mouse_y div 24) * 24) + offsetY - 24


lmx = mx/24
lmy = my/24 - 1




#region drawing main game
for(var _y = 0; _y < 5; _y++)
{
    for(var _x =  0; _x < 9; _x++)
    {
        draw_sprite(spr_tile, 0, (_x*24)+offsetX, (_y*24)+offsetY)
    }
    
}

#region rendering plants


for(var _obj = 0; _obj < ds_list_size(global.plantList); _obj++)
{
    var _p = ds_list_find_index(global.plantList, _obj)
    draw_sprite(_p.sprite, 0, _p.x, _p.y)

}

#endregion


#endregion






#region drawing UI
for(var i = 0; i < seedCount;  i++ )
{
    draw_sprite(spr_uiSel, 0, 0+i*32,0)
    var _p = array_get(seedArray, i)
    //show_debug_message(seedArray)
	if(_p != undefined)
    {
        try
        {
            draw_sprite(_p.sprite, 0, 4, (i*32)+4)
        }
        catch(_exception)
        {
            //do nothing lol

        }
    }
}

if((mouse_x < 32*seedCount) and (input_check_pressed("lclick")) and (mouse_y <= 32))
{
    seedPos = (mouse_x/32)
    seedPos = int64(seedPos)
    seedPos=clamp(seedPos, 0, seedCount)
    //show_debug_message(seedPos)
    targetPlant = seedArray[seedPos]
    //show_debug_message(targetPlant)
    if(!is_struct(targetPlant))
    {
        targetPlant = -1
    }
    show_debug_message(targetPlant)
}



#endregion


if(input_check_pressed("lclick") and (mouse_y > 32))
{
    if(targetPlant != -1)
    {
        ds_grid_set(lawn, lmx, lmy, targetPlant)
        instance_create_layer(mx, my, layer, obj_plant, {
            curPlant : targetPlant
        })
        targetPlant = -1
    }
}

#region preview
//cursor
draw_rectangle(mx, my, mx+24, my+24, true);
if(targetPlant != -1)
{
    draw_sprite(targetPlant.sprite, 0, mx, my)
}




#endregion