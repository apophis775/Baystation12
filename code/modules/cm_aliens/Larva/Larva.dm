//Xenomorph - Larva - Colonial Marines - Apophis775 - Last Edit: 03JAN2014

/mob/living/carbon/Xenomorph/larva
	name = "Alien Larva"
	real_name = "Alien Larva"
	speak_emote = list("hisses")
	icon = 'icons/xeno/Colonial_Aliens1x1.dmi'
	caste = "Bloody Larva"
	icon_state = "Bloody Larva"
	language = "Hivemind"
	amount_grown = 0
	max_grown = 200
	maxHealth = 25
	health = 25


/mob/living/carbon/Xenomorph/larva/New()
	..()
	add_language("Xenomorph") //Bonus language.
	internal_organs += new /datum/organ/internal/xenos/hivenode(src)

/mob/living/carbon/alien/Xenomorph/handle_environment(var/datum/gas_mixture/environment)

	if(!environment) return

	var/turf/T = get_turf(src)
	if(environment.gas["phoron"] > 0 || (T && locate(/obj/effect/alien/weeds) in T.contents))
		update_progression()
		adjustBruteLoss(-1)
		adjustFireLoss(-1)
		adjustToxLoss(-1)
		adjustOxyLoss(-1)