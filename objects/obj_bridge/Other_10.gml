/// @description PPZ Events
	//Lets make bridge glow!
	for (var i = 0; i < log_amount; ++i) {
		with(obj_player)
		{
			other.frame[i] = (3.5-distance_to_point(other.x + 16*i, other.y)/8) * other.stand_offset;
		}
		frame[i] = clamp(frame[i], 0, 3)
	}