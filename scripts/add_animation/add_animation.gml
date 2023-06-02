function add_animation(anim_id, sprite, anim_speed, loop_start, loop, legacy){
	//Change to correct values:
	if(anim_id = animation)
	{	
		//Set animation sprite:
		animation_sprite = sprite;
		
		//Set loop's start point:
		animation_loop_start = loop_start;
		
		//Change looping flag:
		animation_loop = loop;
		
		//Change animation to the given value:
		animation = anim_id;
		
		//accuracy nut mode
		animation_legacy = legacy;
		
		//Set animation speed:
		if (animation_legacy == false)
		{
			animation_set_speed = anim_speed;
		}
	}
}