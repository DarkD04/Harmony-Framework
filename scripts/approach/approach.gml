function approach(val, target, steps) {
	// Moves from start, to end at the rate of step.
	if(val < target)
		return min(val + steps, target);
	else
		return max(val - steps, target);
}
