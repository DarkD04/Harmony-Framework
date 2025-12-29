
y_speed += y_accel;	
if (y_speed > 2) {
	y_speed = 2;	
}
y += y_speed;

image_index = reward
image_speed = 0

if (player_collide_object(C_MAIN) && !obj_player.input_disable){
	switch (reward){
		case GUMBALL.BUBBLE:
			play_sound(sfx_burst)
			instance_destroy()
		break;
		case GUMBALL.NORMAL:
			play_sound(sfx_shield)
			obj_player.shield = S_NORMAL;
			instance_destroy()
		break;
		case GUMBALL.AQUA:
			play_sound(sfx_shieldbubble)
			obj_player.shield = S_BUBBLE;
			instance_destroy()
		break;
		case GUMBALL.ELECTRIC:
			play_sound(sfx_shieldelec)
			obj_player.shield = S_ELECTRIC
			instance_destroy()
		break;
		case GUMBALL.FLAME:
			play_sound(sfx_shieldfire)
			obj_player.shield = S_FIRE;
			instance_destroy()
		break;
		case GUMBALL.RINGS:
			global.rings += 10
			play_sound(sfx_ring)
			instance_destroy()
		break;
		case GUMBALL.ONEUP:
			SOUND_EXTRA_LIFE;
			global.life += 1;
			instance_destroy()
		break;
		case GUMBALL.REPOSITION:
			play_sound(sfx_burst)
			var spring = obj_crumple_spring
			spring.y = spring.ystart
			spring.crumple = false
			spring.fall_speed = 0
			spring.triggered = false
			spring.visible = true
			spring.collision_flag = true
			instance_destroy()
		break;
		case GUMBALL.BUMPER:
			play_sound(sfx_bumper)
			var player = instance_nearest(x,y,obj_player);
			var angle = point_direction(x,y,player.x,player.y);
			player.x_speed = BUMPER_FACTOR * dcos(angle);
			player.y_speed = -BUMPER_FACTOR * dsin(angle);
			player.ground = false;
		break;
	}
}

if (y > obj_bonus_exit.bbox_bottom) {
	instance_destroy()	
}