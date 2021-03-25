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

//! A multi-spindle single-axis CNC.

EPS = 0.001;

include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/ball_bearings.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/leadnuts.scad>
include <NopSCADlib/vitamins/rails.scad>
include <NopSCADlib/vitamins/shaft_couplings.scad>
include <NopSCADlib/vitamins/sheets.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>

// ball bearings
BB688ZZ =  ["688ZZ", 8,  16,  5,   "silver",    1.5, 1.5];

// rails
//                Wr  Hr    E     P   D    d    h                                       go?   gw?
HGH20= [ "HGH20", 20, 17.5, 20,   60, 9.5, 6, 8.5, M5_cap_screw,    M5_cs_cap_screw,  5,  5.5 ];
//                     L     L1    W   H   H1   C   B
HGH20CA_carriage  = [ 77.5, 50.5, 44, 30, 4.6, 36,  32, M5_cap_screw, HGH20 ];
HGH20HA_carriage  = [ 92.2, 65.2, 44, 30, 4.6, 50,  32, M5_cap_screw, HGH20 ];

// shaft_couplings
//                                       L   D       d1   d2
SC_635x8_rigid  = [ "SC_635x8_rigid",    25, 12.5, 6.35,   8 ];

use <NopSCADlib/vitamins/extrusion.scad>
use <NopSCADlib/vitamins/leadnut.scad>
use <NopSCADlib/vitamins/rail.scad>
use <NopSCADlib/vitamins/rod.scad>
use <NopSCADlib/vitamins/shaft_coupling.scad>
use <NopSCADlib/vitamins/sheet.scad>
use <NopSCADlib/vitamins/stepper_motor.scad>

// $show_threads = true;

beam_width = 40;
NEMA_type = NEMA23;
shaft_coupling_type = SC_635x8_rigid;
leadnut_type = LSN8x8;
leadscrew_diameter = 8;
leadscrew_lead = 8;
leadscrew_starts = 4;
leadscrew_bearing = BB688ZZ;
sheet_type = AL8;

x_axis_x_length = 2400;
x_axis_y_length = 300;
x_axis_travel_distance = 600;
x_axis_leadscrew_length = 700;

//! A NEMA_type motor mount plate.
//! 
//! Similar to [PLATE-MOTOR-NEMA_type-V2](https://www.makerstore.com.au/product/motor-mount-plate-nema23/), but this design is more appropriate for our machine and covers the extrusion ends.
module motor_mount_dxf() {
  dxf("motor_mount");

  union() {
  
    translate([2 * NEMA_body_radius(NEMA_type), (3 / 2) * beam_width])
    difference() {
      scale(1.2)
      NEMA_outline(NEMA_type);

      circle(NEMA_big_hole(NEMA_type));

      NEMA_screw_positions(NEMA_type) {
        circle(M5_clearance_radius);
      }
    }

    difference() {
      square([beam_width, 3 * beam_width]);

      translate([(1 / 2) * beam_width, 0.5 * beam_width])
      circle(M8_clearance_radius);

      translate([(1 / 2) * beam_width, 2.5 * beam_width])
      circle(M8_clearance_radius);
    }
  }
}

//! A support seat block designed to support a leadscrew (with a bearing) and a rail.
//!
//! TODO fix the design
module support_seat_stl() {
  stl("support_seat");

  difference() {
    union() {
      translate([0, (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type) - beam_width])
      rotate([0, 90, 0])
      cylinder(
        h = (1 / 2) * beam_width,
        d = beam_width
      );

      cube([(1 / 2) * beam_width, 2 * beam_width, (1 / 2) * beam_width]);

      translate([0, beam_width, 0])
      cube([beam_width, beam_width, (1 / 2) * beam_width]);
    }

    translate([-EPS, (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type) - beam_width])
    rotate([0, 90, 0])
    cylinder(
      h = beam_width + 2 * EPS,
      d = bb_diameter(leadscrew_bearing)
    );
    
    translate([-EPS, (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type) - beam_width])
    rotate([0, 90, 0])
    cylinder(
      h = beam_width + 2 * EPS,
      d = bb_diameter(leadscrew_bearing)
    );
  }
}


//! A housing block designed to connect a lead screw to lead nuts, and a carriage.
//!
//! Similar to https://www.makerstore.com.au/product/hard-nut-house/
module leadnut_block_stl() {
  stl("leadnut_block");

  difference() {
    cube([40, 40, 40]);


  }
}

module x_axis_lead_assembly() {
  // motor
  translate([-sheet_thickness(sheet_type), (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  NEMA(NEMA_type);

  // motor mount
  translate([-(1 / 2) * sheet_thickness(sheet_type), 0, 0])
  rotate([0, -90, 0])
  render_2D_sheet(sheet_type) motor_mount_dxf();

  // shaft coupling
  x_axis_lead_shaft_coupling_x = NEMA_shaft_length(NEMA_type) - sheet_thickness(sheet_type);
  translate([x_axis_lead_shaft_coupling_x, (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  shaft_coupling(shaft_coupling_type);

  // leadscrew
  translate([x_axis_lead_shaft_coupling_x + (1 / 2) * x_axis_leadscrew_length, (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  leadscrew(leadscrew_diameter, x_axis_leadscrew_length, leadscrew_lead, leadscrew_starts); 

  // first support seat
  translate([(1 / 2) * (x_axis_leadscrew_length - x_axis_travel_distance), 0, beam_width])
  support_seat_stl();

  // first, first bearing
  translate([(1 / 2) * (x_axis_leadscrew_length - x_axis_travel_distance + bb_width(leadscrew_bearing)), (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  ball_bearing(leadscrew_bearing);

  // first, second bearing
  translate([(1 / 2) * (x_axis_leadscrew_length - x_axis_travel_distance - bb_width(leadscrew_bearing) + beam_width), (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  ball_bearing(leadscrew_bearing);

  // second support seat
  translate([x_axis_lead_shaft_coupling_x + x_axis_leadscrew_length - (3 / 4) * beam_width, 0, beam_width])
  support_seat_stl();

  // second, first bearing
  translate([x_axis_lead_shaft_coupling_x + x_axis_leadscrew_length - (3 / 4) * beam_width + (1 / 2) * bb_width(leadscrew_bearing), (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  ball_bearing(leadscrew_bearing);

  // second, second bearing
  translate([x_axis_lead_shaft_coupling_x + x_axis_leadscrew_length - (1 / 4) * beam_width - (1 / 2) * bb_width(leadscrew_bearing), (3 / 2) * beam_width, 2 * NEMA_body_radius(NEMA_type)])
  rotate([0, 90, 0])
  ball_bearing(leadscrew_bearing);
}

module x_axis_rail_assembly() {
  // rail
  translate([(1 / 2) * x_axis_travel_distance + 2 * beam_width, (1 / 2) * beam_width, beam_width])
  rail(HGH20, x_axis_travel_distance);
}

//! This assembly, between the bed and the table, allows the machine to move the material in the X-axis while the spindles move in the Z-axis.
//! 
//! The necessary X-axis travel distance is equal to the total length divided by the number of spindles, so 2400mm / 6 spindles = 400mm / spindle, so the X-axis linear actuator needs to be able to move at least 400mm.
module x_axis_assembly()
assembly("x_axis") {
  // extrusion: y-length, at x-start
  translate([beam_width, x_axis_y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, x_axis_y_length - 4 * beam_width, cornerHole = true);

  // extrusion: y-length, at x-end
  translate([x_axis_x_length - beam_width, x_axis_y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, x_axis_y_length - 4 * beam_width, cornerHole = true);

  // extrusion: x-length, at y-start
  translate([x_axis_x_length / 2, beam_width, (1 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_axis_x_length, cornerHole = true);

  // extrusion: x-length, at y-end
  translate([x_axis_x_length / 2, beam_width + x_axis_y_length - 2 * beam_width, (1 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_axis_x_length, cornerHole = true);

  // x-start, y-start
  x_axis_rail_assembly();
  x_axis_lead_assembly();

  // x-end, y-end
  translate([0, x_axis_y_length, 0])
  mirror([0, 1, 0])
  {
    x_axis_rail_assembly();
    x_axis_lead_assembly();
  }

  // x-start, y-end
  translate([x_axis_x_length, 0, 0])
  mirror([1, 0, 0])
  {
    x_axis_rail_assembly();
  }

  // x-end, y-end
  translate([x_axis_x_length, x_axis_y_length, 0])
  mirror([1, 0, 0])
  mirror([0, 1, 0])
  {
    x_axis_rail_assembly();
  }
}

//! Main assembly
module main_assembly()
assembly("main") {
  x_axis_assembly();
}

if($preview)
  main_assembly();
