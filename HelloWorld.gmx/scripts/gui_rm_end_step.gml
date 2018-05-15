///gui_rm_end_step
if (start_show_count <= 0 and not has_shown) {
    start_scale = 0.75;
    inst_start = instance_create(view_wview[0]/2, (view_hview[0]/2 + sprite_get_height(spr_start_button)*start_scale), obj_start_button);
    inst_start.image_xscale = start_scale;
    inst_start.image_yscale = start_scale;
    inst_start.image_speed = 0.04;
    has_shown = true;
} else {
    start_show_count--;
}
