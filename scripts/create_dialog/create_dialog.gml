/// @function script()
/// @description default
/// @param {type} param first parameter
function create_dialog(description, func) {
	var d = instance_create(0,0,obj_dialog)
	d.description = description
	d.enter_function = func
	return d;
}