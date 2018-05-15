/// playerAttack()
if (stunned)
    return 0;
    
if (attacking == 0 && key_atk) {
    if (collideTerrain(x, y+1))
        attacking = 1;
    else
        attacking = 2;
 
    image_index = 0;
    instance_destroy(hbox_player_atk);
    atk = instance_create(x, y, hbox_player_atk);
    atk.image_xscale = image_xscale;
}

if (sprite_index == spr_player_atk ||
    sprite_index == spr_player_air_atk) {
    if (attacking && image_index == 0) { // Attack ends
        attacking = 0;
        instance_destroy(hbox_player_atk);
        swing_has_hit = false;
    }
}
