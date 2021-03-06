///en_get_node_children(enemy, plat)
var enemy = argument0;
var plat = argument1;

//Initialize values.

enemy.sub_hsp = enemy.hsp;
enemy.sub_vsp = enemy.vsp;
enemy.sub_dir = enemy.dir;
// Set them to the new spot (the origin) of the platform.
enemy.sub_x = plat.x;
enemy.sub_y = plat.y;

// Move the enemy so that he sits on top of the platform.
while(place_meeting(enemy.sub_x, enemy.sub_y, obj_surface_parent)) {
    enemy.sub_y -= 1;
}
// enemy.sub_y should now put our duder just above the platform.

// Create the data structure to store the outputs:
var ret = ds_map_create();

var num_turns = 0;
while(num_turns < 3) {
    // =================================== MIMIC MOTION ==============================
    en_fake_move(enemy);
    
    // Check the point directly in front of us.
    // We don't have the origin exactly centered.
    // If we center it in the bounding box as best we can though, it should be fine.
    // Half of the bounding box plus the buffer.
    var check_x = enemy.sub_x + ((enemy.bbox_right + 1 - enemy.bbox_left)/2)*enemy.sub_dir;
    var check_y = plat.y + 2;
    var plat_inst = instance_position(check_x, check_y, obj_surface_parent);
    if(plat_inst == noone) {
        // Increment the num_turns
        //show_debug_message("dir switch");
        //show_debug_message("checks: " + string(check_x) + ", " + string(check_y));
        //show_debug_message("left: " + string(plat.x) + ", right: " + string(plat.x + plat.bbox_right + 1 - plat.bbox_left));
        //show_debug_message("top: " + string(plat.y) + ", bottom: " + string(plat.y + plat.bbox_bottom + 1 - plat.bbox_top));
        num_turns += 1; 
        enemy.sub_dir *= -1;
    }
    // ================================ END MOTION, RUN THE CHECK  ============================
    // Run the auto jump. Each time we find a valid collision
    var inst = en_auto_jump_instance(enemy);
    var find = ds_map_find_value(ret, inst);
    if(inst != noone && is_undefined(find)) {
        // Make a list that we can return.
        var sub_list = ds_list_create();
        ds_list_add(sub_list, enemy.sub_x, enemy.sub_dir);
        ret[? inst] = sub_list;
    }
} // End while. We've turned thrice and covered all of the accessible platforms while jumping.

// Now, we need to check the two edges.
var inst_right = en_node_walk_off_edge(plat, 1);
if (inst_right != noone) {
    // add it with a jump_x of noone and an accurate jump dir.
    var sub_list = ds_list_create();
    ds_list_add(sub_list, noone, 1);
    // NOTE: this will replace an entry in the list from before
    // This is preferred, as these downward jumps were sometimes erroneous.
    ret[? inst_right] = sub_list;
}
// Reverse the direction and repeat once.
var inst_left = en_node_walk_off_edge(plat, -1);
if (inst_left != noone) {
    // add it with a jump_x of noone and an accurate jump dir.
    var sub_list = ds_list_create();
    ds_list_add(sub_list, noone, -1);
    ret[? inst_left] = sub_list;
}


return ret;
