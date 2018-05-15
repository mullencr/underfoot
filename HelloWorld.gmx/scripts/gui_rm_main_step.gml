///gui_rm_main_step
if(!instance_exists(obj_player)) {
    if (end_count > 0) {
        end_count--;
    } else {
        room_goto(rm_end);
    }
}
