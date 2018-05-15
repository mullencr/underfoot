// Kills the player
with (obj_snd_player) {
    sndLokiDeath();
}
instance_destroy(self);
