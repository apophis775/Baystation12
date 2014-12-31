//Xenomorph - Larva Super - Colonial Marines - Apophis775 - Last Edit: 30DEC2014

/mob/living/carbon/Xenomorph/larva
	name = "Alien Larva"
	real_name = "Alien Larva"
	adult_form = /mob/living/carbon/human
	speak_emote = list("hisses")
	icon = 'icons/xeno/Colonial_Aliens1x1.dmi'
	caste = "Bloody Larva"
	icon_state = "Bloody Larva"
	language = "Hivemind"
	amountGrown = 0
	max_Grown = 200
	maxHealth = 25
	Health = 25


/mob/living/carbon/Xenomorph/larva/New()
	..()
	add_language("Xenomorph") //Bonus language.
	internal_organs += new /datum/organ/internal/xenos/hivenode(src)