///en_theory_sprite_control(self)
///en_sprite_control(enemy)
enemy = argument0;

if (enemy.sub_hsp != 0) {
    sprite_index = spr_en_walk;
} else {
    sprite_index = spr_en_idle;
}

if (enemy.sub_vsp < 0) {
    sprite_index = spr_en_jump;
} else if (enemy.sub_vsp > 0) {
    sprite_index = spr_en_fall;
}

if (enemy.sub_dir < 0) {
    image_xscale = abs(image_xscale);
} else if (enemy.sub_dir > 0) {
    image_xscale = -abs(image_xscale);
}
