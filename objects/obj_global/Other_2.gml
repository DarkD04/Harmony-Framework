/// @description Set the value
	
	//Dev stuff:
	global.dev_mode = true;
	
	//Character globals:
	global.character = CHAR_SONIC;
	
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
	
	//Stage values
	global.checkpoint = ds_list_create();
	global.checkpoint_id = noone;
	global.time_store = 0;
	global.object_timer = 0;
	global.score = 0;
	global.rings = 0;
	global.life = 3;
	global.emeralds = [false, false, false, false, false, false, false];
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
	global.text_random = font_add_sprite_ext(spr_font_random,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.:-!",true,1)
	
	
	//Customizables
	global.legacy_rotation = true;			//Classic megadrive games rotation, if disabled it directs to partial rotation(from Mania)
	global.use_battery_rings = false;		//If this is disabled, destroying enemies will spawn flickies instead
	global.chaotix_monitors = false;		//Changes monitor icons to be like chaotix, monitor icon spins and it turns into dust
	
	//Collision layers
	global.col_tile[0] = "CollisionMain";
	global.col_tile[1] = "CollisionSemi";
	global.col_tile[2] = "CollisionA";
	global.col_tile[3] = "CollisionB";
	
	//Sonic abbilities
	global.use_peelout = true;
	global.use_dropdash = false;
	global.use_airroll = false;

	//Create controllers:
	instance_create_depth(0, 0, 0, obj_window);
	instance_create_depth(0, 0, 0, obj_input);
	instance_create_depth(0, 0, 0, obj_music);
	instance_create_depth(0, 0, -100, obj_fade);
	
	for(var i = 0; i <= room_last; ++i) 
	{
		global.roomlist[i] = room_get_name(i);
	}
	
	if(global.dev_mode) 
	{
		instance_create_depth(0, 0, 0, obj_dev);
		instance_create_depth(0, 0, 0, obj_shell);
	}
	
	//Macros:
	#macro Input obj_input
	#macro WINDOW_WIDTH global.window_width
	#macro WINDOW_HEIGHT global.window_height
	
	//Ending event:
	room_goto_next();
