enum BUMPERANI{
	STOPPED,
	BUMP
};
score_life = 16;

#macro BUMPER_FACTOR 7

animator = new animator_create();
animation_add(BUMPERANI.STOPPED, spr_bumper, 1);
animation_add(BUMPERANI.BUMP, spr_bumper_bumped, 0.5);