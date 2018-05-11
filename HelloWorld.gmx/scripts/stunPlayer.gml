if (!stunned) {
    stunned = true;
    alarm[STUN_ALARM] = room_speed * STUN_TIME;
    
    attacking = 0;
    throwing = 0;
    hsp = 0;
    vsp = -jumpspeed * 0.5;
}
