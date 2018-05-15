// playerDamage(dmg, en_x, not_invincible)
// damages the player and renders them stunned for a split second
// the player is invulnerable while stunned
// Param - 
//      dmg - the amount of damage for the player to take

if (!invincible) {

    with (obj_snd_player) {
        sndLokiDmg();
    }
    hp -= argument0;
    
        
    if (hp <= 0) {
        audio_stop_all();
        with (obj_snd_player) {
            sndLokiDeath();
        }
        killPlayer();
    }

}


if (argument1 < x) {
    stunPlayer(DIR_RIGHT);
} else if (argument1 > x) {
    stunPlayer(DIR_LEFT);
} else {
    stunPlayer(6969);
}

