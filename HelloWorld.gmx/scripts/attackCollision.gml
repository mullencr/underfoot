enemy = instance_place(x,y,obj_en_parent);

if (enemy != noone) {
    with(enemy) {
        enemy.en_health -= 10;
    }
}
