///en_stumble(spr_index)

// Our movespeed is 0;
// We should stay like this until we're not
// Change sprite
self.sprite_index = argument0;

speed = 0;
self.move_status = move_status.stumbled;

self.stumble_count--;
if (stumble_count <= 0) {
    self.move_status = move_status.idling;
}



