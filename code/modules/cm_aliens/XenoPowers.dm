//Xenomorph Super - Colonial Marines - Apophis775 - Last Edit: 8FEB2015


//Xeno Powerchecker Parts of it stolen from old Bay...


/mob/living/carbon/Xenomorph/proc/powerc(X, Y) //Y Y is for weed planting

	if(stat)
		src << "\red Can't do this while unconcious."
		return 0
	else if(X && checkPlasma() <X)
		src << "\red Not enough plasma,try again later"
		return 0
	else if(Y && (!isturf(src.loc) || istype(src.loc, /turf/space)))
		src << "\green Bad place for a garden!"
	else
		return 1

//Xeno Powers


//Drone Verbs


//Queen Verbs


//Runner Verbs

/mob/living/carbon/Xenomorph/Runner/verb/Pounce()
	set name = "Pounce (25)"
	set desc = "Pounce onto your prey."
	set category = "Alien"


	if(usedPounce >= 1)
		src << "\red We must wait before pouncing again.."
		return

	if(powerc(25))
		var/targets[] = list()
		for(var/mob/living/carbon/human/M in oview())
			if(M.stat)	continue//Doesn't target corpses or paralyzed persons.
			targets.Add(M)

		if(targets.len)
			var/mob/living/carbon/human/target=pick(targets)
			var/atom/targloc = get_turf(target)
			if (!targloc || !istype(targloc, /turf) || get_dist(src.loc,targloc)>=3)
				src << "We cannot reach our prey!"
				return
			if(src.weakened >= 1 || src.paralysis >= 1 || src.stunned >= 1)
				src << "We cannot pounce if we are stunned.."
				return

			visible_message("\red <B>[src] pounces on [target]!</B>")
			if(src.m_intent == "walk")
				src.m_intent = "run"
				src.hud_used.move_intent.icon_state = "running"
			src.loc = targloc
			usedPounce = 5
			adjustToxLoss(-50)
			if(target.r_hand && istype(target.r_hand, /obj/item/weapon/shield/riot) || target.l_hand && istype(target.l_hand, /obj/item/weapon/shield/riot))
				if (prob(35))	// If the human has riot shield in his hand
					src.weakened = 5//Stun the fucker instead
					visible_message("\red <B>[target] blocked [src] with his shield!</B>")
				else
					src.canmove = 0
					src.frozen = 1
					target.Weaken(2)
					spawn(15)
						src.frozen = 0
			else
				src.canmove = 0
				src.frozen = 1
				target.Weaken(2)

			spawn(15)
				src.frozen = 0
		else
			src << "\red We sense no prey.."

	return