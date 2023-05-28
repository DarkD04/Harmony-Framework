function player_animation_list(){
	add_animation(ANIM_STAND, spr_sonic_idle, 0.25, 0, true);
	add_animation(ANIM_WALK, spr_sonic_walk, 0.25, 0, true);
	add_animation(ANIM_RUN, spr_sonic_run, 0.25, 0, true);
	add_animation(ANIM_MAXRUN, spr_sonic_peelout, 1, 0, true);
	add_animation(ANIM_ROLL, spr_sonic_roll, 0.25, 0, true);
	add_animation(ANIM_LOOKDOWN, spr_sonic_lookdown, 0.4, 0, false);
	add_animation(ANIM_LOOKUP, spr_sonic_lookup, 0.4, 0, false);
	add_animation(ANIM_SPINDASH, spr_sonic_spindash, 0.6, 0, true);
	add_animation(ANIM_SPRING, spr_sonic_spring, 0.4, 0, true);
	add_animation(ANIM_SKID, spr_sonic_skid, 0.4, 0, false);
	add_animation(ANIM_SKIDTURN, spr_sonic_skidturn, 0.3, 0, false);
	add_animation(ANIM_HURT, spr_sonic_hurt, 0.3, 0, false);
	add_animation(ANIM_DIE, spr_sonic_death, 0.3, 0, false);
}