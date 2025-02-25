function wrap(val, minimum, maximum)
{
	if(val < minimum)
	{
		return maximum;	
	}
	
	if(val > maximum)
	{
		return minimum;	
	}
	
	return val;
}

