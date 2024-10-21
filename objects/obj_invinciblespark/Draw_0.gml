/// @description Draw
	var array_loop;
	
	array_loop = array_length(frame_table[3]);
	draw_sprite(spr_inv_sparkle, frame_table[3][global.object_timer % array_loop], xd+(16*dsin(90-angle1 - 82)), yd+(16*dcos(90-angle1-82)));
	draw_sprite(spr_inv_sparkle, frame_table[3][(5 + global.object_timer) % array_loop], xd+(16*dsin(90-angle1 - 278)), yd+(16*dcos(90-angle1 - 278)));
	
	array_loop = array_length(frame_table[2]);
	draw_sprite(spr_inv_sparkle, frame_table[2][(5 + global.object_timer) % array_loop], xc+(16*dsin(90-angle1)), yc+(16*dcos(90-angle1)));
	draw_sprite(spr_inv_sparkle, frame_table[2][global.object_timer % array_loop], xc+(16*dsin(90-angle1 - 180)), yc+(16*dcos(90-angle1 - 180)));
	
	array_loop = array_length(frame_table[1]);
	draw_sprite(spr_inv_sparkle, frame_table[1][global.object_timer % array_loop], xb+(16*dsin(90-angle1-118)), yb+(16*dcos(90-angle1-118)));
	draw_sprite(spr_inv_sparkle, frame_table[1][(5 + global.object_timer) % array_loop], xb+(16*dsin(90-angle1 - 242)), yb+(16*dcos(90-angle1 - 242)));
	
	array_loop = array_length(frame_table[0]);
	for(var i = 0; i < 2; i++) 
	{
		draw_sprite(spr_inv_sparkle, frame_table[0][global.object_timer % array_loop], xa+(16*dsin(angle0 - 180*i)), ya+(16*dcos(angle0 - 180*i)))	
	}
