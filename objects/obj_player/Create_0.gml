/// @description Values
	character = global.character;		//Character variable
	
	//Movement values:
	x_speed = 0;						//Horizontal speed movement
	y_speed = 0;						//Vertical speed movement
	ground_speed = 0;					//Speed for ground movement
	ground_angle = 0;					//Value for floor angle
	mode = CMODE_FLOOR;					//Floor mode value for ground movement
	x_dir = 0;							//Multiplier for horizontal ground movement
	y_dir = 1;							//Multiplier for vertical ground movement
	steps = 1;							//Variable used for precise collision
	control_lock = 0;					//Timer used for locking controls when you're on steep slopes
	ceiling_landing = 0;				//Ceiling landing state machine
	plane = PLANE_A;					//Collision planes/layers
	floor_delay = 0;					//Delay timer for when player changes floor mode, hacky fix for jittery mode changes
	reach_range = 16;					//Range of how much angle sensors can go below floor checks
	ceiling_lock = 0;					//Timer used for locking ceiling landing, hacky fix for collision bugs
	facing = 1;							//Player's facing direction
	
	//Physics values
	x_accel = 0.046875;					//Value used for player's horizontal acceleration
	y_accel = 0.21875;					//Value used for player's vertical acceleration, specifically gravirt
	friction_speed = 0.046875;			//Value used for player's friction when input is not being held
	top_speed = 6;						//Value used for player's top running speed
	max_speed = 24;						//Player's horizontal speed cap
	jump_strength = 6.5;				//Value used for player's jump strength 
	jump_release = 4;					//Value used for speed when player releases the jump button
	roll_influence_up = 0.078125;		//Value that influences rolling up slopes
	roll_influence_down = 0.3125;		//Value that influences rolling down slopes
	roll_speed_cap = 18;				//Value for rolling's maximum speed
	
	//State related values:
	state = ST_NORMAL;					//Player's state machine
	spindash_rev = 0;					//Spindash charge value
	skid_timer = 0;						//Timer that is used to cancel the skid when input is not being held
	dropdash_timer = 0;					//Dropdash charge delay timer
	death_timer = 0;					//Timer for player's death
	knockout_type = 0;					//Knockout state machine
	jump_flag = false;					//Check for releasing low jump
	direction_allow = true;				//Flag used for allowing player to change directions
	movement_allow = true;				//Flag used for allowing movement
	attacking = false;					//Check used for when sonic is in attacking state or not
	air = 0;							//Used for underwater timer for drowning
	hurt_position = 0;					//Horizontal position of hazard that player has touched
	spindash_pitch = 0;					//Separate rev value used for spindash pitch
	idle_timer = 0;						//Timer used for idle animation
	spindash_dust_frames = 0;			//Used to animate spindash dust frame
	
	//Check variables:
	ground = true;						//Check used to check if player is on ground or not
	landed = false;						//Check if player has landed
	debug = false;						//Check if player is in debug mode or not
	on_edge = false;					//Check used when angle is out of tolerance range on the ledges
	on_object = false;					//Check for if player is on object
	platform_check = true;				//Check if player is inside of a semi solid
	touching_ceiling = false;			//Check if player is inside of a ceiling
	underwater = false;					//Check if player is underwater or not
	is_time_over = false;				//Check if player died from time over
	ground_push_flag = true;			//Check used when angle is out of tolerance range on the ledges, this disables push out of the ground
	can_jump = false;					//Check used for if player is able to perform a jump
	can_roll = false;					//Check used for if player is able to perform rolling
	
	//Flags:
	ceiling_allow = true;				//Flag for allowing ceiling landing
	detach_allow = true;				//Flag used to allow detaching off the ground or not
	collision_allow = true;				//Flag used to allow solid collision or not
	gravity_allow = true;				//Flag used to allow gravity on player
	force_roll = false;					//Flag used to set the player into forced roll state, which is used for S-Tubes
	input_disable = false;				//Flag used for disabling player input
	hitbox_allow = true;				//Flag used for allowing hitbox collision between player and other objects
	flag_override = true;				//This is used to prevent flags from being override in player state list script when false
	
	//Hitbox values:
	hitbox_w = 9;						//Hitbox width variable
	hitbox_h = 19;						//Hitbox height variable
	wall_w = 10;						//Horizontal wall radius
	wall_h = 0;							//Vertical wall radius
	
	//Timers and physics modifiers
	speed_shoes = 0;					//Timer used for speedshoes
	speed_shoes_flag = false;			//Check used to check if player has speed shoes or not
	invincible_timer = 0;				//Timer used for invincibility
	invincible = false;					//Check used to check if player has invincibility or not
	
	//Character specifics:
	tails_timer = 480;					//Timer used for tails flight
	knuckles_angle = 90;				//Knuckles' gliding angle
	glide_speed = 2.5;					//Knuckles' glide speed
	
	//Visuals:
	animator = new animator_create();	//Create new animator
	visual_angle = 0;					//Used for rotation of the player's sprite
	jump_anim_speed = 0;				//Animation speed variable that is set when sonic jumps
	start_depth = depth;				//Starting depth when object has been created
	
	//Shields:
	shield = S_NONE;					//Shield that player is currently using
	shield_list = [obj_shield, obj_fire_shield, obj_electric_shield, obj_bubble_shield];	//The shield list
	
	//Hitbox variables
	hitbox_top_offset = 0;				//Hitbox offset of the top side
	hitbox_left_offset = 0;				//Hitbox offset of the left side
	hitbox_bottom_offset = 0;			//Hitbox offset of the bottom side
	hitbox_right_offset = 0;			//Hitbox offset of the right side
	
	//Normal hitbox unique to each character
	hitbox_normal =
	[
		[9, 19],	//Sonic's hitbox
		[9, 15],	//Tails' hitbox
		[9, 19]		//Knuckles' hitbox
	]
	
	//Rolling hitbox unique to each character
	hitbox_rolling =
	[
		[7, 14],	//Sonic's hitbox
		[7, 14],	//Tails' hitbox
		[7, 14]		//Knuckles' hitbox
	]
	
	//Camera rolling offset unique to each character
	camera_rolling_offset = [5, 1, 5];
	
	//Setup scripts
	player_recorder_setup();			//Setup player visuals recorder
	player_get_input();					//Setup player inputs
	player_animation_list();			//Initilize the animation list
	
	//Create important objects:
	instance_create_depth(0, 0, 0, obj_camera);		//Create the camera object
	
	//Disable title card input
	if(instance_exists(obj_titlecard)) 
	{
		input_disable = true;
	}