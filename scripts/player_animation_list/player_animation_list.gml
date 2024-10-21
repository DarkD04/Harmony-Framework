function player_animation_list(){
	switch(global.character)
	{
		case CHAR_SONIC:
		animation_add(ANIM_STAND, spr_sonic_idle, 0.2)
		animation_add(ANIM_WAIT, spr_sonic_wait, 6, 2, true, true);
		animation_add(ANIM_WALK, spr_sonic_walk, 3, 0, true, true);
		animation_add(ANIM_RUN, spr_sonic_run, 2, 0, true, true);
		animation_add(ANIM_MAXRUN, spr_sonic_peelout, 0, 0, true, true);
		animation_add(ANIM_ROLL, spr_sonic_roll, 0, 0, true, true);
		animation_add(ANIM_LOOKDOWN, spr_sonic_lookdown, 0.4, 0, false, false);
		animation_add(ANIM_LOOKUP, spr_sonic_lookup, 0.4, 0, false, false);
		animation_add(ANIM_SPINDASH, spr_sonic_spindash, 0.6, 0, true, false);
		animation_add(ANIM_SPRING, spr_sonic_spring, 0.4, 0, true, false);
		animation_add(ANIM_SKID, spr_sonic_skid, 0.4, 0, false, false);
		animation_add(ANIM_SKIDTURN, spr_sonic_skidturn, 0.3, 0, false, false);
		animation_add(ANIM_HURT, spr_sonic_hurt, 0.3, 0, false, false);
		animation_add(ANIM_DIE, spr_sonic_death, 0.3, 0, false, false);
		animation_add(ANIM_DROWN, spr_sonic_drown, 0.3, 0, false, false);
		animation_add(ANIM_BREATHE, spr_sonic_breathe, 16, 0, false, true);
		animation_add(ANIM_PUSH, spr_sonic_push, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE1, spr_sonic_ledge1, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE2, spr_sonic_ledge2, 0.1, 0, true, false);
		animation_add(ANIM_VICTORY, spr_sonic_victory, 0.1, 1, true, false);
		animation_add(ANIM_DROPDASH, spr_sonic_dropdash, 0.5, 1, true, false);
		break;
		
		case CHAR_TAILS:
		animation_add(ANIM_STAND, spr_tails_idle, [60, 6], 0, true, true);
		animation_add(ANIM_WAIT, spr_tails_wait, [80, 10], 0, true, true);
		animation_add(ANIM_WALK, spr_tails_walk, 3, 0, true, true);
		animation_add(ANIM_RUN, spr_tails_run, 2, 0, true, true);
		animation_add(ANIM_MAXRUN, spr_tails_maxrun, 1, 0, true, true);
		animation_add(ANIM_ROLL, spr_tails_roll, 0.4, 0, true, false);
		animation_add(ANIM_LOOKDOWN, spr_tails_lookdown, 0.4, 0, false, false);
		animation_add(ANIM_LOOKUP, spr_tails_lookup, 0.4, 0, false, false);
		animation_add(ANIM_SPINDASH, spr_tails_spindash, 0.6, 0, true, false);
		animation_add(ANIM_SPRING, spr_tails_spring, 0.4, 0, true, false);
		animation_add(ANIM_SKID, spr_tails_skid, 0.4, 0, false, false);
		animation_add(ANIM_SKIDTURN, spr_tails_skidturn, 0.3, 0, false, false);
		animation_add(ANIM_HURT, spr_tails_hurt, 0.3, 0, false, false);
		animation_add(ANIM_DIE, spr_tails_die, 0.3, 0, false, false);
		animation_add(ANIM_TAILSFLY, spr_tails_fly, 0.3, 0, true, false);
		animation_add(ANIM_TAILSTIRED, spr_tails_tired, 0.2, 0, true, false);
		animation_add(ANIM_TAILSSWIM, spr_tails_swim, 0.3, 0, true, false);
		animation_add(ANIM_TAILSSWIMTIRED, spr_tails_swim_tired, 0.2, 0, true, false);	
		animation_add(ANIM_DROWN, spr_tails_drown, 0.3, 0, false, false);
		animation_add(ANIM_BREATHE, spr_tails_breathe, 16, 0, false, true);
		animation_add(ANIM_PUSH, spr_tails_push, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE1, spr_tails_ledge1, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE2, spr_tails_ledge2, 0.1, 0, true, false);
		animation_add(ANIM_VICTORY, spr_tails_victory, 0.1, 0, false, false);
		break;
		
		case CHAR_KNUX:
		animation_add(ANIM_STAND, spr_knuckles_idle, 0.2, 0, true, false);
		animation_add(ANIM_WAIT, spr_knuckles_wait, [60, 12], 2, true, true);
		animation_add(ANIM_WALK, spr_knuckles_walk, 3, 0, true, true);
		animation_add(ANIM_RUN, spr_knuckles_run, 0, 0, true, true);
		animation_add(ANIM_MAXRUN, spr_knuckles_maxrun, 0, 0, true, true);
		animation_add(ANIM_ROLL, spr_knuckles_roll, 0, 0, true, true);
		animation_add(ANIM_LOOKDOWN, spr_knuckles_lookdown, 0.4, 0, false, false);
		animation_add(ANIM_LOOKUP, spr_knuckles_lookup, 0.4, 0, false, false);
		animation_add(ANIM_SPINDASH, spr_knuckles_spindash, 0.6, 0, true, false);
		animation_add(ANIM_SPRING, spr_knuckles_spring, 0.4, 0, true, false);
		animation_add(ANIM_SKID, spr_knuckles_skid, 0.4, 0, false, false);
		animation_add(ANIM_SKIDTURN, spr_knuckles_skidturn, 0.3, 0, false, false);
		animation_add(ANIM_HURT, spr_knuckles_hurt, 0.3, 0, false, false);
		animation_add(ANIM_DIE, spr_knuckles_death, 0.3, 0, false, false);
		animation_add(ANIM_KNUXGLIDE, spr_knuckles_glide, 0.15, 0, true, false);
		animation_add(ANIM_KNUXGLIDETURN, spr_knuckles_turn, 0.12, 0, false, false);
		animation_add(ANIM_KNUXCLIMBUP, spr_knuckles_climb, 0.12, 0, true, false);
		animation_add(ANIM_KNUXCLIMBDOWN, spr_knuckles_climb_down, 0.12, 0, true, false);
		animation_add(ANIM_KNUXCLIMBIDLE, spr_knuckles_climb_idle, 0.12, 0, false, false);
		animation_add(ANIM_KNUXLEDGE, spr_knuckles_edge_climb, 4, 0, false, true);
		animation_add(ANIM_KNUXFALL, spr_knuckles_fall, 0.2, 0, false, false);
		animation_add(ANIM_KNUXLAND, spr_knuckles_landed, 0.2, 0, false, false);
		animation_add(ANIM_KNUXSLIDE, spr_knuckles_slide, 0.2, 0, false, false);
		animation_add(ANIM_KNUXGETUP, spr_knuckles_getup, 0.2, 0, false, false);
		animation_add(ANIM_DROWN, spr_knuckles_drown, 0.3, 0, false, false);
		animation_add(ANIM_BREATHE, spr_knuckles_breathe, 16, 0, false, true);
		animation_add(ANIM_PUSH, spr_knuckles_push, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE1, spr_knuckles_ledge1, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE2, spr_knuckles_ledge2, 0.1, 0, true, false);
		animation_add(ANIM_VICTORY, spr_knuckles_victory, 0.1, 0, false, false);
		break;
	}
}