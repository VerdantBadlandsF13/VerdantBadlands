/// Called on [/mob/living/Initialize()], for the mob to register to relevant signals.
/mob/living/proc/register_init_signals()
	RegisterSignal(src, SIGNAL_ADDTRAIT(TRAIT_KNOCKEDOUT), PROC_REF(on_knockedout_trait_gain))
	RegisterSignal(src, SIGNAL_REMOVETRAIT(TRAIT_KNOCKEDOUT), PROC_REF(on_knockedout_trait_loss))

	RegisterSignal(src, SIGNAL_ADDTRAIT(TRAIT_FORCED_STANDING), PROC_REF(on_forced_standing_trait_gain))
	RegisterSignal(src, SIGNAL_REMOVETRAIT(TRAIT_FORCED_STANDING), PROC_REF(on_forced_standing_trait_loss))

/// Called when [TRAIT_KNOCKEDOUT] is added to the mob.
/mob/living/proc/on_knockedout_trait_gain(datum/source)
	SIGNAL_HANDLER
	if(stat < UNCONSCIOUS)
		set_stat(UNCONSCIOUS)

/// Called when [TRAIT_KNOCKEDOUT] is removed from the mob.
/mob/living/proc/on_knockedout_trait_loss(datum/source)
	SIGNAL_HANDLER
	if(stat <= UNCONSCIOUS)
		update_stat()

/// Called when [TRAIT_FORCED_STANDING] is added to the mob.
/mob/living/proc/on_forced_standing_trait_gain(datum/source)
	SIGNAL_HANDLER
	set_resting(FALSE)

/// Called when [TRAIT_FORCED_STANDING] is removed from the mob.
/mob/living/proc/on_forced_standing_trait_loss(datum/source)
	SIGNAL_HANDLER
	set_resting(FALSE)
