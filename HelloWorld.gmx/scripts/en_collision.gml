///en_collision(enemy)
enemy = argument0;
// Horizontal collision
if (place_meeting(enemy.x+enemy.hsp, enemy.y, obj_surface_parent)) {
    while(!place_meeting(enemy.x+sign(enemy.hsp),enemy.y, obj_surface_parent)) {
        enemy.x += sign(enemy.hsp);
   }
   enemy.hsp = 0;
   enemy.dir *= -1;
}
// Account for the range block.
if (!en_in_range_block(enemy, enemy.range_block, false)) {
   enemy.hsp = 0;
   enemy.dir *= -1;
}

// Vertical collision
if (place_meeting(enemy.x, enemy.y+enemy.vsp, obj_surface_parent)) {
    while(!place_meeting(enemy.x, enemy.y+sign(enemy.vsp), obj_surface_parent)) {
        enemy.y += sign(enemy.vsp);
    }
    enemy.vsp = 0;
}
