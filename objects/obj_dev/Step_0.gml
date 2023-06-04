/// @description Scripts

	//No judas you will not memory hack my game asshole:blushed_emoji:
	if(!global.dev_mode) instance_destroy();
	
	//Toggle debug mode
	if(keyboard_check_pressed(vk_tab)) debug = !debug;
	if(keyboard_check_pressed(vk_f9)) show_collision = !show_collision;
	if(keyboard_check_pressed(vk_f8)) show_hitbox = !show_hitbox;
	if(keyboard_check_pressed(vk_f7)) show_fps = !show_fps;
	if(keyboard_check_pressed(vk_f5)) show_player = !show_player;
	if(keyboard_check_pressed(vk_f2)) room_restart();
	if(keyboard_check_pressed(vk_f1)) game_restart();
	if(keyboard_check_pressed(vk_f10))
	{
		global.character = (global.character + 1) mod 3;
	}
	
	//Change player debug flag
	obj_player.debug = debug;
	
	//Disable not in debug mode
	if(!debug) exit;
	
	//The scroll!
	if(mouse_wheel_up()) object_select += 1;
	if(mouse_wheel_down()) object_select -= 1;
	
	//Repeat
	if(object_select < 0) object_select = array_length(object_list) - 1;
	if(object_select > array_length(object_list) - 1) object_select = 0;
	
	//Spawn the object
	if(mouse_check_button_pressed(mb_left))
	{
		instance_create_layer(mouse_x, mouse_y, "Objects", object_list[object_select]);
	}
	
	//Object loop
	for(var i = 0; i < array_length(object_list); i++)
	{
		var mouse_overlap = instance_position(mouse_x, mouse_y, object_list[i])

		if(mouse_overlap && mouse_check_button_pressed(mb_right))
		{
			instance_destroy(mouse_overlap);
		}
	}