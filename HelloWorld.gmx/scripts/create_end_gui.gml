///create_end_gui
end_scale = 2.0;
inst_end = instance_create(view_wview[0]/2, (view_hview[0]/2 - sprite_get_height(spr_game_over)*end_scale), obj_game_over);
inst_end.image_xscale = end_scale;
inst_end.image_yscale = end_scale;

start_show_count = 30;
has_shown = false;
