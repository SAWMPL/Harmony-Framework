	with(obj_level)
	{
		//Set stage music and pitch values
		stage_music = BGM_ARBOREAL_2;
		stage_pitch = 1.00;
		stage_speedshoes_pitch = 1.25;
		
		//Set level name
		stage_name = "ARBOREAL AGATE";
		
		//Set stage act
		act = 2;
		
		//Is next level doing act transition
		act_transition = false;
		
		//Animal array
		animal = [A_FLICKY, A_CUCKY, A_RICKY];
		
		//Next level
		next_level = room;
	}