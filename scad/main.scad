//! Grid Bot

include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/extrusions.scad>

//                Wr  Hr    E     P   D    d    h                                       go?   gw?
HGH20= [ "HGH20", 20, 17.5, 20,   60, 9.5, 6, 8.5, M5_cap_screw,    M5_cs_cap_screw,  5,  5.5 ];
//                     L     L1    W   H   H1   C   B
HGH20CA_carriage  = [ 77.5, 50.5, 44, 30, 4.6, 36,  32, M5_cap_screw, HGH20 ];
HGH20HA_carriage  = [ 92.2, 65.2, 44, 30, 4.6, 50,  32, M5_cap_screw, HGH20 ];

use <NopSCADlib/vitamins/rail.scad>
use <NopSCADlib/vitamins/extrusion.scad>

beam_width = 40;

//! Y-Axis assembly
module y_axis_assembly()
assembly("y-axis") {
  x_length = 2400;
  y_length = 300;
  travel_distance = 600;

  // extrusion: y-length, at x-start
  translate([beam_width, y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, y_length, cornerHole = true);

  // extrusion: y-length, at x-end
  translate([x_length - beam_width, y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, y_length, cornerHole = true);

  // extrusion: x-length, at y-start
  translate([x_length / 2, beam_width, (3 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_length, cornerHole = true);

  // extrusion: x-length, at y-end
  translate([x_length / 2, beam_width + y_length - 2 * beam_width, (3 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_length, cornerHole = true);

  // rail: x-start, y-start
  translate([(1 / 2) * travel_distance, (1 / 2) * beam_width, 2 * beam_width])
  rail(HGH20, travel_distance);

  // rail: x-start, y-end
  translate([(1 / 2) * travel_distance, y_length - (1 / 2) * beam_width, 2 * beam_width])
  rail(HGH20, travel_distance);

  // rail: x-end, y-start
  translate([x_length - (1 / 2) * travel_distance, (1 / 2) * beam_width, 2 * beam_width])
  rail(HGH20, travel_distance);

  // rail: x-end, y-end
  translate([x_length - (1 / 2) * travel_distance, y_length - (1 / 2) * beam_width, 2 * beam_width])
  rail(HGH20, travel_distance);
}

//! Main assembly
module main_assembly()
assembly("main") {
  y_axis_assembly();
}

if($preview)
  main_assembly();
