function get_application_surface(px = 0.0, py = 0.0, w = WINDOW_WIDTH, h = WINDOW_HEIGHT){
	//Create temp surface
	static temp_surface = noone;
	
	if(!surface_exists(temp_surface))
	{
		surface_free(temp_surface);
		temp_surface = surface_create(w, h);
	}
	
	surface_copy(temp_surface, px, py, application_surface)
	
	return temp_surface;
}