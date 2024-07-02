/// @description Scripts

	//No judas you will not memory hack my game asshole:blushed_emoji:
	if(!global.dev_mode) instance_destroy();
	
	//Go to level select
	if(keyboard_check_pressed(ord("M")) && !obj_shell.isOpen)
	{
		fade_to_room(rm_stage_select, 4);
		obj_music.fade = -1;
		obj_music.fade_speed = 5;	
	}
	
	//Toggle debug mode
	if(keyboard_check_pressed(vk_f5) && instance_exists(obj_shell)) obj_shell.isOpen = !obj_shell.isOpen;
	
	if(!obj_shell.isOpen)
	{
		if(keyboard_check_pressed(vk_tab)) debug = !debug;
		if(keyboard_check_pressed(ord("B")) && instance_exists(obj_hud)) obj_hud.render = !obj_hud.render;
		if(keyboard_check_pressed(ord("T"))) global.title_card = !global.title_card;
		if(keyboard_check_pressed(vk_f9)) show_collision = !show_collision;
		if(keyboard_check_pressed(vk_f8)) show_hitbox = !show_hitbox;
		if(keyboard_check_pressed(vk_f3)) show_fps = !show_fps;
		if(keyboard_check_pressed(ord("N"))) global.bgm_volume = (global.bgm_volume + 1) mod 2;
		if(keyboard_check_pressed(vk_f7)) show_player = !show_player;
		if(keyboard_check_pressed(vk_f2)) {
			fade_to_room(room, 5);
			obj_music.fade = MusicFadeOut
			obj_music.fade_speed = 5;
		}
		if(keyboard_check_pressed(vk_f1)) game_restart();
		if(keyboard_check_pressed(vk_f10))
		{
			global.character = (global.character + 1) mod 4;
		}
		if(keyboard_check(vk_f6)) room_speed = 10 else room_speed = 60
	
		//Stop if player doesn't exist
		if(!instance_exists(obj_player)) exit;
	
		if(keyboard_check_pressed(ord("V")) && !instance_exists(obj_act_clear)){
			instance_create_layer(0, 0, "Utilities", obj_act_clear)
			obj_level.act_transition = false;
		}
	
		//Toggle teleport
		if(keyboard_check_pressed(vk_space))
		{
			var t = instance_find(obj_debug_teleport, teleport_id);
		
			obj_player.x = t.x;
			obj_player.y = t.y;
			obj_camera.target_x = t.x;
			obj_camera.target_y = t.y;
		
			teleport_id++;
			teleport_id %= instance_number(obj_debug_teleport);
		}
	}
	//Stop if player doesn't exist
	if(!instance_exists(obj_player)) exit;
		
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
		if(object_select = 11)
		{
			obj_level.act_transition = false;	
		}
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