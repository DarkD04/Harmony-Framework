function player_macros(){
	//State macros:
	#macro ST_NORMAL 0
	#macro ST_JUMP 1
	#macro ST_ROLL 2
	#macro ST_LOOKUP 3
	#macro ST_LOOKDOWN 4
	#macro ST_SPINDASH 5
	#macro ST_SKID 6
	#macro ST_KNOCKOUT 7
	#macro ST_SPRING 8
	#macro ST_PEELOUT 9
	
	//Animation macros:
	#macro ANIM_STAND 0
	#macro ANIM_WALK 1
	#macro ANIM_RUN 2
	#macro ANIM_MAXRUN 3
	#macro ANIM_ROLL 4
	#macro ANIM_LOOKUP 5
	#macro ANIM_LOOKDOWN 6
	#macro ANIM_SPINDASH 7
	#macro ANIM_SPRING 8
	#macro ANIM_SKID 9
	#macro ANIM_SKIDTURN 10
	#macro ANIM_HURT 11
	#macro ANIM_DIE 12
	
	//Shield macros
	#macro S_NONE -1
	#macro S_NORMAL 0
	#macro S_FIRE 1
	#macro S_ELECTRIC 2
	#macro S_BUBBLE 3
	
	//Misc.
	#macro K_HURT 1
	#macro K_DIE 2
}