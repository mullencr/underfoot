/// playerAttack()
if (stunned || equipped == 0)
    return 0;
    
if (attacking == 0 && key_atk) {
    if (collideTerrain(x, y+1))
        attacking = 1;
    else
        attacking = 2;
 
    image_index = 0;
    instance_destroy(hbox_player_atk);
    atk = instance_create(x, y, hbox_player_atk);
    
    if (equipped == OHS_ID) {
        with (obj_snd_player) {
            sndOHSswing();
        }
    } else if (equipped == THS_ID) {
        with (obj_snd_player) {
            sndTHSswing();
        }
    } else if (equipped == CANDLE_ID) {
        with (obj_snd_player) {
            sndCandleSwing();
        }
    }
    
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
