///en_init_bbox_dimensions(enemy)
enemy=argument0;

enemy.width = enemy.bbox_left - enemy.bbox_right + 2;
enemy.height = enemy.bbox_bottom - enemy.bbox_top + 2;

