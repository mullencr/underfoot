///do_explode
sprite_index = spr_energy_explode;

curr_img = self.image_index - (self.image_index % 1);

if (curr_img == (image_number - 1))  {
    instance_destroy(self);
}
