/*
Read this. Seriously.
If you're here because of the warning, doubly so.

We have a bunch of unique stuff handled by the DB, external libraries and more.
Without this, the codebase is more-or-less unstable and shouldn't be used.
You've plenty of other codebases to pick from. Use those instead. - Carl
*/
#if !defined(CBT) && !defined(SPACEMAN_DMM)
#warn Verdant Badlands relies on external libraries.
#warn Said libraries are for consistent gameplay.
#warn This is alongside certain mechanics, which need them to function as intended.
#endif
