/// @description Draw the swing
	//Draw the point
	draw_sprite(spr_aaz_swing_point, 0, x, y+8);
	
	//Chain code
	if(on_screen(16 * chain_amount, 16 * chain_amount))
	{
		for(var i = 1; i < chain_amount; i++)
		{
			//Chain movement
			var chain_x = x + floor((16 * i) * dsin(dcos(angle) * swing_range));
			var chain_y = y + floor((16 * i) * dcos(dcos(angle) * swing_range));
		
			//Draw the chains
			draw_sprite(spr_aaz_swing_chains, 0, chain_x, chain_y + 8);
		}
	}
	