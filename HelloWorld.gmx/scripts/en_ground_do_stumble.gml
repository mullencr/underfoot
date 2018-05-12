///en_ground_do_stumble

// Our movespeed is 0;
// We should stay like this until we're not
// Change sprite
self.sprite_index = spr_en_stumble;

self.stumble_count--;
if (stumble_count <= 0) {
    self.move_status = move_status.idling;
}



