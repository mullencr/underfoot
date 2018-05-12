///en_sprite_control(enemy)
enemy = argument0;

if (hsp != 0) {
    sprite_index = spr_en_walk;
} else if (enemy.move_status != move_status.attacking and enemy.move_status != move_status.stumbled) {
    sprite_index = spr_en_idle;
}

if (vsp < 0) {
    sprite_index = spr_en_jump;
} else if (vsp > 0) {
    sprite_index = spr_en_fall;
}

if (dir < 0) {
    image_xscale = abs(image_xscale);
} else if (dir > 0) {
    image_xscale = -abs(image_xscale);
}