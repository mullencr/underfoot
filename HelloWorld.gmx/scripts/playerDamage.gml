// playerDamage(dmg, en_x, not_invincible)
// damages the player and renders them stunned for a split second
// the player is invulnerable while stunned
// Param - 
//      dmg - the amount of damage for the player to take
//      en_x - the x val of the dmg source

if (!invincible) {
    hp -= argument0  
}
    
if (hp <= 0) {
    killPlayer();
}

if (argument_count != 3) {
    invincible = true;
} else {
    invincible = false;
    return 0;
}

if (argument1 < x) {
    stunPlayer(DIR_RIGHT);
} else if (argument1 > x) {
    stunPlayer(DIR_LEFT);
} else {
    stunPlayer(6969);
}

