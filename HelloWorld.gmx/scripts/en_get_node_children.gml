///en_get_node_children(enemy, plat)
enemy = argument0;
plat = argument1;

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
ret = ds_map_create();

num_turns = 0;
while(num_turns < 3) {
    // =================================== MIMIC MOTION ==============================
    en_fake_move(enemy);
    
    // Check the point directly in front of us.
    // We don't have the origin exactly centered.
    // If we center it in the bounding box as best we can though, it should be fine.
    // Half of the bounding box plus the buffer.
    check_x = enemy.sub_x + ((enemy.bbox_right + 1 - enemy.bbox_left)/2)*enemy.sub_dir;
    check_y = plat.y + 2;
    plat_inst = instance_position(check_x, check_y, obj_surface_parent);
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
    inst = en_auto_jump_instance(enemy);
    find = ds_map_find_value(ret, inst);
    if(inst != noone && is_undefined(find)) {
        // Make a list that we can return.
        enemy.sub_list = ds_list_create();
        ds_list_add(enemy.sub_list, enemy.sub_x, enemy.sub_dir);
        ret[? inst] = enemy.sub_list;
    }
} // End while. We've turned thrice and covered all of the accessible platforms.
return ret;
