function player_state_transform(){
	if (!super) {
		transform_timer = 60;
		super = true;
		play_sound(sfx_transform);
		player_animation_list();
		animator_reset(animator);	
	}
	
    if (transform_timer >= 30) {
        direction_allow = false;
        movement_allow = false;
        gravity_allow = false;
        x_speed = 0;
        y_speed = 0;
		landed = false;
		ground = false;
    }
    else {
        direction_allow = true;
        movement_allow = true;
        gravity_allow = true;
    }
	//Change animation
	animation_play(animator, ANIM.TRANSFORM);
    
    transform_timer -= 1;
    
    if (transform_timer <= 0 || ground) {
        state = player_state_normal;
        transform_timer = 0;
    }
}