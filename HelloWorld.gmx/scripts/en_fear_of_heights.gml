///en_fear_of_heights(enemy)
enemy = argument0;

// Check the point directly in front of us.

check_x = enemy.x + (enemy.width/2)*enemy.dir;
check_y = enemy.y + ((enemy.height/2) + 1);
// Make sure that we're on a platform, but if we see a ledge, turn around.
if(place_meeting(enemy.x, enemy.y + 1, obj_surface_parent) && !place_meeting(check_x, check_y, obj_surface_parent)) {
    enemy.dir *= -1;
}
