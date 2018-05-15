/// stunPlayer(dir)
// Param -
//      dir - the direction in which to knock the player back.
//            either DIR_RIGHT or DIR_LEFT

if (!stunned) {
    stunned = true;
    alarm[STUN_ALARM] = room_speed * STUN_TIME;
    
    invincible = true;
    attacking = 0;
    throwing = 0;
    hsp = 0;
    
    if (argument0 == DIR_LEFT) {
        vsp = -STUN_VSP;
        hsp = -STUN_HSP;
        dir = DIR_RIGHT;
    } else if (argument0 == DIR_RIGHT) {
        vsp = -STUN_VSP;
        hsp = STUN_HSP;
        dir = DIR_LEFT;
    } else
        vsp = -jumpspeed * 0.5;
}
