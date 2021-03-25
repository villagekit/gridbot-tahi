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
//!
//! For the framing, we'll use 8040 aluminium extrusion since it's fit for purpose and readily available here in New Zealand.
//!
//! Where possible, we'll try to use motion control components found in "pro" consumer CNC machines (AvidCNC, RoverCNC, QueenBee, etc), e.g. stepper motors, lead screws, linear rails, etc.

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
leadnut_type = LSN8x8;
leadscrew_diameter = 8;
leadscrew_lead = 8;
leadscrew_starts = 4;
leadscrew_bearing = BB688ZZ;
rail_type = HGH20;
shaft_coupling_type = SC_635x8_rigid;
sheet_type = AL8;

x_axis_x_length = 2400;
x_axis_y_length = 300;
x_axis_travel_distance = 600;
x_axis_leadscrew_length = 700;

drill_z_length = 200;

gang_z_length = 400;
gang_y_length = x_axis_y_length + 2 * beam_width;
gang_x_length = x_axis_x_length;
gang_drill_count = 6;

//! A NEMA_type motor mount plate for the y-axis.
module x_axis_motor_mount_dxf() {
  dxf("x_axis_motor_mount");

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

//! A NEMA_type motor mount plate for the z-axis.
module z_axis_motor_mount_dxf() {
  dxf("z_axis_motor_mount");

  union() {
  
    translate([2 * NEMA_body_radius(NEMA_type), (1 / 2) * beam_width])
    difference() {
      scale(1.2)
      NEMA_outline(NEMA_type);

      circle(NEMA_big_hole(NEMA_type));

      NEMA_screw_positions(NEMA_type) {
        circle(M5_clearance_radius);
      }
    }

    difference() {
      translate([0, -beam_width])
      square([beam_width, 2 * beam_width]);

      translate([(1 / 2) * beam_width, 0.5 * beam_width])
      circle(M8_clearance_radius);

      translate([(1 / 2) * beam_width, -0.5 * beam_width])
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
  render_2D_sheet(sheet_type) x_axis_motor_mount_dxf();

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
  rail(rail_type, x_axis_travel_distance);
}

//! This assembly, between the bed and the table, allows the machine to move the material in the X-axis while the spindles move in the Z-axis.
//! 
//! The necessary X-axis travel distance is equal to the total length divided by the number of spindles, so 2400mm / 6 spindles = 400mm / spindle, so the X-axis linear actuator needs to be able to move at least 400mm.
module x_axis_assembly()
assembly("x_axis") {
  // extrusion: y-length, at x-start
  translate([beam_width, x_axis_y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, x_axis_y_length - 4 * beam_width);

  // extrusion: y-length, at x-end
  translate([x_axis_x_length - beam_width, x_axis_y_length / 2, (1 / 2) * beam_width])
  rotate([90, 90, 0])
  extrusion(E4080, x_axis_y_length - 4 * beam_width);

  // extrusion: x-length, at y-start
  translate([x_axis_x_length / 2, beam_width, (1 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_axis_x_length);

  // extrusion: x-length, at y-end
  translate([x_axis_x_length / 2, beam_width + x_axis_y_length - 2 * beam_width, (1 / 2) * beam_width])
  rotate([0, 90, 0])
  extrusion(E4080, x_axis_x_length);

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

//! This assembly is for a gang of drills on a frame.
//!
//! The number of drills should be a divisor of the total number of holes per beam (60). So we might start with 6 drills, so 10 holes to be drilled per drill.
module gang_drill_assembly()
assembly("gang_drill") {
  gang_z_frame_length = gang_z_length - 2 * beam_width;
  gang_y_frame_length = gang_y_length - 2 * beam_width;


  // frame: x-length, y-start
  translate([(1 / 2) * gang_x_length, -(1 / 2) * beam_width, gang_z_length - beam_width])
  rotate([90, 0, 0])
  rotate([0, 90, 0])
  extrusion(E4080, gang_x_length);

  translate([(1 / 2) * gang_x_length, gang_y_length - (3 / 2) * beam_width, gang_z_length - beam_width])
  rotate([90, 0, 0])
  rotate([0, 90, 0])
  extrusion(E4080, gang_x_length);

  for (i = [0 : gang_drill_count]) {
    x_offset = i < gang_drill_count
      ? i * (x_axis_x_length / gang_drill_count)
      : i * (x_axis_x_length / gang_drill_count) - 2 * beam_width;

    translate([x_offset, 0, 0]) {
      // frame: z-length, y-start
      translate([beam_width, -(1 / 2) * beam_width, (1 / 2) * gang_z_frame_length])
      rotate([0, 0, 90])
      extrusion(E4080, gang_z_frame_length);

      // frame: z-length, y-end
      translate([beam_width, x_axis_y_length + (1 / 2) * beam_width, (1 / 2) * gang_z_frame_length])
      rotate([0, 0, 90])
      extrusion(E4080, gang_z_frame_length);
      // frame: y-length
      translate([(1 / 2) * beam_width, (1 / 2) * gang_y_length - beam_width, gang_z_length - beam_width])
      rotate([90, 0, 0])
      extrusion(E4080, gang_y_frame_length);

      if (i < gang_drill_count) {
        translate([4 * beam_width, (1 / 2) * gang_y_length - 2 * beam_width, (1 / 2) * gang_z_length])
        rotate([0, 0, 180])
        drill_assembly();
      }
    }
  }
};

//! This assembly is for a drill.
//!
//! Each drill has independent spindle and an independent Z-axis.
module drill_assembly()
assembly("drill") {
  drill_leadscrew_length = drill_z_length + sheet_thickness(sheet_type) - NEMA_shaft_length(NEMA_type);

  // frame
  translate([(1 / 2) * beam_width, 0, (1 / 2) * drill_z_length])
  extrusion(E4080, drill_z_length);

  // rail
  translate([beam_width, -(1 / 2) * beam_width, (1 / 2) * drill_z_length])
  rotate([0, 90, 0])
  rail(rail_type, drill_z_length);

  // motor
  translate([2 * NEMA_body_radius(NEMA_type), (1 / 2) * beam_width, drill_z_length + sheet_thickness(sheet_type)])
  rotate([0, 180, 0])
  NEMA(NEMA_type);

  // motor mount
  translate([0, 0, drill_z_length + (1 / 2) * sheet_thickness(sheet_type)])
  render_2D_sheet(sheet_type) z_axis_motor_mount_dxf();

  // shaft coupling
  x_axis_lead_shaft_coupling_x = NEMA_shaft_length(NEMA_type) - sheet_thickness(sheet_type);
  translate([2 * NEMA_body_radius(NEMA_type), (1 / 2) * beam_width, drill_z_length + sheet_thickness(sheet_type) - NEMA_shaft_length(NEMA_type)])
  shaft_coupling(shaft_coupling_type);

  // leadscrew
  translate([2 * NEMA_body_radius(NEMA_type), (1 / 2) * beam_width, (1 / 2) * drill_leadscrew_length])
  leadscrew(leadscrew_diameter, drill_leadscrew_length, leadscrew_lead, leadscrew_starts); 
};

//! Main assembly
module main_assembly()
assembly("main") {
  x_axis_assembly();
  gang_drill_assembly();
}

if($preview)
  main_assembly();
