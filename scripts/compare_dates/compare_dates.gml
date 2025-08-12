/// @function compare_dates(date1, date2)
/// @description Returns true if date1 is bigger than date2
/// @param {string} date1 date string like '3-10-25'
/// @param {string} date2 date string like '3-10-25'
function compare_dates(date1, date2){
	var date1_array = string_split(date1, "-")
	var date2_array = string_split(date2, "-")
	if (array_length(date1_array) < 3 || array_length(date2_array) < 3) return false
	var date1_years = real(date1_array[2])
	var date1_months = real(date1_array[1])
	var date1_days = real(date1_array[0])
	
	var date2_years = real(date2_array[2])
	var date2_months = real(date2_array[1])
	var date2_days = real(date2_array[0])
	
	if (date1_years == date2_years) {
		if (date1_months == date2_months) {
			if (date1_days == date2_days) return false;
			return (date1_days > date2_days);
		}
		return (date1_months > date2_months);
	}
	return (date1_years > date2_years);
}