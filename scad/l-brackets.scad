// l brackets:
// - single: https://www.makerstore.com.au/product/universal-l-brackets-single/
// - double: https://www.makerstore.com.au/product/universal-l-brackets-double/
// - triple: https://www.makerstore.com.au/product/universal-l-brackets-triple/

function l_bracket_length(type) = type[2];
function l_bracket_height(type) = type[3];
function l_bracket_width(type) = type[4];
function l_bracket_thickness(type) = type[5];
function l_bracket_lengthwise_hole_positions_list(type) = type[6];
function l_bracket_heightwise_hole_positions_list(type) = type[7];
function l_bracket_offset(type) = type[8];
function l_bracket_screw_type(type) = type[9];
function l_bracket_tnut(type) = type[10];
function l_bracket_nut_type(type) = type[11];

function l_bracket_hole_radius(type) = screw_clearance_radius(l_bracket_screw_type(type));

lb_single = [
  "Single",
  "Single L Bracket",
  20,
  20,
  14.50,
  3,
  [[15, 7.25]],
  [[10, 7.25]],
  [0, 2.75],
  M5_cap_screw,
  M5_sliding_t_nut,
  M5_nut,
];

lb_double = [
  "Double",
  "Double L Bracket",
  20,
  20,
  38,
  3,
  [[15, 9], [15, 29]],
  [[10, 9], [10, 29]],
  [0, 1],
  M5_cap_screw,
  M5_sliding_t_nut,
  M5_nut,
];

lb_triple = [
  "Triple",
  "Triple L Bracket",
  20,
  20,
  59.60,
  3,
  [[15, 9.8], [15, 29.8], [15, 49.8]],
  [[10, 9.8], [10, 29.8], [10, 49.8]],
  [15, 9.8],
  [0, 0.2],
  M5_cap_screw,
  M5_sliding_t_nut,
  M5_nut,
];

module l_bracket(type) {
  vitamin(str("L Bracket(", type[0], "): ", type[1]));
  
  translate(l_bracket_offset(type))
  difference() {
    union() {
      cube([
        l_bracket_length(type),
        l_bracket_width(type),
        l_bracket_thickness(type),
      ]);
      cube([
        l_bracket_thickness(type),
        l_bracket_width(type),
        l_bracket_height(type),
      ]);
    }

    l_bracket_hole_positions(type)
      translate([0, 0, -eps])
      cylinder(r = l_bracket_hole_radius(type), h = inf);
  }
}

module l_bracket_hole_positions(type) {
  l_bracket_lengthwise_hole_positions(type)
    children();

  l_bracket_heightwise_hole_positions(type)
    children();
}

module l_bracket_lengthwise_hole_positions(type) {
  for (position = l_bracket_lengthwise_hole_positions_list(type)) {
    translate(position)
      children();
  }
}

module l_bracket_heightwise_hole_positions(type) {
  for (position = l_bracket_heightwise_hole_positions_list(type)) {
    mirror([1, 0, 0])
    rotate([0, -90, 0])
    translate(position)
      children();
  }
}

module l_bracket_screws(type) {
  l_bracket_hole_positions(type)
    screw(l_bracket_screw_type(type), l_bracket_thickness(type) + 5);
}

module l_bracket_tnuts(type) {
  l_bracket_hole_positions(type)
    translate([0, 0, -2])
    mirror([0, 0, 1])
    sliding_t_nut(l_bracket_tnut(type));
}

