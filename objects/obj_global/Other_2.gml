/// @description Set the value
	//Variables for this object only
	process_object_list = ds_list_create();
	
	//Game variables
	global.process_objects = true;			//Flag that allows step event of every object to be processed
	global.dev_mode = true;					//Flag for developer mode, which allows you to use dev commands, don't forget to turn this off when releasing the game
	
	//Character globals
	global.character = CHAR_SONIC;			//Global value for the character
	
	//Screen values
	global.window_width  = 426;				//Window's horizontal size
	global.window_height = 240;				//Window's vertical size
	global.window_size   = 2;				//Window size multiplier
	
	//keyboard inputs
	global.up = vk_up;						
    global.down = vk_down;
    global.left = vk_left;
    global.right = vk_right;
    global.a = ord("A");
    global.b = ord("S");
    global.c = ord("D");
    global.start = vk_enter;
	
	//Setup volume
	global.bgm_volume = 1;					//Music's channel volume
	global.sfx_volume = 1;					//Sound effects volume
	
	//Checkpoint values
	global.checkpoint = ds_list_create();	//The list of active checkpoints
	global.checkpoint_id = noone;			//Checkpoint that is currently active
	global.time_store = 0;					//Store value for timer when checkpoint gets active
	
	//Stage values
	global.object_timer = 0;				//Object pre frame timer, every 60 frames in a 1 second
	global.score = 0;						//Global variable for score
	global.stage_timer = 0;					//Global variable for stage timer
	global.rings = 0;						//Global variable for rings
	global.life = 3;						//Global variable for life
	global.title_card = true;				//Flag that allows title card to be triggered, used in dev
	global.emeralds = [false, false, false, false, false, false, false];				//List of active emeralds
	global.col_tile = ["CollisionMain", "CollisionSemi", "CollisionA", "CollisionB"];	//List of collision layers
	
	//Act transition variables
	global.monitor_store = [];				//List of monitor instances that were bumped with sign
	global.monitor_id = 0;					//Current list ID of bumped monitor
	global.act_transition = false;			//Act transition trigger, this is active for a single frame when new act starts
	
	//Extra life stuff
	global.score_extralife = 50000;			//Score threshold for extra life
	global.ring_extralife = 100;			//Ring threshold for extra life
	
	//Customizables variables
	global.rotation_type = 0;				//This changes player's visual rotation 
	global.use_battery_rings = false;		//If this is disabled, destroying enemies will spawn flickies instead
	global.chaotix_monitors = false;		//Changes monitor icons to be like chaotix, monitor icon spins and it turns into dust
	global.use_peelout = true;				//Flag that allows peel-out ability
	global.use_dropdash = true;				//Flag that allows dropdash ability
	global.use_airroll = false;				//Flag that allows rolling while air-borne
	global.use_spindash = true;				//Flag taht allows player to use the spindash
	global.camera_pan_type = 0;				//Variable that changes how camera panning works. 0 = No panning, 1 = Sonic CD panning[currently inaccurate], 2 = S1D/XG styled camera panning 
	global.chaotix_dust_effect = false;		//Flag that disables classic spindash/skid dust effect
	global.camera_type = 1;					//Vertical camera scrolling type, 0 = Megadrive, 1 = Mania
	global.knux_camera_smooth = false;		//Flag for using smooth ledge climb camera movement
	
	//Font setup:
	global.hud_number = font_add_sprite(spr_hud_numbers, ord("0"), false, 0);
	global.text_font = font_add_sprite_ext(spr_hud_font, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);
	global.font_debug = font_add_sprite_ext(spr_font_debug, " !'#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\] ^_`abcdefghijklmnopqrstuvwxyz{|}~€‚", false, 0);
	global.font_small = font_add_sprite_ext(spr_font_small, " ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);
	global.text_random = font_add_sprite_ext(spr_font_random, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.:-!", true, 1);
	
	//Create controllers:
	instance_create_depth(0, 0, 0, obj_window);
	instance_create_depth(0, 0, 0, obj_input);
	instance_create_depth(0, 0, 0, obj_music);
	instance_create_depth(0, 0, -100, obj_fade);
	
	//Controlers for dev mode
	if(global.dev_mode) 
	{
		instance_create_depth(0, 0, 0, obj_dev);
		instance_create_depth(0, 0, 0, obj_shell);
	}
	
	//Initilize the music list
	init_music_list();
	
	//Macros:
	#macro Input obj_input
	#macro WINDOW_WIDTH global.window_width
	#macro WINDOW_HEIGHT global.window_height
	#macro FRAME_TIMER global.object_timer
	
	//Ending event:
	room_goto_next();
