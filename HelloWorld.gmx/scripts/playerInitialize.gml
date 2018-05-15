/// playerInitialize()
hp = 100;
grav = 0.3;
hsp = 0;
vsp = 0;

jumpspeed = 15;
movespeed = 7;
h_accel = 0.75;
h_decel = 0.5;
MAX_FALLSPD = 100;
BOUNCE_SPD = 17;
STUN_HSP = 4;
STUN_VSP = 4;

attacking = 0;
throwing = 0;
stunned = false;
invincible = false;
rolling = false;
inf_frisbees = false;
has_frisbee = false;
image_speed = 0.25;
in_block = false;
djump_enabled = false;
swing_has_hit = false;

// ALARMS
STUN_ALARM = 0;

// TIMES
STUN_TIME = 0.25;

// DIRECTIONS
DIR_LEFT = -1;
DIR_RIGHT = 1;
dir = DIR_RIGHT;
