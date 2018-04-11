if (!throwing && place_meeting(x, y, obj_frisbee) && !obj_frisbee.airborne) {
    instance_destroy(instance_place(x,y, obj_frisbee));
    has_frisbee = true;
}
