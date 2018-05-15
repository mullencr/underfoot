/// playerInitialize()
MAX_HP = 100;
HEAL_RATE = 0.25;
hp = MAX_HP;
grav = 0.3;
hsp = 0;
vsp = 0;

curr_music = 0;
COMBAT_DIST = 800;
in_fountain = false;
in_combat = false;

jumpspeed = 15;
movespeed = 7;
dashspeed = 15;
h_accel = 0.75;
h_decel = 0.5;
MAX_FALLSPD = 100;
BOUNCE_SPD = 17;
STUN_HSP = 4;
STUN_VSP = 4;
APEX_CONST = 3;

just_landed = false;
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
can_roll = true;
landed = false;


has_scim = false;
has_candle = false;
has_ths = false;

OHS_ID = 1;
THS_ID = 2;
CANDLE_ID = 3;
equipped = 0;

OHS_DMG = 10;
CANDLE_DMG = 5;
THS_DMG = 20;

// ALARMS
STUN_ALARM = 0;
DASH_ALARM = 1;

// TIMES
STUN_TIME = 0.25;
DASH_TIME = 0.5;

// DIRECTIONS
DIR_LEFT = -1;
DIR_RIGHT = 1;
dir = DIR_RIGHT;
