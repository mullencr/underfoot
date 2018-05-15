///snag_player
if(instance_exists(obj_player)) {
    if(place_meeting(x, y, obj_player)) {
        with(obj_player) {
            if (!other.has_hit) {
                playerDamage(5, other.thrower.x);
                hsp = 0;
                vsp = 0;
                other.hold_count = obj_en_fly.hold_count;
            }
        }
        has_hit = true;
        with(obj_player) {
            setStun(true);
        }
    }
}
// recheck. we might have just killed him.
if(instance_exists(obj_player)) {   
    if (has_hit) {
        self.x = obj_player.x;
        self.y = obj_player.y;
        // Decrement hold count.
        self.hold_count--;
        if (self.hold_count <= 0) {
            hook_self_destruct();
        }
    }
}
