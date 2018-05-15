///create_start_gui
title_scale = 2.0;
inst_title = instance_create(view_wview[0]/2, (view_hview[0]/2 - sprite_get_height(spr_title)*title_scale), obj_title);
inst_title.image_xscale = title_scale;
inst_title.image_yscale = title_scale;

start_scale = 0.75;
inst_start = instance_create(view_wview[0]/2, (view_hview[0]/2 + sprite_get_height(spr_start_button)*start_scale), obj_start_button);
inst_start.image_xscale = start_scale;
inst_start.image_yscale = start_scale;
