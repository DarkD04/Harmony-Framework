
if (!place_meeting(x,y + 1,par_gumball_solid)){
	y_speed += y_accel	
	y += y_speed
	
	var obj = instance_place(x,y,par_gumball_solid) 
	if (obj) {
		y = obj.bbox_top - (sprite_height /2)
	}
	
	
} else {
	y_speed = 0	
}