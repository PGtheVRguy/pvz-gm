/// @description Insert description here
// You can write your code in this editor


offsetX = 0
offsetY = 32



seedCount = 6
targetPlant = -1


lawnWidth = 9;
lawnHeight = 5;

lawn = ds_grid_create(lawnWidth, lawnHeight)

ti_shooter = 
{
    sprite: spr_pl_shooter
}


global.plantList = ds_list_create()

seedArray = array_create(seedCount)

array_insert(seedArray, 0, ti_shooter)