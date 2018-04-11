if (!rolling && key_shift ) {
    if (collideTerrain(x, y+1)) {
        rolling = 1;
    }
}

if (sprite_index == spr_player_roll) {
    if (rolling && image_index == 0)
        rolling = 0;
}
