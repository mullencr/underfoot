///hook_self_destruct
clean_instances();
with (obj_player) {
    setStun(false);
}
instance_destroy(self);
