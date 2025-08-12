function string_explode(string_to_explode) {
  var character_count = string_length(string_to_explode);
  return array_create_ext(character_count, method({string_to_explode}, function(character_index) {
    return string_char_at(string_to_explode, character_index + 1);
  }));
}