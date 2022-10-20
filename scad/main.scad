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
//! ***
//! 
//! ***
//!
//! Hardware design assets and documentation licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), `.scad` files licensed under GPL-3.0 (as with NopSCADlib).
//!
//! Previous design notes: https://wiki.villagekit.com/en/grid-bot
//!
//! Inspiration:
//!
//! - Phil and Richard's multi-spindle drill press: https://youtu.be/PIMESt9iLYg
//! - BeamCNC: https://github.com/VladLunachev/BeamCNC/
//! - https://wiki.replimat.org/wiki/Automated_drilling_machines
//! - https://youtu.be/YmD3KoqatHs
//! - https://youtu.be/1WsEdbiqdlA
//! - https://youtu.be/ksaT63qqIJM
//! - https://youtu.be/h0pohupmKKk
//! - https://youtu.be/mg9bALNiYPU
//! - https://youtu.be/ocbE4NLd9go

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
length_axis_bottom_plate_sheet_type = AL6;
length_axis_bottom_plate_carriage_overhang = (1/2) * (carriage_width(length_axis_rail_carriage_type) - 20);
length_axis_bottom_plate_join_screw = M5_cap_screw;
length_axis_bottom_plate_join_margin = screw_head_radius(length_axis_bottom_plate_join_screw) * 1.2;
length_axis_bottom_plate_overhang_x_plus = 2 * length_axis_bottom_plate_join_margin;
length_axis_bottom_plate_overhang_x_minus = 55;
length_axis_bottom_plate_size = [
    max(
      length_axis_rail_carriage_spacing + 2 * carriage_length(length_axis_rail_carriage_type),
      100 + 4 * length_axis_bottom_plate_join_margin
    ),
    80 + 2 * length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus + length_axis_bottom_plate_overhang_x_minus
  ];
echo(length_axis_bottom_plate_size);
length_axis_bottom_plate_offset = [
    0,
    (1/2) * length_axis_bottom_plate_size[1] - length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus
  ];
length_axis_motor_NEMA_type = NEMA23_HG86001Y21B;
length_axis_pinion_gear = pinion_gear_40_teeth;
length_axis_motor_mount_offset = [
  0,
  -pinion_gear_collar_height(length_axis_pinion_gear) - 1,
  -pinion_gear_rack_distance(length_axis_pinion_gear)
];
length_axis_motor_mount_rotation = 30;
length_axis_motor_mount_side_plate_rotation = 0;
length_axis_pinion_gear_rotation = 6;
length_axis_side_plate_sheet_type = AL5;
length_axis_offset = [0, -20, 0];
length_axis_gear_rack_motor_pivot_position = -55;
length_axis_gear_rack_motor_anchor_position = 55;

width_axis_plate_sheet_type = AL6;
width_axis_plate_offset_y = 20;
width_axis_offset = [
  length_axis_offset[0],
  length_axis_offset[1] + 0,
  length_axis_offset[2] + extrusion_width(length_axis_extrusion_type) + carriage_height(length_axis_rail_carriage_type) + sheet_thickness(length_axis_bottom_plate_sheet_type)
];

hanpose_hpv6_travel_distance = 100;
hanpose_hpv6_extrusion_length = hanpose_hpv6_travel_distance + 170;
hanpose_hpv6_ballscrew_length = hanpose_hpv6_travel_distance + 150;
hanpose_hpv6_rail_length = hanpose_hpv6_travel_distance + 140;
hanpose_hpv6_extrusion_type = E20100;
hanpose_hpv6_travel_plate_sheet_type = AL10;
hanpose_hpv6_travel_plate_size = [120, 100];
hanpose_hpv6_ballscrew_diameter = 8;
hanpose_hpv6_ballscrew_lead = 8;
hanpose_hpv6_ballscrew_starts = 4;
hanpose_hpv6_ballscrew_nut = SFU1610;
hanpose_hpv6_rail_type = HGH15CA;
hanpose_hpv6_carriage_type = HGH15CA_carriage;
hanpose_hpv6_motor_NEMA_type = NEMA23_51;
hanpose_hpv6_motor_plate_sheet_type = AL10;
hanpose_hpv6_motor_coupling_type = SC_635x8_rigid;
hanpose_hpv6_height = 63;

spindle_plate_sheet_type = AL6;
spindle_plate_spacer_sheet_type = AL6;
spindle_plate_spacer_size = [hanpose_hpv6_travel_plate_size.x, 20];
spindle_motor_NEMA_type = NEMA23_51;
spindle_offset = [
  width_axis_offset[0],
  width_axis_offset[1] + (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_rail_length,
  width_axis_offset[2] + sheet_thickness(width_axis_plate_sheet_type) + hanpose_hpv6_height
];
spindle_drill_point_height = spindle_offset[2] + sheet_thickness(spindle_plate_sheet_type) + sheet_thickness(spindle_plate_spacer_sheet_type) + (1/2) * spindle_er20_height;

workholding_bed_height = spindle_drill_point_height - 20;
workholding_leg_count = 4;
workholding_leg_height = 120;
workholding_extrusion_type = E2040;
workholding_size = [
  length_axis_length,
  240,
  ceil_to(workholding_leg_height + workholding_bed_height + 40, 40)
];
echo("workholding_size", workholding_size);
workholding_bed_extrusion_type = E2040;

//! A plate to connect the length-axis components, which connects to the width-axis mount plate.
module length_axis_bottom_plate_dxf() {
  dxf("length_axis_bottom_plate");

  difference() {
    translate(length_axis_bottom_plate_offset)
      sheet_2D(length_axis_bottom_plate_sheet_type, length_axis_bottom_plate_size[0], length_axis_bottom_plate_size[1], 2);

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

    // side plate joins
    translate([
      -40,
      length_axis_motor_mount_offset[1] - sheet_thickness(gear_rack_motor_mount_plate_sheet_type) - sheet_thickness(length_axis_side_plate_sheet_type) - 15,
    ])
    for (hole_index = [0 : 4]) {
      translate([hole_index * 20, 0])
      circle(r = screw_clearance_radius(M5_cap_screw));
    }

    // width-axis extrusion join #1
    translate([40, 40])
      circle(d = screw_boss_diameter(length_axis_bottom_plate_join_screw));

    // width-axis extrusion join #2
    translate([-40, 40])
      circle(d = screw_boss_diameter(length_axis_bottom_plate_join_screw));

    // width-axis extrusion join #3
    translate([0, 80 + length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus - length_axis_bottom_plate_join_margin])
      circle(d = screw_boss_diameter(length_axis_bottom_plate_join_screw));

    // width-axis extrusion join #4
    translate([0, -length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus + length_axis_bottom_plate_join_margin])
      circle(d = screw_boss_diameter(length_axis_bottom_plate_join_screw));

    // inter-plate join #1
    translate([(1/2) * length_axis_bottom_plate_size[0] - length_axis_bottom_plate_join_margin, 80 + length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus - length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #2
    translate([-(1/2) * length_axis_bottom_plate_size[0] + length_axis_bottom_plate_join_margin, 80 + length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus - length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #3
    translate([(1/2) * length_axis_bottom_plate_size[0] - length_axis_bottom_plate_join_margin, -length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus + length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #4
    translate([-(1/2) * length_axis_bottom_plate_size[0] + length_axis_bottom_plate_join_margin, -length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus + length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));
  }
}

//! A plate mount for the width-axis, which connects to the length-axis.
module width_axis_plate_dxf() {
  dxf("width_axis_plate");

  difference() {
    translate(length_axis_bottom_plate_offset)
      sheet_2D(width_axis_plate_sheet_type, length_axis_bottom_plate_size[0], length_axis_bottom_plate_size[1], 2);

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

    // side plate joins
    translate([
      -40,
      length_axis_motor_mount_offset[1] - sheet_thickness(gear_rack_motor_mount_plate_sheet_type) - sheet_thickness(length_axis_side_plate_sheet_type) - 15,
    ])
    for (hole_index = [0 : 4]) {
      translate([hole_index * 20, 0])
      circle(d = screw_boss_diameter(M5_cap_screw));
    }

    // width-axis extrusion join #1
    translate([40, 40])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // width-axis extrusion join #2
    translate([-40, 40])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // width-axis extrusion join #3
    translate([0, 80 + length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus - length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // width-axis extrusion join #4
    translate([0, -length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus + length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #1
    translate([(1/2) * length_axis_bottom_plate_size[0] - length_axis_bottom_plate_join_margin, 80 + length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus - length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #2
    translate([-(1/2) * length_axis_bottom_plate_size[0] + length_axis_bottom_plate_join_margin, 80 + length_axis_bottom_plate_carriage_overhang + length_axis_bottom_plate_overhang_x_plus - length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #3
    translate([(1/2) * length_axis_bottom_plate_size[0] - length_axis_bottom_plate_join_margin, -length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus + length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));

    // inter-plate join #4
    translate([-(1/2) * length_axis_bottom_plate_size[0] + length_axis_bottom_plate_join_margin, -length_axis_bottom_plate_carriage_overhang - length_axis_bottom_plate_overhang_x_minus + length_axis_bottom_plate_join_margin])
      circle(r = screw_clearance_radius(length_axis_bottom_plate_join_screw));
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

module length_axis_side_plate_motor_position() {
  translate([
    0,
    length_axis_motor_mount_offset[2] - extrusion_width(length_axis_extrusion_type) - carriage_height(length_axis_rail_carriage_type),
  ])
  children();
}

module length_axis_side_plate_pivot_position() {
  length_axis_side_plate_motor_position()
  translate([
    cos(-length_axis_motor_mount_rotation) * length_axis_gear_rack_motor_pivot_position,
    sin(-length_axis_motor_mount_rotation) * length_axis_gear_rack_motor_pivot_position,
  ])
  children();
}

module length_axis_side_plate_anchor_fixed_position() {
  length_axis_side_plate_motor_position()
  translate([
    cos(length_axis_motor_mount_rotation) * length_axis_gear_rack_motor_anchor_position,
    sin(length_axis_motor_mount_rotation) * length_axis_gear_rack_motor_anchor_position,
  ])
  children();
}

module length_axis_side_plate_dxf() {
  dxf("length_axis_side_plate");

  // [0, 0] is top of plate

  difference() {
    union() {
      hull() {
        translate([-20, -5])
        sheet_2D(length_axis_side_plate_sheet_type, 60, 10, 5);

        length_axis_side_plate_pivot_position()
        circle(d = 20);
      }

      hull() {
        translate([20, -5])
        sheet_2D(length_axis_side_plate_sheet_type, 60, 10, 5);

        length_axis_side_plate_anchor_fixed_position()
        circle(d = 20);
      }

      translate([0, -10])
      sheet_2D(length_axis_side_plate_sheet_type, 60, 20, 5);
    }

    length_axis_side_plate_pivot_position()
    circle(r = screw_clearance_radius(M5_cap_screw));

    length_axis_side_plate_anchor_fixed_position()
    circle(r = screw_clearance_radius(M5_cap_screw));

    translate([-50 + 10, -10])
    union() {
      for (hole_index = [0 : 4]) {
        translate([hole_index * 20, 0])
        circle(r = screw_clearance_radius(M5_cap_screw));
      }
    }
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
    rotate([0, -90, 0])
    extrusion(length_axis_extrusion_type, length_axis_length);

  // rail #1
  translate([0, 10, 0])
    length_axis_rail();

  // rail #2
  translate([0, 70, 0])
    length_axis_rail();

  // bottom plate
  translate([
    0,
    0,
    extrusion_width(length_axis_extrusion_type) + carriage_height(length_axis_rail_carriage_type) + (1/2) * sheet_thickness(length_axis_bottom_plate_sheet_type)
  ])
  render_2D_sheet(length_axis_bottom_plate_sheet_type)
    length_axis_bottom_plate_dxf();

  // gear rack
  translate([
    -(1/2) * length_axis_length,
    -external_gear_rack_height(),
    external_gear_rack_width(),
  ])
  for (gear_rack_index = [0 : floor(length_axis_length / external_gear_rack_length()) - 1]) {
    translate([gear_rack_index * external_gear_rack_length(), 0, 0])
    rotate([-90, 0, 0])
    external_gear_rack();
  }

  // side plate
  translate([
    0,
    length_axis_motor_mount_offset[1] - sheet_thickness(gear_rack_motor_mount_plate_sheet_type) - (1/2) * sheet_thickness(length_axis_side_plate_sheet_type),
    extrusion_width(length_axis_extrusion_type) + carriage_height(length_axis_rail_carriage_type),
  ])
  rotate([90, 0, 0])
  union() {
    render_2D_sheet(length_axis_side_plate_sheet_type)
    length_axis_side_plate_dxf();

    // connect side plate to motor mount: #3, anchor dynamic
    length_axis_side_plate_anchor_fixed_position()
    union() {
      rotate([0, 0, 90])
      translate([-15, -10, (1/2) * sheet_thickness(length_axis_side_plate_sheet_type)])
      l_bracket(lb_single);

      translate([0, 0, l_bracket_thickness(lb_single)])
      screw(
        l_bracket_screw_type(lb_single),
        screw_shorter_than(sheet_thickness(length_axis_side_plate_sheet_type) + nut_thickness(l_bracket_nut_type(lb_single), nyloc = true))
      );

      rotate([180, 0, 0])
      translate([0, 0, (1/2) * sheet_thickness(length_axis_side_plate_sheet_type)])
      nut(l_bracket_nut_type(lb_single), nyloc = true);
    }
  }

  // gear rack motor
  translate([
    0,
    -(1/2) * sheet_thickness(gear_rack_motor_mount_plate_sheet_type) + length_axis_motor_mount_offset[1],
    length_axis_motor_mount_offset[2]
  ])
  rotate([90, length_axis_motor_mount_rotation, 0])
  union() {
    gear_rack_motor_mount_plate();

    rotate([180, 0, 0])
    translate([0, 0, -(1/2) * sheet_thickness(gear_rack_motor_mount_plate_sheet_type)])
    NEMA(length_axis_motor_NEMA_type);

    translate([0, 0, -(1/2) * sheet_thickness(gear_rack_motor_mount_plate_sheet_type) - pinion_gear_collar_height(length_axis_pinion_gear)])
    rotate([0, 0, length_axis_pinion_gear_rotation])
    // rotate([0, 0, pinion_gear_rack_rotation(length_axis_pinion_gear)])
    pinion_gear(length_axis_pinion_gear);

    // connect side plate to motor mount: #1, pivot
    translate([length_axis_gear_rack_motor_pivot_position, 0, (1/2) * sheet_thickness(gear_rack_motor_mount_plate_sheet_type)])
    union() {
      // screw
      translate([0, 0, -sheet_thickness(gear_rack_motor_mount_plate_sheet_type) ])
      rotate([180, 0, 0])
      screw(
        l_bracket_screw_type(lb_single),
        screw_shorter_than(sheet_thickness(gear_rack_motor_mount_plate_sheet_type) + sheet_thickness(length_axis_side_plate_sheet_type) + nut_thickness(l_bracket_nut_type(lb_single), nyloc = true))
      );
      
      // nut
      translate([0, 0, sheet_thickness(length_axis_side_plate_sheet_type) ])
      nut(l_bracket_nut_type(lb_single), nyloc = true);
    }

    // connect side plate to motor mount: #2, anchor dynamic
    translate([length_axis_gear_rack_motor_anchor_position, 0, (1/2) * sheet_thickness(gear_rack_motor_mount_plate_sheet_type)])
    union() {
      rotate([0, 0, length_axis_motor_mount_rotation - 90 - length_axis_motor_mount_side_plate_rotation])
      translate([-15, -10, 0])
      union() {
        rotate([0, -90, 180])
        translate([0, -20, 5])
        l_bracket(lb_single);

        // screw to connect motor mount l-bracket #2 to width-axis plate
        translate([l_bracket_thickness(lb_single) + 5, 10, 15])
        translate([15, 0, 0]) // sping offset
        rotate([0, 90, 0])
        screw(l_bracket_screw_type(lb_single), 60);

        translate([l_bracket_thickness(lb_single) + 5, 10, 15])
        rotate([0, 90, 0])
        comp_spring(spring_1d2_7d5_20, 15);
      }

      screw(
        l_bracket_screw_type(lb_single),
        screw_shorter_than(sheet_thickness(gear_rack_motor_mount_plate_sheet_type) + nut_thickness(l_bracket_nut_type(lb_single), nyloc = true))
      );
      
      rotate([180, 0, 0])
      translate([0, 0, sheet_thickness(gear_rack_motor_mount_plate_sheet_type) ])
      nut(l_bracket_nut_type(lb_single), nyloc = true);
    };
  }
}

//! This assembly is for the axis that will travel perpendicular to the length of the grid beam (i.e. along the width of the grid beam).
module width_axis_assembly()
assembly("width_axis") {
  // plate
  translate([0, 0, (1/2) * sheet_thickness(length_axis_bottom_plate_sheet_type)])
    render_2D_sheet(width_axis_plate_sheet_type)
    width_axis_plate_dxf();

  hanpose_hpv6_linear_guide_assembly();
}

//! Hanpose HPV6: https://www.aliexpress.com/item/32908794883.html
module hanpose_hpv6_linear_guide_assembly()
assembly("hanpose_hpv6_linear_guide") {
  // frame
  translate([
    0,
    width_axis_plate_offset_y,
    sheet_thickness(width_axis_plate_sheet_type) + (1/2) * extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    rotate([0, 90, 90])
    extrusion(hanpose_hpv6_extrusion_type, hanpose_hpv6_extrusion_length);

  // fixed side bearing
  translate([
    -20,
    width_axis_plate_offset_y - hanpose_hpv6_travel_distance,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    ek08();

  // floating side bearing
  translate([
    -20,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - 14 /* eko8 L */,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    ef08();

  // ballscrew
  translate([
    0,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_ballscrew_length - 7 /* eko8 L/2 */,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type) + 17 /* ek08 h */
  ])
    rotate([90, 0, 0])
    leadscrew(8, hanpose_hpv6_ballscrew_length, 10, 1 );

  // TODO motor plate

  // motor
  translate([
    0,
    -(1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - sheet_thickness(hanpose_hpv6_motor_plate_sheet_type),
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type) + 17 /* eko8 h */
  ])
    rotate([-90, 0, 0])
    NEMA(hanpose_hpv6_motor_NEMA_type);

  // motor shaft coupler
  translate([
    0,
    -(1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y + 15 /* arbitrary */,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type) + 17 /* eko8 h */
  ])
    rotate([-90, 0, 0])
    shaft_coupling(hanpose_hpv6_motor_coupling_type);

  // rail #1
  translate([
    -40,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_rail_length,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    rotate([0, 0, 90])
    rail(hanpose_hpv6_rail_type, hanpose_hpv6_rail_length);

  // rail #2
  translate([
    40,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_rail_length,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    rotate([0, 0, 90])
    rail(hanpose_hpv6_rail_type, hanpose_hpv6_rail_length);

  // carriage #1
  translate([
    -40,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_rail_length,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    rotate([0, 0, 90])
    carriage(length_axis_rail_carriage_type);

  // carriage #2
  translate([
    40,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_rail_length,
    sheet_thickness(width_axis_plate_sheet_type) + extrusion_width(hanpose_hpv6_extrusion_type)
  ])
    rotate([0, 0, 90])
    carriage(length_axis_rail_carriage_type);

  // TODO nut block

  // travel plate
  translate([
    0,
    (1/2) * (hanpose_hpv6_extrusion_length) + width_axis_plate_offset_y - (1/2) * hanpose_hpv6_rail_length,
    sheet_thickness(width_axis_plate_sheet_type) + hanpose_hpv6_height - (1/2) * sheet_thickness(hanpose_hpv6_travel_plate_sheet_type)
  ])
    render_2D_sheet(hanpose_hpv6_travel_plate_sheet_type)
    hanpose_hpv6_travel_plate();
}

module hanpose_hpv6_travel_plate() {
  difference() {
    sheet_2D(hanpose_hpv6_travel_plate_sheet_type, hanpose_hpv6_travel_plate_size[0], hanpose_hpv6_travel_plate_size[1], 3);

    // screw #1
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 10, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #2
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 30, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #3
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 30, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #4
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 10, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #5
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 10, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #6
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 30, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #7
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 30, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #8
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 10, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));
  }
}

//! A plate to connect the spindle components, which connects to the width-axis.
module spindle_plate_dxf() {
  dxf("spindle_plate");

  difference() {
    sheet_2D(hanpose_hpv6_travel_plate_sheet_type, hanpose_hpv6_travel_plate_size[0], hanpose_hpv6_travel_plate_size[1], 3);

    // screw #1
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 10, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #2
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 30, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #3
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 30, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #4
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 10, (1/2) * hanpose_hpv6_travel_plate_size.y - 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #5
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 10, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #6
    translate([(1/2) * hanpose_hpv6_travel_plate_size.x - 30, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #7
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 30, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #8
    translate([-(1/2) * hanpose_hpv6_travel_plate_size.x + 10, -(1/2) * hanpose_hpv6_travel_plate_size.y + 10])
      circle(r = screw_clearance_radius(M5_cap_screw));
  }
}

//! A plate to space the spindle plate above the width-axis
module spindle_plate_spacer_dxf() {
  dxf("spindle_plate_spacer");

  difference() {
    sheet_2D(spindle_plate_spacer_sheet_type, spindle_plate_spacer_size[0], spindle_plate_spacer_size[1], 3);

    // screw #1
    translate([(1/2) * spindle_plate_spacer_size.x - 10, 0])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #2
    translate([(1/2) * spindle_plate_spacer_size.x - 30, 0])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #3
    translate([-(1/2) * spindle_plate_spacer_size.x + 30, 0])
      circle(r = screw_clearance_radius(M5_cap_screw));

    // screw #4
    translate([-(1/2) * spindle_plate_spacer_size.x + 10, 0])
      circle(r = screw_clearance_radius(M5_cap_screw));
  }

}

//! This assembly is for a spindle and motor connected via gears.
//!
//! - Spindle: [ER20 Spindle Head for Drilling](https://www.aliexpress.com/item/1005001278002287.html)
//! - Motor: [iHSV57-180 Nema23 180W Integrated Servo Motor](https://www.makerstore.com.au/product/elec-ihsv57-180/)
module spindle_assembly()
assembly("spindle") {
  union() {
    // spacer #1
    translate([0, (1/2) * hanpose_hpv6_travel_plate_size.y - (1/2) * spindle_plate_spacer_size.y, (1/2) * sheet_thickness(spindle_plate_spacer_sheet_type)])
      render_2D_sheet(spindle_plate_spacer_sheet_type)
      spindle_plate_spacer_dxf();

    // spacer #2
    translate([0, -(1/2) * hanpose_hpv6_travel_plate_size.y + (1/2) * spindle_plate_spacer_size.y, (1/2) * sheet_thickness(spindle_plate_spacer_sheet_type)])
      render_2D_sheet(spindle_plate_spacer_sheet_type)
      spindle_plate_spacer_dxf();

    // spindle plate
    translate([0, 0, sheet_thickness(spindle_plate_spacer_sheet_type) + (1/2) * sheet_thickness(spindle_plate_sheet_type)])
      render_2D_sheet(spindle_plate_sheet_type)
      spindle_plate_dxf();

    // spindle
    translate([0, -(1/2) * spindle_er20_body_length, sheet_thickness(spindle_plate_spacer_sheet_type) + sheet_thickness(spindle_plate_sheet_type)])
      rotate([0, 0, 90])
      spindle_er20();
  }
}

//! This assembly is to hold the workpiece (the grid beam) and the rest of the machine.
module workholding_assembly()
assembly("workholding") {
  union() {
  workholding_leg_positions()
    union() {
      // extrusion #1: horizontal
      translate([0, extrusion_width(workholding_extrusion_type), 0])
      rotate([0, 90, 90])
        extrusion(workholding_extrusion_type, workholding_size[1] - 2 * extrusion_width(workholding_extrusion_type), center = false);

      // extrusion #2: vertical
      translate([
        0,
        -(1/2) * extrusion_width(workholding_extrusion_type) + workholding_size[1],
        (1/2) * extrusion_width(workholding_extrusion_type) - workholding_leg_height,
      ])
      rotate([0, 0, 90])
      extrusion(workholding_extrusion_type, workholding_size[2], center = false);

      // l bracket #12-a: connect extrusion #1 and #2
      translate([
        extrusion_width(workholding_extrusion_type),
        -extrusion_width(workholding_extrusion_type) + workholding_size[1],
        -(1/2) * extrusion_width(workholding_extrusion_type),
      ])
      rotate([0, 180, 90])
      union() {
        l_bracket(lb_double);
        l_bracket_screws(lb_double);
        l_bracket_tnuts(lb_double);
      }

      // l bracket #12-b: connect extrusion #1 and #2
      translate([
        -extrusion_width(workholding_extrusion_type),
        -extrusion_width(workholding_extrusion_type) + workholding_size[1],
        (1/2) * extrusion_width(workholding_extrusion_type),
      ])
      rotate([0, 0, -90])
      union() {
        l_bracket(lb_double);
        l_bracket_screws(lb_double);
        l_bracket_tnuts(lb_double);
      }

      // extrusion #3: vertical
      translate([
        0,
        (1/2) * extrusion_width(workholding_extrusion_type),
        (1/2) * extrusion_width(workholding_extrusion_type) - workholding_leg_height,
      ])
      rotate([0, 0, 90])
      extrusion(workholding_extrusion_type, workholding_leg_height, center = false);

      // l bracket #13: connect extrusion #1 and #3
      translate([
        -extrusion_width(workholding_extrusion_type),
        extrusion_width(workholding_extrusion_type),
        -(1/2) * extrusion_width(workholding_extrusion_type),
      ])
      rotate([180, 0, 90])
      union() {
        l_bracket(lb_double);
        l_bracket_screws(lb_double);
        l_bracket_tnuts(lb_double);
      }

      // l bracket #3b: connect extrusion #1 and bed
      translate([
        -extrusion_width(workholding_extrusion_type),
        -extrusion_width(workholding_extrusion_type) + workholding_size[1],
        workholding_bed_height,
      ])
      rotate([90, 0, 0])
      rotate([0, 0, -90])
      union() {
        l_bracket(lb_double);
        l_bracket_screws(lb_double);
        l_bracket_tnuts(lb_double);
      }
    }

    translate([
      0,
      workholding_size[1] - (3/2) * extrusion_width(workholding_extrusion_type),
      workholding_bed_height
    ])
    rotate([0, 90, 0])
    translate([0, -(1/2) * extrusion_width(workholding_bed_extrusion_type)])
    extrusion(workholding_bed_extrusion_type, workholding_size[0]);
  }
}

module interconnect_workholding_and_length_axis() {
  workholding_leg_positions(skip_last = true)
  translate([
    extrusion_width(workholding_extrusion_type),
    2 * extrusion_width(workholding_extrusion_type),
    (1/2) * extrusion_width(workholding_extrusion_type),
  ])
  rotate([180, 0, 0])
  union() {
    l_bracket(lb_double);
    l_bracket_screws(lb_double);
    l_bracket_tnuts(lb_double);
  }

  workholding_leg_positions(skip_first = true)
  translate([
    -extrusion_width(workholding_extrusion_type),
    0,
    (1/2) * extrusion_width(workholding_extrusion_type),
  ])
  rotate([0, 180, 0])
  union() {
    l_bracket(lb_double);
    l_bracket_screws(lb_double);
    l_bracket_tnuts(lb_double);
  }
}

module workholding_leg_positions(skip_first = false, skip_last = false) {
  translate([0, 0, -(1/2) * extrusion_width(workholding_extrusion_type)])
  union() {
    for (leg_index = [0 : workholding_leg_count - 1]) {
      if (leg_index == 0 && skip_first == true) {}
      else if (leg_index == workholding_leg_count - 1 && skip_last == true) {}
      else {
        translate([
          ((leg_index / (workholding_leg_count - 1)) - (1/2)) * (workholding_size[0] - extrusion_height(workholding_extrusion_type)),
          0,
          0,
        ])
        children();
      }
    }
  }
}

//! Main assembly
module main_assembly()
assembly("main") {
  translate(length_axis_offset)
  length_axis_assembly();

  translate(width_axis_offset)
  width_axis_assembly();

  translate(spindle_offset)
  spindle_assembly();

  workholding_assembly();
  interconnect_workholding_and_length_axis();
}

if($preview) {
  main_assembly();
}
