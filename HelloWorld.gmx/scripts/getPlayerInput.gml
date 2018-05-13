/// getPlayerInput()
key_right = 0
key_left = 0

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(ord("W"));
key_atk = keyboard_check_pressed(vk_space);
key_shift = false; //keyboard_check_pressed(vk_shift);
mouse_left = mouse_check_button_pressed(mb_left);
