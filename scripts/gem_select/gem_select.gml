/// @function script()
/// @description default
/// @param {type} param first parameter
function gem_select(gem){
	gem1 = gem
	with(gem) spin()
	xlimprevious = xlim
	ylimprevious = ylim
	xlim = gem._j
	ylim = gem.i_limit
}