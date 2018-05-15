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
        with (obj_snd_player) {
            sndLokiDeath();
        }
        killPlayer();
    }

}


