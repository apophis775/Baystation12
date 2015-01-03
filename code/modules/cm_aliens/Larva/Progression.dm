//Xenomorph Larva Progression - Colonial Marines - Apophis775 - Last Edit: 03JAN2014
/mob/living/carbon/Xenomorph/larva/update_progression()
	if(amount_grown < max_grown)
		amount_grown++
	return

/mob/living/carbon/Xenomorph/larva/confirm_evolution()

	src << "\blue <b>You are growing into a beautiful alien! It is time to choose a caste.</b>"
	src << "\blue There are three to choose from:"
	src << "<B>Hunters</B> \blue are strong and agile, able to hunt away from the hive and rapidly move through ventilation shafts. Hunters generate plasma slowly and have low reserves."
	src << "<B>Sentinels</B> \blue are tasked with protecting the hive and are deadly up close and at a range. They are not as physically imposing nor fast as the hunters."
	src << "<B>Drones</B> \blue are the working class, offering the largest plasma storage and generation. They are the only caste which may evolve again, turning into the dreaded alien queen."
	caste = alert(src, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")
	return caste ? "Xenomorph [caste]" : null

/mob/living/carbon/alien/Xenomorph/show_evolution_blurb()
	return