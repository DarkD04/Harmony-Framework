function draw_self_floor(){
	//Only purpose of this is because of GameMaker's horrible sub - pixeling
	draw_sprite_ext(sprite_index, image_index, floor(x) , floor(y), image_xscale, image_yscale, image_angle, draw_get_color(), draw_get_alpha());
}