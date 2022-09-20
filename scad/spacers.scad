// https://www.makerstore.com.au/product/metric-aluminum-spacers/

function spacer_inner_diameter(type) = type[2];
function spacer_outer_diameter(type) = type[3];
function spacer_length(type) = type[4];

spacer_M5_3 = [
  "M5 x 10 x 3mm",
  "M5 x 10 x 3mm Spacer",
  5,
  10,
  3,
];
spacer_M5_6 = [
  "M5 x 10 x 6mm",
  "M5 x 10 x 6mm Spacer",
  5,
  10,
  6,
];
spacer_M5_6p5 = [
  "M5 x 10 x 6.5mm",
  "M5 x 10 x 6.5mm Spacer",
  5,
  10,
  6.5,
];
spacer_M5_9 = [
  "M5 x 10 x 9mm",
  "M5 x 10 x 9mm Spacer",
  5,
  10,
  9,
];
spacer_M5_10 = [
  "M5 x 10 x 10mm",
  "M5 x 10 x 10mm Spacer",
  5,
  10,
  10,
];
spacer_M5_20 = [
  "M5 x 10 x 20mm",
  "M5 x 10 x 20mm Spacer",
  5,
  10,
  20,
];
spacer_M5_30 = [
  "M5 x 10 x 30mm",
  "M5 x 10 x 30mm Spacer",
  5,
  10,
  30,
];
spacer_M5_35 = [
  "M5 x 10 x 35mm",
  "M5 x 10 x 35mm Spacer",
  5,
  10,
  35,
];
spacer_M5_40 = [
  "M5 x 10 x 40mm",
  "M5 x 10 x 40mm Spacer",
  5,
  10,
  40,
];

module spacer(type) {
  translate([0, 0, (1/2) * spacer_length(type)])
  tube(
    or = (1/2) * spacer_outer_diameter(type),
    ir = (1/2) * spacer_inner_diameter(type),
    h = spacer_length(type),
    center = true
  );
}
