//
// NopSCADlib Copyright Chris Palmer 2018
// GridBot Copyright Michael Williams 2021
//
// This file is licensed under the GPL-3.0 license, as with NopSCADlib.
//
// NopSCADlib is free software: you can redistribute it and/or modify it under the terms of the
// GNU General Public License as published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// NopSCADlib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with NopSCADlib.
// If not, see <https://www.gnu.org/licenses/>.
//

//! A simple machine to automate grid beam production.
//!
//! Where possible, we use easy-to-source OpenBuilds components (e.g. [MakerStore](https://www.makerstore.com.au/), [BulkMan 3D](https://bulkman3d.com/)) or other readily available standardized parts, following inspiration from open source "pro" consumer CNC machines.

EPS = 0.001;

include <NopSCADlib/lib.scad> 

// ball bearings
BB688ZZ =  ["688ZZ", 8,  16,  5,   "silver",    1.5, 1.5];

// rail carriages
//                     L     L1    W   H   H1   C   B
// HGH20HA_carriage  = [ 92.2, 65.2, 44, 30, 4.6, 50,  32, M5_cap_screw, HGH20CA ];

// shaft_couplings
//                                       L   D       d1   d2
SC_635x8_rigid  = [ "SC_635x8_rigid",    25, 12.5, 6.35,   8 ];

// $show_threads = true;

length_axis_sheet_type = AL6;
length_axis_extrusion_type = E2080;
length_axis_length = 1500;
length_axis_rail_type = HGH20CA;
length_axis_rail_carriage_type = HGH20CA_carriage;
length_axis_rail_t_nut = M5_sliding_t_nut;
length_axis_motor_NEMA_type = NEMA23_51;
length_axis_gear_module = 1;
length_axis_gear_pressure_angle = 20;
length_axis_gear_pinion_teeth = 14;
length_axis_gear_rack_length = 500;

width_axis_sheet_type = AL6;
width_axis_travel_distance = 100;
width_axis_leadscrew_diameter = 8;
width_axis_leadscrew_lead = 8;
width_axis_leadscrew_starts = 4;
width_axis_leadscrew_nut = SFU1610;
width_axis_rail_type = HGH15CA;
width_axis_carriage_type = HGH15CA_carriage;
width_axis_motor_NEMA_type = NEMA23_51;
width_axis_motor_coupling_type = SC_635x8_rigid;

spindle_sheet_type = AL6;
spindle_motor_NEMA_type = NEMA23_51;

//! A plate to connect the length-axis components, which connects to the width-axis mount plate.
module length_axis_plate_dxf() {
  dxf("length_axis_plate");
}

module length_axis_rail() {
  translate([
    (1/2) * length_axis_length,
    0,
    (1/2) * (extrusion_width(length_axis_extrusion_type) + rail_height(length_axis_rail_type))
  ])
  union() {
    rail_assembly(length_axis_rail_carriage_type, length_axis_length, 0);
    
    echo(rail_screw_height(length_axis_rail_type, rail_screw(length_axis_rail_type)));

    rail_screws(length_axis_rail_type, length_axis_length, 4);

    translate([0, 0, -nut_square_thickness(length_axis_rail_t_nut)])
    rail_hole_positions(length_axis_rail_type, length_axis_length)
      sliding_t_nut(length_axis_rail_t_nut);
  }
}


//! This assembly is for the axis that will travel along the length of the grid beam.
module length_axis_assembly()
assembly("length_axis") {
  // frame
  translate([
    (1/2) * length_axis_length,
    (1/2) * extrusion_height(length_axis_extrusion_type),
    (1/2) * extrusion_width(length_axis_extrusion_type)
  ])
  rotate([0, 90, 0])
  extrusion(length_axis_extrusion_type, length_axis_length);

  // rail #1
  translate([0, 10, 0])
  length_axis_rail();

  // rail #2
  translate([0, 70, 0])
  length_axis_rail();
}

//! A plate mount for the width-axis, which connects to the length-axis.
module width_axis_plate_dxf() {
  dxf("width_axis_plate");

}

//! This assembly is for the axis that will travel perpendicular to the length of the grid beam (i.e. along the width of the grid beam).
module width_axis_assembly()
assembly("width_axis") {

}

//! A plate to connect the spindle components, which connects to the width-axis.
module spindle_plate_dxf() {
  dxf("spindle_plate");

}

//! This assembly is for a spindle and motor connected via gears.
//!
//! - Spindle: [ER20 Spindle Head for Drilling](https://www.aliexpress.com/item/1005001278002287.html)
//! - Motor: [iHSV57-180 Nema23 180W Integrated Servo Motor](https://www.makerstore.com.au/product/elec-ihsv57-180/)
module spindle_assembly()
assembly("spindle") {
}

//! This assembly is to hold the workpiece: the grid beam.
module workholding_assembly()
assembly("workholding") {

}

//! Main assembly
module main_assembly()
assembly("main") {
  length_axis_assembly();
  width_axis_assembly();
  spindle_assembly();
  workholding_assembly();
}

if($preview)
  main_assembly();
