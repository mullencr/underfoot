///en_fly_update_move_status(enemy, player, range_spot, range_atk)
enemy = argument0;
player = argument1;
range_spot = argument2;
range_atk = argument3;
dist = point_distance(enemy.x, enemy.y, player.x, player.y);
if (range_atk < dist && dist < range_spot && enemy.move_status != move_status.chasing) {
    path_end();
    enemy.move_status = move_status.chasing;
} else if (dist <= range_atk && enemy.move_status != move_status.attacking) {
    path_end();
    enemy.move_status = move_status.attacking;
}
/* else if (!in_range && enemy.move_status != move_status.idling) {
    path_start(pth_test, movespeed, path_action_continue, false);
    enemy.move_status = move_status.idling;
} */
