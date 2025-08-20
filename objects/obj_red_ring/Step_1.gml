
if !setup {
	if (ds_map_exists(global.red_ring_map, obj_level.stage_name)) {
			if (global.red_ring_map[? obj_level.stage_name][index] == 1) {
				already_collected = true;
				alpha_death = 0.5;
			}
	}
	setup = true
}