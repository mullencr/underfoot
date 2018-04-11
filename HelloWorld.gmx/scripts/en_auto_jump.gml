///en_auto_jump(enemy)
enemy = argument0;
// Initialize variables
curr_x = enemy.x;
curr_y = enemy.y;
curr_vsp = -enemy.jumpspeed; // The vertical speed would be set to this if it jumped
timeout = 10000; // This is to make sure the game doesn't freeze.
count = 0;

// Until we collide with a wall
while(!place_meeting(curr_x, curr_y, obj_wall)) {
    count++;
    if (count > timeout) break;
    // Check that previous coordinates were above the platform
    check_y = curr_y;
    check_x = curr_x - (enemy.sprite_width / 2)*enemy.dir;
    // imitate motion
    curr_vsp += enemy.grav; // Gravity is a constant
    curr_x += enemy.hsp; // so is horizontal speed
    curr_y += curr_vsp;
    // Get the instance that we collide with, if any. Returns noone if there's nothing.
    inst = instance_place(curr_x, curr_y, obj_plat);
    if(inst != noone) {
        // placement_bool is just to take some weight off of the predicate
        // Check the bounding boxes to make sure we land on top, not hit the sides.
        placement_bool = (check_y < (inst).bbox_top) && (check_x > (inst).bbox_left && check_x < (inst).bbox_right);
    }
    // If we collide before we drop, its not an option.
    if(inst != noone && curr_vsp < 0) {
        return false;
    }
    // If we're falling (vsp > 0) and we hit THE TOP OF a platform, we jump
    if(inst != noone && curr_vsp > 0 && placement_bool) {
        return true;
    }
}
return false;
