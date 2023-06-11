/// @description Set the value
	//Dev stuff:
	global.dev_mode = true;
	
	//Character globals:
	global.character = CHAR_SONIC;
	
	// Screen values:
	global.window_width  = 320;
	global.window_height = 240;
	global.window_size   = 1;
	
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
	
	//Stage values
	global.checkpoint = ds_list_create();
	global.checkpoint_id = noone;
	global.time_store = 0;
	global.object_timer = 0;
	global.score = 0;
	global.rings = 0;
	global.life = 3;
	global.stage_timer = 0;
	global.monitor_store = [];
	global.monitor_id = 0;
	global.act_transition = false;
	global.score_extralife = 50000;
	global.ring_extralife = 100;
	
	//Font setup:
	global.hud_number = font_add_sprite(spr_hud_numbers, ord("0"), false, 0);
	global.text_font = font_add_sprite_ext(spr_hud_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ",false,0)
	global.font_small = font_add_sprite_ext(fontDebug," ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",false,0)
	
	//Customizables
	global.legacy_rotation = true;			//Classic megadrive games rotation, if disabled it directs to partial rotation(from Mania)
	global.use_battery_rings = false;		//If this is disabled, destroying enemies will spawn flickies instead
	global.chaotix_monitors = false;		//Changes monitor icons to be like chaotix, monitor icon spins and it turns into dust
	
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
		
