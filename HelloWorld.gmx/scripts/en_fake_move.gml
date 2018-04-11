///en_fake_move(enemy)
enemy = argument0;
// Move along the x coordinate, back and forth, mimicking the fear of heights function.
enemy.sub_hsp = enemy.sub_dir * enemy.movespeed;
enemy.sub_vsp += enemy.grav;

en_theory_collision(enemy);

enemy.sub_x += enemy.sub_hsp;
enemy.sub_y += enemy.sub_vsp;

