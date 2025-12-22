/// @description Culling
	//Screen values
	var c, cx, cy, sw, sh;
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	sw = global.window_width;
	sh = global.window_height;
	
	//Emerald Radar
	if (is_emerald_hunt && object_exists(obj_emerald_shard)) {
		var closest = instance_nearest(obj_player.x, obj_player.y, obj_emerald_shard)
		if (closest) {
			if (!closest.collected && !obj_player.input_disable) {
				switch closest.distance_stages{
					case 1:
						if (FRAME_TIMER mod 60 == 0) {
							closest.scale = 1.2
							play_sound(sfx_radar_ding);
						}
					break;
					case 2:
						if (FRAME_TIMER mod 30 == 0) {
							closest.scale = 1.2
							play_sound(sfx_radar_ding);
						}
					break;
					case 3:
						if (FRAME_TIMER mod 15 == 0) {
							closest.scale = 1.3
							play_sound(sfx_radar_ding);
						}
					break;
					case 4:
						if (FRAME_TIMER mod 10 == 0) {
							closest.scale = 1.4
							play_sound(sfx_radar_ding);
						}
					break;
					case 5:
						if (FRAME_TIMER mod 5 == 0) {
							closest.scale = 1.42
							play_sound(sfx_radar_ding);
						}
					break;
					default:
				
					break;
				}
			}
		}
	}

	instance_activate_region(obj_player.x - 64, obj_player.y - 64, 128, 128, true);
	instance_activate_region(cx - 64, cy- 64, sw+64, sh+64, true);