/// @description Dev menu
	room_speed = 60;
	
	if(keyboard_check_pressed(vk_escape) && !instance_exists(obj_devmenu) && !obj_shell.isOpen)
	{
		instance_create_depth(0, 0, -99999, obj_devmenu)
	}
	
	//Destroy just in case
	if(!global.dev_mode) 
	{
		instance_destroy();
	}
	
	//Go to level select
	if(keyboard_check_pressed(ord("M")) && !obj_shell.isOpen)
	{
		fade_to_room(rm_stage_select, 4);
		music_set_fade(FADE_OUT, 5);
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
		if(keyboard_check_pressed(vk_f2)) 
		{
			fade_to_room(room, 5);
			music_set_fade(FADE_OUT, 5);
		}
		if(keyboard_check_pressed(vk_f1)) game_restart();
		if(keyboard_check_pressed(vk_f10))
		{
			global.character = (global.character + 1) mod 3;
			with(obj_player)
			{
				player_animation_list();
				animator_reset(animator);
				
			}
		}
		
		if(keyboard_check(vk_f6)) room_speed = 5;
		if(keyboard_check(vk_backspace)) room_speed = 240;
	
		//Stop if player doesn't exist
		if(!instance_exists(obj_player)) exit;
	
		if(keyboard_check_pressed(ord("V")) && !instance_exists(obj_act_clear)){
			instance_create_layer(0, 0, "Utilities", obj_act_clear)
			obj_level.act_transition = false;
		}
		
		//Add rings
		if(keyboard_check(ord("1")))
		{
			global.rings++;
			play_sound(sfx_ring);
		}
		
		//Give the player extra life
		if(keyboard_check_pressed(ord("2")))
		{
			global.life++;
			play_sound(j_extra_life);
		}
		
		//Change shields
		if(keyboard_check_pressed(ord("3")))
		{
			obj_player.shield++;
			
			if(obj_player.shield >= array_length(obj_player.shield_list))
			{
				obj_player.shield = -1;
			}
		}
		
		//Give the player invincibility
		if(keyboard_check_pressed(ord("4")))
		{
			obj_player.invincible = true;
			obj_player.invincible_timer = 1200;
			play_music(J_INVINCIBLE, Jingle);
		}
		
		//Give the player speed shoes
		if(keyboard_check_pressed(ord("5")))
		{
			obj_player.speed_shoes_flag = true;
			obj_player.speed_shoes = 1200;
			play_music(J_SPEEDSHOE, Jingle);
		}
		
		//Hurt the player
		if(keyboard_check_pressed(ord("7")))
		{
			player_hurt(obj_player.x + obj_player.facing);
		}
		
		//Hurt the player
		if(keyboard_check_pressed(ord("8")))
		{
			obj_player.knockout_type = K_DIE;
		}
		
		//Toggle teleport
		if(keyboard_check_pressed(vk_space) && instance_exists(obj_debug_teleport))
		{
			var t = instance_find(obj_debug_teleport, teleport_id);
		
			obj_player.x = t.x;
			obj_player.y = t.y;
			obj_camera.camera_x = t.x;
			obj_camera.camera_y = t.y;
			
			obj_camera.target_x = obj_camera.camera_x;
			obj_camera.target_y = obj_camera.camera_y - 16;
			obj_camera.target_right = room_width;
			obj_camera.target_top = 0;
			obj_camera.target_bottom = room_height;
			obj_camera.limit_right = room_width;
			obj_camera.limit_top = 0;
			obj_camera.limit_bottom = room_height;
			
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