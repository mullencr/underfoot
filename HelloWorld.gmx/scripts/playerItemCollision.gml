var fris = instance_place(x,y, obj_frisbee);
if (fris != noone) {
    if (!fris.airborne) {
        instance_destroy(fris);
        sndFrisObtain();
        has_frisbee = true;
    }
}

var inst = instance_place(x,y, obj_djump_pwrup);
if (inst != noone) {
    instance_destroy(inst);
    djump_enabled = true;
}

inst = instance_place(x,y, obj_scim_item);
if (inst != noone) {
    with (obj_snd_player) {
        sndOHSobtain();
    }
    instance_destroy(inst);
    has_scim = true;
    equipped = OHS_ID;
}

inst = instance_place(x,y, obj_candle);
if (inst != noone) {
    with (obj_snd_player) {
        sndCandleObtain();
    }
    instance_destroy(inst);
    has_candle = true;
    equipped = CANDLE_ID;
}

inst = instance_place(x,y, obj_THS_item);
if (inst != noone) {
    with(obj_snd_player) {
        sndTHSobtain();
    }
    instance_destroy(inst);
    has_ths = true;
    equipped = THS_ID;
}

inst = instance_place(x, y, obj_fountain_switch);
if (inst != noone) {
    instance_destroy(obj_thick_pillar);
}

inst = instance_place(x,y, obj_fountain_heal);
if (inst != noone) {
    in_fountain = true;
    hp += HEAL_RATE;
    if (hp > MAX_HP)
        hp = MAX_HP;
} else
    in_fountain = false;
    
inst = instance_place(x,y, obj_boss_trigger);
if (inst != noone) {
    if (!boss_triggered) {
        with(obj_snd_player) {
            playBossMusic();
        }
    }
    boss_triggered = true;
}

inst = instance_place(x, y, obj_hallway_trigger);
if (inst != noone) {
    if (!hallway_triggered) {
        with (obj_snd_player) {
            playHallwayMusic();
        }
    }
    hallway_triggered = true;
}   
