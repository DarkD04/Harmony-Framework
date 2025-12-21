/// @description Randomized bridge segements

// Inherit the parent event
event_inherited();

// Randomized bridge segment example
for (var i = 0; i < log_amount; ++i) {
	frame[i] = irandom(sprite_get_number(sprite_index));
}
