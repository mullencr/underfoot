///stunEnemy(enemy)
enemy = argument0;

enemy.move_status = move_status.stumbled;

// Change the sprite accordingly
enemy.sprite_index = spr_en_stumble;
// Set image count to zero
enemy.image_index = 0;

// Set stumble_count depending on enemy type(?);
enemy.stumble_count = enemy.stumble_duration;
