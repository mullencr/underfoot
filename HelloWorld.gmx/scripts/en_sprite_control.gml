///en_sprite_control(enemy)
enemy = argument0;

if (hsp != 0) {
    sprite_index = spr_en_walk;
} else {
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
