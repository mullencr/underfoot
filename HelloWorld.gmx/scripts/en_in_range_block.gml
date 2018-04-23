//en_in_range_block(enemy, block, theory)
enemy = argument0;
block = argument1;
theory = argument2;

if(theory) {
    // Run the check with sub values
    // Get the bounding box coordinates.
    left_x = enemy.sub_x - (width/2) + enemy.sub_hsp;
    right_x = enemy.sub_x + (width/2) + enemy.sub_hsp;
    top_x = enemy.sub_y - (height/2);
    bottom_x = enemy.sub_y + (height/2);
    status = rectangle_in_rectangle(left_x, top_x, right_x, bottom_x, block.bbox_left, block.bbox_top, block.bbox_right, block.bbox_bottom);
} else {
    // Run the check with real x values.
    // Get the bounding box coordinates.
    status = rectangle_in_rectangle(enemy.bbox_left, enemy.bbox_top, enemy.bbox_right, enemy.bbox_bottom, block.bbox_left, block.bbox_top, block.bbox_right, block.bbox_bottom);
}
return (status == 1);
