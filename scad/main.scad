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

include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/rails.scad>
include <NopSCADlib/vitamins/sheets.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>

//                Wr  Hr    E     P   D    d    h                                       go?   gw?
HGH20= [ "HGH20", 20, 17.5, 20,   60, 9.5, 6, 8.5, M5_cap_screw,    M5_cs_cap_screw,  5,  5.5 ];
//                     L     L1    W   H   H1   C   B
HGH20CA_carriage  = [ 77.5, 50.5, 44, 30, 4.6, 36,  32, M5_cap_screw, HGH20 ];
HGH20HA_carriage  = [ 92.2, 65.2, 44, 30, 4.6, 50,  32, M5_cap_screw, HGH20 ];

use <NopSCADlib/vitamins/extrusion.scad>
use <NopSCADlib/vitamins/rail.scad>
use <NopSCADlib/vitamins/sheet.scad>
use <NopSCADlib/vitamins/stepper_motor.scad>

beam_width = 40;
sheet = AL8;
stepper = NEMA23;

//! A stepper motor mount plate.
//! 
//! Similar to [PLATE-MOTOR-stepper-V2](https://www.makerstore.com.au/product/motor-mount-plate-nema23/), but this design is more appropriate for our machine and covers the extrusion ends.
module motor_mount_dxf() {
  dxf("motor_mount");

  union() {
  
    translate([2 * NEMA_body_radius(stepper), (3 / 2) * beam_width])
    difference() {
      scale(1.2)
      NEMA_outline(stepper);

      circle(NEMA_big_hole(stepper));

      NEMA_screw_positions(stepper) {
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

//! This assembly, between the bed and the table, allows the machine to move the material in the X-axis while the spindles move in the Z-axis.
//! 
//! The necessary X-axis travel distance is equal to the total length divided by the number of spindles, so 2400mm / 6 spindles = 400mm / spindle, so the X-axis linear actuator needs to be able to move at least 400mm.
module x_axis_assembly()
assembly("x_axis") {
  x_length = 2400;
  y_length = 300;
  travel_distance = 600;

  // extrusion: y-length, at x-start
  translate([beam_width, y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, y_length - 4 * beam_width, cornerHole = true);

  // extrusion: y-length, at x-end
  translate([x_length - beam_width, y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, y_length - 4 * beam_width, cornerHole = true);

  // extrusion: x-length, at y-start
  translate([x_length / 2, beam_width, (1 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_length, cornerHole = true);

  // extrusion: x-length, at y-end
  translate([x_length / 2, beam_width + y_length - 2 * beam_width, (1 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_length, cornerHole = true);

  // rail: x-start, y-start
  translate([(1 / 2) * travel_distance, (1 / 2) * beam_width, beam_width])
  rail(HGH20, travel_distance);

  // rail: x-start, y-end
  translate([(1 / 2) * travel_distance, y_length - (1 / 2) * beam_width, beam_width])
  rail(HGH20, travel_distance);

  // rail: x-end, y-start
  translate([x_length - (1 / 2) * travel_distance, (1 / 2) * beam_width, beam_width])
  rail(HGH20, travel_distance);

  // rail: x-end, y-end
  translate([x_length - (1 / 2) * travel_distance, y_length - (1 / 2) * beam_width, beam_width])
  rail(HGH20, travel_distance);

  // motor: x-start, y-start
  translate([-sheet_thickness(sheet), (3 / 2) * beam_width, 2 * NEMA_body_radius(stepper)])
  rotate([0, 90, 0])
  NEMA(stepper);

  // motor mount: x-start, y-start
  translate([-(1 / 2) * sheet_thickness(sheet), 0, 0])
  rotate([0, -90, 0])
  render_2D_sheet(sheet) motor_mount_dxf();

  // motor: x-start, y-end
  translate([-sheet_thickness(sheet), y_length - (3 / 2) * beam_width, 2 * NEMA_body_radius(stepper)])
  rotate([0, 90, 0])
  NEMA(stepper);

  // motor mount: x-start, y-end
  translate([-(1 / 2) * sheet_thickness(sheet), y_length, 0])
  rotate([180, -90, 0])
  render_2D_sheet(sheet) motor_mount_dxf();
}

//! Main assembly
module main_assembly()
assembly("main") {
  x_axis_assembly();
}

if($preview)
  main_assembly();
