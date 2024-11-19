/// @description Insert description here
// You can write your code in this editor
if(curPlant != -1)
{
    draw_sprite(curPlant.sprite, 0, x, y)
    curPlant.x = x;
    curPlant.y = y;
    ds_list_set(global.plantList, pID, curPlant)
}

