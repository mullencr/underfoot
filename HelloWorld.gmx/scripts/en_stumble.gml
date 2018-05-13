///en_stumble(spr_index)

// Our movespeed is 0;
// We should stay like this until we're not
// Change sprite
self.sprite_index = argument0;

self.stumble_count--;
if (stumble_count <= 0) {
    self.move_status = move_status.idling;
}

show_debug_message("enemy is STUMBLED");



