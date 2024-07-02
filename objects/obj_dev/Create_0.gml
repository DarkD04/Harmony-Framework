/// @description Values
	//Object values:
	object_list = [obj_ring, obj_monitor, obj_spring_vertical, obj_spring_horizontal, obj_spring_diagonal, obj_spikes_vertical, obj_spikes_horizontal, obj_checkpoint, obj_battery_ring, obj_solid_object, obj_signpost, obj_capsule, obj_flicky, obj_player];
	object_select = 0;
	debug = false;
	show_collision = false;
	show_hitbox = false;
	show_player = false;
	show_fps = false;
	shell_open = false;
	store_truefps = fps_real;
	alarm[0] = 10;
	surf = surface_create(global.window_width, global.window_height);
	caption = window_get_caption();
	teleport_id = 0;
	
	graded_surf = surface_create(WINDOW_WIDTH * 2, WINDOW_HEIGHT * 2);
	
	depth = -1000;