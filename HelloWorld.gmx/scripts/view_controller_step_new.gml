///view_controller_step
// About to cheat here.
with(obj_player) {
    other.block = en_get_range_block(obj_player);
}

show_debug_message("current_room: " + room_get_name(room));

// Make the view like 50% of the view.
if (block != noone) {
    //get the height
    width = (block.sprite_width * room_scale);
    height = (width * view_hport[view_current])/view_wport[view_current];
    view_wview[view_current] = width;
    view_hview[view_current] = height;
} else {
    view_hview[view_current] = default_hview;
    view_wview[view_current] = default_wview;
}

