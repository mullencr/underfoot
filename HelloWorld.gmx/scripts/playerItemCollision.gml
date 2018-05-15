var fris = instance_place(x,y, obj_frisbee);
if (fris != noone) {
    if (!fris.airborne) {
        instance_destroy(fris);
        has_frisbee = true;
    }
}

var inst = instance_place(x,y, obj_djump_pwrup);
if (inst != noone) {
    instance_destroy(inst);
    djump_enabled = true;
}
