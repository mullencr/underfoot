///en_get_ground_access(enemy)
enemy = argument0;
// Store values for later use.
sub_x = enemy.x;
sub_y = enemy.y;
ret = ds_map_create();
// Grab some variables. This is me being lazy and not wanting to type "enemy"
sub_vsp = enemy.vsp;
sub_dir = enemy.dir;
sub_hsp = enemy.hsp;
// This function assumes that we have a single ground object.
// Start this function at the origin of that ground object.

// TODO: Base this object floor off of whichever object floor is sub_directly below enemy
// instance passed in. Do this for scalability.

// ===================== Default motion ======================
pass_limit = 3;
pass_count = 0;
while(pass_count < pass_limit) {
    show_debug_message("looping in ground access");
    // Store prev_x for use later in the script.
    prev_x = sub_x;
    
    en_fake_move(enemy);
    
    // Print when we pass the start on the left or right
    if((prev_x >= enemy.x && enemy.x > sub_x)) {
        show_debug_message("left pass");
    } else if (prev_x < enemy.x && enemy.x <= sub_x) {
        show_debug_message("right pass");
    }
    
    // Check to see if we pass the origin. If so, increment pass count.
    if((prev_x >= enemy.x && enemy.x > sub_x) || (prev_x < enemy.x && enemy.x <= sub_x)) {
        pass_count++;
    }
    
    show_debug_message("curr x,y: " + string(sub_x) + ", " + string(sub_y));
    show_debug_message("curr jumpseed, hsp, movespeed: " + string(enemy.jumpspeed) + ", " + string(sub_hsp) + ", " + string(enemy.movespeed) + ", " + string(sub_dir));
    show_debug_message("Instance collision: " + string(instance_place(sub_x+(sub_hsp), sub_y, obj_surface_parent)));
    if(instance_place(sub_x, sub_y, obj_floor) != noone)
        show_debug_message("instance top: " + string(instance_place(sub_x, sub_y, obj_floor).y));
    show_debug_message("en_bot: " + string(enemy.bbox_bottom));

    if(sub_x == 633)
        show_debug_message("breakpoint");
    // If the horizontal speed is not zero (we've just collided)
    on_plat = place_meeting(enemy.sub_x, enemy.sub_y + 1, obj_surface_parent);
    if(sub_hsp != 0 && on_plat)
        // Run auto_jump, but this script should return the instance.
        inst = en_auto_jump_instance(enemy);
    else inst = noone;
    find = ds_map_find_value(ret, inst);
    // If we don't find the valid instance in theory, add its info to our map
    if(inst != noone && is_undefined(find)) {
        // Make a list that we can return.
        sub_list = ds_list_create();
        ds_list_add(sub_list, sub_x, sub_dir);
        ret[? inst] = sub_list;
    }
}
return ret;
