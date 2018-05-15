in_combat = (distance_to_object(obj_en_parent) < COMBAT_DIST)

if (in_fountain) {
    // Select opening music
    if (curr_music != 1) {
        with (obj_snd_player) {
            playOpeningMusic();
        }
    }
    curr_music = 1;
} else if (!in_combat) {
    // Select noncombat
    if (curr_music != 2) {
        with (obj_snd_player) {
            playNonCombatMusic();
        }
    }
    curr_music = 2;
} else if (in_combat) {
    // Select combat
    if (curr_music != 3) {
        with (obj_snd_player) {
            playCombatMusic();
        }
    } 
    curr_music = 3;
} else {

}
