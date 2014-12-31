//Xenomorph Super - Colonial Marines - Apophis775 - Last Edit: 30DEC2014

/mob/living/carbon/Xenomorph
	var/caste = ""
	name = "Drone"
	desc = "What IS that?"
	icon = 'icons/xeno/Colonial_Aliens1x1.dmi'
	icon_state = "Drone Walking"
	pass_flags = PASSTABLE
	melee_damage_lower = 1
	melee_damage_upper = 3
	attacktext = "Bites"
	attack_sound = null
	friendly = "Nuzzles"
	wall_smash = 0
	health = 100
	maxHealth = 100