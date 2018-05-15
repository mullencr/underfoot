///en_node_walk_off_left(plat, dir)
plat = argument0;
enemy.sub_hsp = enemy.hsp;
enemy.sub_vsp = 0;
enemy.sub_dir = argument1;
// Set them to the new spot (the origin) of the platform.
enemy.sub_x = plat.x;
enemy.sub_y = plat.y;

// Move the enemy so that he sits on top of the platform.
while(place_meeting(enemy.sub_x, enemy.sub_y, obj_surface_parent)) {
    enemy.sub_y -= 1;
}
// enemy.sub_y should now put our duder just above the platform.

falling = false;
while(true) {
    // Move one way continuously until we're not on a platform anymore.
    en_fake_move(enemy);
    // Once we're off of the platform (in the air), we're moving down.
    // Check to see whether we have plat under us.
    on_plat = place_meeting(enemy.sub_x, enemy.sub_y + 1, obj_plat_large);
    if(!on_plat) {
        // As soon as we don't, set the falling to true.
        falling = true;
    }
    // We fall until we vertical collide with another platform.
    // If falling is true, check for vertical collision.
    inst = instance_place(enemy.sub_x, enemy.sub_y+enemy.sub_vsp, obj_surface_parent);
    if (falling && inst != noone) {
        // Once we achieve vertical collision, return the instance we collide with.
        return inst;
    }
}
// Them method should never return noone.
return noone;
