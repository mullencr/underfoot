if (!throwing && place_meeting(x, y, obj_frisbee) && !obj_frisbee.airborne) {
    instance_destroy(instance_place(x,y, obj_frisbee));
    has_frisbee = true;
}

var inst = instance_place(x,y, obj_djump_pwrup);
if (inst != noone) {
    instance_destroy(inst);
    djump_enabled = true;
}
