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
}

inst = instance_place(x,y, obj_candle);
if (inst != noone) {
    with (obj_snd_player) {
        sndCandleObtain();
    }
    instance_destroy(inst);
    has_candle = true;
}

inst = instance_place(x,y, obj_THS_item);
if (inst != noone) {
    with(obj_snd_player) {
        sndTHSobtain();
    }
    instance_destroy(inst);
    has_ths = true;
}
