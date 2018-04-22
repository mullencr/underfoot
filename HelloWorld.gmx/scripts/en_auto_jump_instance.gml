///en_auto_jump_instance(enemy.x, enemy.y, enemy.jumpspeed, enemy.hsp, enemy.dir, enemy.enemy.movespeed, enemy.enemy.grav)
enemy = argument0;

enemy.orig_sub_vsp = enemy.sub_vsp;
enemy.orig_sub_hsp = enemy.sub_hsp;
enemy.orig_sub_dir = enemy.sub_dir;
enemy.orig_sub_x = enemy.sub_x;
enemy.orig_sub_y = enemy.sub_y;

// Initialize variables
enemy.sub_vsp = -enemy.jumpspeed; // The vertical speed would be set to this if it jumped

timeout = 10000; // This is to make sure the game doesn't freeze.
count = 0;

// If we're on a platform, keep going until we hit the ground (i.e. we see a ground instance)
// This will stay true, so we will continue looping until we hit something.
on_plat = place_meeting(enemy.sub_x, enemy.sub_y + 1, obj_plat);
// Until we collide with a wall (or until this method returns if we're on a plat)
while(!place_meeting(enemy.sub_x, enemy.sub_y, obj_wall) or on_plat) {
    count++;
    if (count > timeout) break;
    // Check that previous coordinates were above the platform
    check_y = enemy.sub_y;
    check_x = enemy.sub_x - (bbox_right + 1 - bbox_left)/2*enemy.sub_dir;
    // imitate motion
    enemy.sub_hsp = enemy.sub_dir * enemy.movespeed;
    enemy.sub_vsp += enemy.grav; // Gravity is a constant
    
    // Add in horizontal collision.
    // Horizontal collision
    if (place_meeting(enemy.sub_x+enemy.sub_hsp, enemy.sub_y, obj_surface_parent)) {
        while(!place_meeting(enemy.sub_x+sign(enemy.sub_hsp),enemy.sub_y, obj_surface_parent)) {
            enemy.sub_x += sign(enemy.sub_hsp);
       }
       enemy.sub_hsp = 0;
       enemy.sub_dir *= -1;
    }
    
    // Vertical collision
    if (place_meeting(enemy.sub_x, enemy.sub_y+enemy.sub_vsp, obj_surface_parent) && enemy.sub_vsp < 0) {
        while(!place_meeting(enemy.sub_x, enemy.sub_y+sign(enemy.sub_vsp), obj_surface_parent)) {
            enemy.sub_y += sign(enemy.sub_vsp);
        }
        enemy.sub_vsp = 0;
        show_debug_message("Vertical collision registered in auto jump");
    }
    
    enemy.sub_x += enemy.sub_hsp;
    enemy.sub_y += enemy.sub_vsp;
    
    show_debug_message(string(enemy.sub_x) + "," + string(enemy.sub_y));
    
    // Get the instance that we collide with, if any. Returns noone if there's nothing.
    inst = instance_place(enemy.sub_x, enemy.sub_y, obj_surface_parent);
    if(inst != noone && ((inst.object_index == obj_plat) || (inst.object_index == obj_floor))) {
        // placement_bool is just to take some weight off of the predicate
        // Check the bounding boxes to make sure we land on top, not hit the sides.
        placement_bool = (check_y < (inst).bbox_top) && (check_x > (inst).bbox_left && check_x < (inst).bbox_right);
        // If we're falling (vsp > 0) and we hit THE TOP OF a platform, we jump
        if(enemy.sub_vsp > 0 && placement_bool) {
            // Restore original values (for ground access)
            enemy.sub_vsp = enemy.orig_sub_vsp;
            enemy.sub_hsp = enemy.orig_sub_hsp;
            enemy.sub_dir = enemy.orig_sub_dir;
            enemy.sub_x = enemy.orig_sub_x;
            enemy.sub_y = enemy.orig_sub_y;
            return inst;
        } else {
            // Restore original values (for ground access)
            enemy.sub_vsp = enemy.orig_sub_vsp;
            enemy.sub_hsp = enemy.orig_sub_hsp;
            enemy.sub_dir = enemy.orig_sub_dir;
            enemy.sub_x = enemy.orig_sub_x;
            enemy.sub_y = enemy.orig_sub_y;
            return noone;
        }
    }
}
// Restore original values (for ground access)
enemy.sub_vsp = enemy.orig_sub_vsp;
enemy.sub_hsp = enemy.orig_sub_hsp;
enemy.sub_dir = enemy.orig_sub_dir;
enemy.sub_x = enemy.orig_sub_x;
enemy.sub_y = enemy.orig_sub_y;
return noone;
