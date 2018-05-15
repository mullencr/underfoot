///checkHealth

if (self.en_health <= 0) {
    if(self.object_index == obj_en_fly) {
        with(self.hook) {
            hook_self_destruct();
        }
    }
    instance_destroy(self);
}
