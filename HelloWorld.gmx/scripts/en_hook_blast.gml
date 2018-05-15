///en_hook_blast
self.speed = 0;
self.sprite_index = spr_en_air_hook_blast;

curr_img = self.image_index - (self.image_index % 1);

fire_frame = 5;

// Before 4, he hasn't shot yet
if (curr_img < fire_frame)
    done = false;

if (curr_img == fire_frame and not done) {
    adjustx = 69 * sign(image_xscale);
    var proj = instance_create(x - adjustx, y - 25, obj_en_projectile);
    proj.image_xscale = self.proj_scale;
    proj.image_yscale = self.proj_scale;
    done = true;
}
