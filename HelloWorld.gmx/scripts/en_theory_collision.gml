///en_theory_collision(enemy)
enemy = argument0;

if (place_meeting(enemy.sub_x+(enemy.sub_hsp), enemy.sub_y, obj_surface_parent)) {
    while(!place_meeting(enemy.sub_x+sign(enemy.sub_hsp),enemy.sub_y, obj_surface_parent)) {
        enemy.sub_x += sign(enemy.sub_hsp);
   }
   enemy.sub_hsp = 0;
   enemy.sub_dir *= -1;
}
if (enemy.sub_x > 1883) {
    show_debug_message("Breakpoint");
}
// Account for the range block.
if (!en_in_range_block(enemy, enemy.range_block, true)) {
   enemy.sub_hsp = 0;
   enemy.sub_dir *= -1;
}

// Vertical collision
if (place_meeting(enemy.sub_x, enemy.sub_y+enemy.sub_vsp, obj_surface_parent)) {
    while(!place_meeting(enemy.sub_x, enemy.sub_y+sign(enemy.sub_vsp), obj_surface_parent)) {
        enemy.sub_y += sign(enemy.sub_vsp);
    }
    enemy.sub_vsp = 0;
}
