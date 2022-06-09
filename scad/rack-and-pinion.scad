//! Via BulkMan3D: https://bulkman3d.com/product/module-1-0-gear-rack-external/
module external_gear_rack() {
  vitamin(str("Gear rack(External, Module 1.0, 500mm) : External Gear Rack" ));

  mod = 1;
  height = 10;
  width = 20;
  length = 499.51;
  hole_diameter = 5;
  hole_inset_diameter = 9;
  hole_inset_height = 2;

  difference() {
    translate([0, width])
    linear_extrude(height = height)
    involute_rack_profile(m = mod, z = length / PI, w = width);

    external_gear_rack_hole_positions(length)
    union() {
      translate([0, 0, -eps])
      cylinder(d = hole_diameter, h = height + 2 * eps);

      translate([0, 0, height - hole_inset_height])
      cylinder(d = hole_inset_diameter, h = hole_inset_height + eps);
    }
  }
}

module external_gear_rack_hole_positions(length) {
    for (i = [0: 2]) {
      translate([10 + i * 100, 10])
      children();
    }

    for (i = [0: 2]) {
      translate([length - (10 + i * 100), 10, 0])
      children();
    }
}

//! Via MakerStore: https://www.makerstore.com.au/product/plate-motor-rack/
module gear_rack_motor_mount_plate() {
  vitamin(str("Gear Rack Motor Mount Plate" ));

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

function pinion_gear_teeth(type) = type[2];
function pinion_gear_module(type) = type[3];
function pinion_gear_pitch_angle(type) = type[4];
function pinion_gear_tooth_height(type) = type[5];
function pinion_gear_collar_height(type) = type[6];
function pinion_gear_collar_diameter(type) = type[7];
function pinion_gear_screw_type(type) = type[8];
function pinion_gear_screw_height(type) = type[9];
function pinion_gear_bore_diameter(type) = type[10];

function pinion_gear_height(type) = pinion_gear_tooth_height(type) + pinion_gear_collar_height(type);

pinion_gear_16_teeth = [
  "16 Tooth",
  "16 Tooth Pinion Gear",
  16,
  1,
  20,
  10,
  15,
  12.35,
  M5_grub_screw,
  5,
  6.35,
];

pinion_gear_20_teeth = [
  "20 Tooth",
  "20 Tooth Pinion Gear",
  20,
  1,
  20,
  10,
  15,
  12.35,
  M5_grub_screw,
  5,
  6.35,
];

pinion_gear_32_teeth = [
  "32 Tooth",
  "32 Tooth Pinion Gear",
  32,
  1,
  20,
  10,
  15,
  12.35,
  M5_grub_screw,
  5,
  6.35,
];

pinion_gear_40_teeth = [
  "40 Tooth",
  "40 Tooth Pinion Gear",
  40,
  1,
  20,
  10,
  15,
  12.35,
  M5_grub_screw,
  5,
  6.35,
];

//! Via MakerStore: https://www.makerstore.com.au/product/gear-m1/
module pinion_gear(type) {
  vitamin(str("Pinion gear(", type[1], ") : ", type[2]));

  difference() {
    union() {
      linear_extrude(height = pinion_gear_tooth_height(type))
      involute_gear_profile(
        m = pinion_gear_module(type),
        z = pinion_gear_teeth(type),
        pa = pinion_gear_pitch_angle(type)
      );

      translate([0, 0, pinion_gear_tooth_height(type)])
      cylinder(d = pinion_gear_collar_diameter(type), h = pinion_gear_collar_height(type));
    }

    translate([0, 0, -eps])
    cylinder(d = pinion_gear_bore_diameter(type), h = pinion_gear_height(type) + 2 * eps);

    translate([
      0,
      0,
      pinion_gear_tooth_height(type) + (1/2) * pinion_gear_collar_height(type)
    ])
    rotate([0, 90, 0])
    cylinder(r = screw_clearance_radius(pinion_gear_screw_type(type)), h = inf);
  }

  pinion_gear_screw(type);
}

module pinion_gear_screw(type) {
  translate([
    (1/2) * pinion_gear_bore_diameter(type) + pinion_gear_screw_height(type),
    0,
    pinion_gear_tooth_height(type) + (1/2) * pinion_gear_collar_height(type)
  ])
  rotate([0, 90, 0])
  screw(pinion_gear_screw_type(type), pinion_gear_screw_height(type));
}
