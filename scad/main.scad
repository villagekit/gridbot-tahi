//
// NopSCADlib: Copyright Chris Palmer 2018
// GridBot: Copyright Village Kit Limited 2022
//
// This file is licensed under the GPL-3.0 license, as with NopSCADlib.

//! A simple open source machine for automated [grid beam](https://gridbeam.xyz) production.
//!
//! Where possible, uses easy-to-source OpenBuilds components (e.g. [MakerStore](https://www.makerstore.com.au/), [BulkMan 3D](https://bulkman3d.com/)) or other readily available standardized parts, following inspiration from open source "pro" consumer CNC machines.
//!
//! One spindle, two axis of motion (beam-length and beam-width).
//!
//! Hardware design assets and documentation licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), `.scad` files licensed under GPL-3.0 (as with NopSCADlib).

EPS = 0.001;

include <NopSCADlib/lib.scad> 

include <./lib.scad>

// $show_threads = true;

length_axis_extrusion_type = E2080;
length_axis_length = 1500;
length_axis_rail_type = HGH15CA;
length_axis_rail_carriage_type = HGH15CA_carriage;
length_axis_rail_carriage_spacing = 5;
length_axis_rail_carriage_pos = 0;
length_axis_rail_t_nut = M5_sliding_t_nut;
length_axis_plate_sheet_type = AL6;
length_axis_plate_carriage_overhang = (1/2) * (carriage_width(length_axis_rail_carriage_type) - 20);
length_axis_plate_join_screw = M5_cap_screw;
length_axis_plate_join_margin = washer_diameter(screw_washer(length_axis_plate_join_screw));
length_axis_plate_overhang_x_plus = 2 * length_axis_plate_join_margin;
length_axis_plate_overhang_x_minus = 30;
length_axis_plate_size = [
    // length_axis_rail_carriage_spacing + 2 * carriage_length(length_axis_rail_carriage_type),
    100 + 4 * length_axis_plate_join_margin,
    80 + 2 * length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus + length_axis_plate_overhang_x_minus
  ];
length_axis_plate_offset = [
    0,
    (1/2) * length_axis_plate_size[1] - length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus
  ];
length_axis_motor_NEMA_type = NEMA23_51;
length_axis_gear_module = 1;
length_axis_gear_pressure_angle = 20;
length_axis_gear_pinion_teeth = 14;
length_axis_gear_rack_length = 500;
length_axis_offset = [0, 0, 0];

gear_rack_motor_mount_plate_sheet_type = AL10;

width_axis_plate_sheet_type = AL6;
width_axis_extrusion_type = E20100;
width_axis_travel_distance = 100;
width_axis_leadscrew_diameter = 8;
width_axis_leadscrew_lead = 8;
width_axis_leadscrew_starts = 4;
width_axis_leadscrew_nut = SFU1610;
width_axis_rail_type = HGH15CA;
width_axis_carriage_type = HGH15CA_carriage;
width_axis_motor_NEMA_type = NEMA23_51;
width_axis_motor_coupling_type = SC_635x8_rigid;
width_axis_offset = [
  length_axis_offset[0],
  length_axis_offset[1] + 0,
  length_axis_offset[2] + extrusion_width(length_axis_extrusion_type) + carriage_height(length_axis_rail_carriage_type) + sheet_thickness(length_axis_plate_sheet_type)
];

spindle_plate_sheet_type = AL6;
spindle_motor_NEMA_type = NEMA23_51;

//! A plate to connect the length-axis components, which connects to the width-axis mount plate.
module length_axis_plate_dxf() {
  dxf("length_axis_plate");

  difference() {
    translate(length_axis_plate_offset)
      sheet_2D(length_axis_plate_sheet_type, length_axis_plate_size[0], length_axis_plate_size[1], 2);

    // length-axis rail #1, carriage #1
    translate([(1/2) * length_axis_rail_carriage_spacing + (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 10])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(r = screw_clearance_radius(carriage_screw(length_axis_rail_carriage_type)));

    // length-axis rail #1, carriage #2
    translate([-(1/2) * length_axis_rail_carriage_spacing - (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 10])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(r = screw_clearance_radius(carriage_screw(length_axis_rail_carriage_type)));

    // length-axis rail #2, carriage #1
    translate([(1/2) * length_axis_rail_carriage_spacing + (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 70])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(r = screw_clearance_radius(carriage_screw(length_axis_rail_carriage_type)));

    // length-axis rail #2, carriage #2
    translate([-(1/2) * length_axis_rail_carriage_spacing - (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 70])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(r = screw_clearance_radius(carriage_screw(length_axis_rail_carriage_type)));

    // width-axis extrusion join #1
    translate([40, 40])
      circle(d = screw_boss_diameter(length_axis_plate_join_screw));

    // width-axis extrusion join #2
    translate([-40, 40])
      circle(d = screw_boss_diameter(length_axis_plate_join_screw));

    // width-axis extrusion join #3
    translate([0, 80 + length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus - length_axis_plate_join_margin])
      circle(d = screw_boss_diameter(length_axis_plate_join_screw));

    // width-axis extrusion join #4
    translate([0, -length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus + length_axis_plate_join_margin])
      circle(d = screw_boss_diameter(length_axis_plate_join_screw));


    // inter-plate join #1
    translate([(1/2) * length_axis_plate_size[0] - length_axis_plate_join_margin, 80 + length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus - length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #2
    translate([-(1/2) * length_axis_plate_size[0] + length_axis_plate_join_margin, 80 + length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus - length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #3
    translate([(1/2) * length_axis_plate_size[0] - length_axis_plate_join_margin, -length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus + length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #4
    translate([-(1/2) * length_axis_plate_size[0] + length_axis_plate_join_margin, -length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus + length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));
  }
}

//! A plate mount for the width-axis, which connects to the length-axis.
module width_axis_plate_dxf() {
  dxf("width_axis_plate");

  difference() {
    translate(length_axis_plate_offset)
      sheet_2D(width_axis_plate_sheet_type, length_axis_plate_size[0], length_axis_plate_size[1], 2);

    // length-axis rail #1, carriage #1
    translate([(1/2) * length_axis_rail_carriage_spacing + (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 10])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(d = screw_boss_diameter(carriage_screw(length_axis_rail_carriage_type)));

    // length-axis rail #1, carriage #2
    translate([-(1/2) * length_axis_rail_carriage_spacing - (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 10])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(d = screw_boss_diameter(carriage_screw(length_axis_rail_carriage_type)));

    // length-axis rail #2, carriage #1
    translate([(1/2) * length_axis_rail_carriage_spacing + (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 70])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(d = screw_boss_diameter(carriage_screw(length_axis_rail_carriage_type)));

    // length-axis rail #2, carriage #2
    translate([-(1/2) * length_axis_rail_carriage_spacing - (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 70])
    carriage_hole_positions(length_axis_rail_carriage_type)
      circle(d = screw_boss_diameter(carriage_screw(length_axis_rail_carriage_type)));

    // width-axis extrusion join #1
    translate([40, 40])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // width-axis extrusion join #2
    translate([-40, 40])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // width-axis extrusion join #3
    translate([0, 80 + length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus - length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // width-axis extrusion join #4
    translate([0, -length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus + length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #1
    translate([(1/2) * length_axis_plate_size[0] - length_axis_plate_join_margin, 80 + length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus - length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #2
    translate([-(1/2) * length_axis_plate_size[0] + length_axis_plate_join_margin, 80 + length_axis_plate_carriage_overhang + length_axis_plate_overhang_x_plus - length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #3
    translate([(1/2) * length_axis_plate_size[0] - length_axis_plate_join_margin, -length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus + length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));

    // inter-plate join #4
    translate([-(1/2) * length_axis_plate_size[0] + length_axis_plate_join_margin, -length_axis_plate_carriage_overhang - length_axis_plate_overhang_x_minus + length_axis_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_plate_join_screw));
  }
}


//! Via MakerStore: https://www.makerstore.com.au/product/plate-motor-rack/
module gear_rack_motor_mount_plate_dxf() {
  dxf("gear_rack_motor_mount_plate");

  NEMA_type = length_axis_motor_NEMA_type;

  translate([-65, 0])
  difference() {
    hull() {
      // bottom
      circle(r = 5);

      // bottom right
      translate([30, 30])
        circle(r = 5);

      // bottom left
      translate([30, -30])
        circle(r = 5);

      // top
      translate([130, 0])
        circle(r = 5);

      // top right
      translate([100, 30])
        circle(r = 5);

      // top left
      translate([100, -30])
        circle(r = 5);
    }

    // motor
    translate([65, 0])
      union() {
        // big hole
        circle(r = NEMA_big_hole(NEMA_type));

        // screw holes
        NEMA_screw_positions(NEMA_type)
          circle(d = NEMA_thread_d(NEMA_type));
      }

    // bottom row #1, item #1
    translate([10, 0])
      circle(d = 5.1);

    // bottom row #2, item #1
    translate([20, -10])
      circle(d = 5.1);

    // bottom row #2, item #2
    translate([20, 0])
      circle(d = 5.1);

    // bottom row #2, item #3
    translate([20, 10])
      circle(d = 5.1);

    // bottom row #3, item #1
    translate([30, -20])
      circle(d = 5.1);

    // bottom row #3, item #2
    translate([30, -10])
      circle(d = 5.1);

    // bottom row #3, item #3
    translate([30, 0])
      circle(d = 5.1);

    // bottom row #3, item #4
    translate([30, 10])
      circle(d = 5.1);

    // bottom row #3, item #5
    translate([30, 20])
      circle(d = 5.1);

    // top row #1, item #1
    translate([120, 0])
      circle(d = 5.1);

    // top row #2, item #1
    translate([110, -10])
      circle(d = 5.1);

    // top row #2, item #2
    translate([110, 0])
      circle(d = 5.1);

    // top row #2, item #3
    translate([110, 10])
      circle(d = 5.1);

    // top row #3, item #1
    translate([100, -20])
      circle(d = 5.1);

    // top row #3, item #2
    translate([100, -10])
      circle(d = 5.1);

    // bottom row #3, item #3
    translate([100, 0])
      circle(d = 5.1);

    // bottom row #3, item #4
    translate([100, 10])
      circle(d = 5.1);

    // bottom row #3, item #5
    translate([100, 20])
      circle(d = 5.1);
  }
}

module length_axis_rail() {
  translate([
    0,
    0,
    extrusion_width(length_axis_extrusion_type)
  ])
    union() {
      // rail
      rail(length_axis_rail_type, length_axis_length);

      // carriage #1
      translate([(1/2) * length_axis_rail_carriage_spacing + (1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 0, 0])
        carriage(length_axis_rail_carriage_type);

      // carriage #2
      translate([-(1/2) * length_axis_rail_carriage_spacing + -(1/2) * carriage_length(length_axis_rail_carriage_type) + length_axis_rail_carriage_pos, 0, 0])
        carriage(length_axis_rail_carriage_type);

      // rail screws
      rail_screws(length_axis_rail_type, length_axis_length, 4);

      // rails t-nuts
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
    0,
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

  // plate
  translate([
    0,
    0,
    extrusion_width(length_axis_extrusion_type) + carriage_height(length_axis_rail_carriage_type) + (1/2) * sheet_thickness(length_axis_plate_sheet_type)
  ])
  render_2D_sheet(length_axis_plate_sheet_type)
    length_axis_plate_dxf();

  // motor mount
  translate([
    0,
    -(1/2) * sheet_thickness(gear_rack_motor_mount_plate_sheet_type) - 10,
    (1/2) * extrusion_width(length_axis_extrusion_type) - 5
  ])
  rotate([90, 10, 0])
  render_2D_sheet(gear_rack_motor_mount_plate_sheet_type)
    gear_rack_motor_mount_plate_dxf();
}

//! This assembly is for the axis that will travel perpendicular to the length of the grid beam (i.e. along the width of the grid beam).
module width_axis_assembly()
assembly("width_axis") {
  extrusion_length = width_axis_travel_distance + 170;

  // plate
  translate([0, 0, (1/2) * sheet_thickness(length_axis_plate_sheet_type)])
    render_2D_sheet(width_axis_plate_sheet_type)
    width_axis_plate_dxf();

  // frame
  translate([
    0,
    (1/2) * extrusion_height(width_axis_extrusion_type),
    sheet_thickness(width_axis_plate_sheet_type) + (1/2) * extrusion_width(width_axis_extrusion_type)
  ])
    rotate([90, 90, 0])
    extrusion(width_axis_extrusion_type, extrusion_length);
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
  translate(length_axis_offset)
    length_axis_assembly();

  translate(width_axis_offset)
    width_axis_assembly();

  spindle_assembly();

  workholding_assembly();
}

if($preview) {
  main_assembly();
}
