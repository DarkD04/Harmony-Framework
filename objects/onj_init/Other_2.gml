/// @description Set the value
	//Dev stuff:
	global.dev_mode = true;
	
	// Screen values:
	global.window_width  = 426;
	global.window_height = 240;
	global.window_size   = 2;
	
	//keyboard inputs:
	global.up = vk_up;
    global.down = vk_down;
    global.left = vk_left;
    global.right = vk_right;
    global.a = ord("A");
    global.b = ord("S");
    global.c = ord("D");
    global.start = vk_enter;
	
	//Setup volume:
	global.bgm_volume = 1;
	global.sfx_volume = 1;
	
	//Checkpoint values
	global.checkpoint = ds_list_create();
	global.checkpoint_id = noone;
	global.time_store = 0;
	
	//Font setup:
	global.hud_number = font_add_sprite(spr_hud_numbers, ord("0"), false, 0);
	global.text_font = font_add_sprite_ext(spr_hud_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ",false,0)
	
	//Misc.
	global.legacy_rotation = false;
	
	//Create controllers:
	instance_create_depth(0, 0, 0, obj_window);
	instance_create_depth(0, 0, 0, obj_input);
	instance_create_depth(0, 0, 0, obj_music);
	instance_create_depth(0, 0, -100, obj_fade);
	if(global.dev_mode) instance_create_depth(0, 0, 0, obj_dev);
	
	//Macros:
	#macro Input obj_input
	
	//Ending event:
	room_goto_next();
		
