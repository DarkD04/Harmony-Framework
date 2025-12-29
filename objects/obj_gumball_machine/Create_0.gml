y_speed = 0
y_accel = 0.21875 * 0.75
lid_frame_count = sprite_get_number(spr_machine_lid) - 1
lid_frame = lid_frame_count
lid_timer = 0
handle_rot = 0
handle_timer = 0
handle_dir = 1

depth = obj_player.depth + 10

gumball_pool = [
GUMBALL.BUBBLE,GUMBALL.BUBBLE,GUMBALL.BUBBLE,GUMBALL.BUBBLE,
GUMBALL.BUMPER,GUMBALL.BUMPER,GUMBALL.BUMPER,GUMBALL.BUMPER,
GUMBALL.RINGS,GUMBALL.RINGS,GUMBALL.RINGS,
GUMBALL.NORMAL,GUMBALL.NORMAL,
GUMBALL.AQUA,GUMBALL.AQUA,
GUMBALL.FLAME,GUMBALL.FLAME,
GUMBALL.ELECTRIC,GUMBALL.ELECTRIC,
GUMBALL.ONEUP,GUMBALL.REPOSITION
]

lid = instance_create_depth(x,y,depth - 2, obj_gumball_lid)
lid.image_speed = 0
handle = instance_create_depth(x,y,depth - 3, obj_gumball_handle)