//Xenomorph Super - Colonial Marines - Apophis775 - Last Edit: 03JAN2015

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
	var/amount_grown = 0
	var/max_grown = 10
	var/time_of_birth
	var/language
	var/adult_form


/mob/living/carbon/Xenomorph/New()

	time_of_birth = world.time

	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

	var/datum/reagents/R = new/datum/reagents(100)
	reagents = R
	R.my_atom = src

	name = "[initial(name)] ([rand(1, 1000)])"
	real_name = name
	regenerate_icons()

	if(language)
		add_language(language)

	gender = NEUTER

	..()

/mob/living/carbon/Xenomorph/u_equip(obj/item/W as obj)
	return

/mob/living/carbon/Xenomorph/Stat()
	..()
	stat(null, "Progress: [amount_grown]/[max_grown]")

/mob/living/carbon/Xenomorph/restrained()
	return 0

/mob/living/carbon/Xenomorph/show_inv(mob/user as mob)
	return

/mob/living/carbon/Xenomorph/can_use_vents()
	return