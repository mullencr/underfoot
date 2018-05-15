///en_fly_hook
self.speed = 0;

if(!(instance_exists(self.hook))) {
    hook_thrown = false;
}

if (hook_thrown) {
    // Hook has been thrown, wait/throw blast of energy. important for spriting
    // If it hits, shoot a blast a player
    if (self.hook.has_hit) {
        en_hook_blast();
    } else {
        // Hold the hook until it hits.
        self.sprite_index = spr_en_air_hook_hold;
    }
} else {
    // Throw hook
    self.sprite_index = spr_en_air_hook_throw;
    
    curr_img = self.image_index - (self.image_index % 1);    
    
    fire_frame = 3;    
    
    // Before 4, he hasn't shot yet
    if (curr_img < fire_frame)
        done = false;
    
    if (curr_img == fire_frame and not done) {
        adjustx = 39 * sign(image_xscale);
        self.hook = instance_create(x - adjustx, y + 15, obj_en_hook);
        self.hook.thrower = self;
        hook_thrown = true;
        done = true;
    }
    
    if (curr_img == image_number - 1) {
        hook_thrown = true;
    }
}
