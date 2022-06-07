include <./joining-plates.scad>;

// ball bearings
BB688ZZ =  ["688ZZ", 8,  16,  5,   "silver",    1.5, 1.5];

// rail carriages
//                     L     L1    W   H   H1   C   B
// HGH20HA_carriage  = [ 92.2, 65.2, 44, 30, 4.6, 50,  32, M5_cap_screw, HGH20CA ];

// shaft_couplings
//                                       L   D       d1   d2
SC_635x8_rigid  = [ "SC_635x8_rigid",    25, 12.5, 6.35,   8 ];


// extrusions
E20100  = [ "E20100", 20, 100,  -4.2,   -3,   8,    6, 12.0,   2,   2, 1,   false ];
E20C = ["E20C", 40, 80, -4.2, -3, 8, 6, 12.0, 2, 2, 1, false ];

// sheets
AL4        = [ "AL4",        "Aluminium tooling plate", 4, [0.9, 0.9, 0.9, 1    ], false];
AL10       = [ "AL10",       "Aluminium tooling plate", 10, [0.9, 0.9, 0.9, 1    ], false];

// stepper motors
//                                                                corner  body    boss    boss          shaft               cap         thread black  end    shaft    shaft
//                                                  side, length, radius, radius, radius, depth, shaft, length,      holes, heights,    dia,   caps,  conn,  length2, bore
NEMA23_HG86001Y21B     = ["NEMA23_HG86001Y21B",     56.4, 86,     75.7/2, 35,   38.1/2, 1.6,   6.35,    21,        47.1,    [8,     8], 3,     false, false, 0,       0];

module extrusion_cbeam(type, length, center = true) {
  vitamin(str("extrusion_cbeam(", type[0], length, "): Extrusion C-Beam ", type[0], " x ", length, "mm"));

  bottom_extrusion_type = [type[0] + "-bottom", type[1] / 2, type[2], type[3], type[4], type[5], type[6], type[7], type[8], type[9], type[10], type[11]];
  side_extrusion_type = [type[0] + "-side", type[1] / 2, type[2] / 2, type[3], type[4], type[5], type[6], type[7], type[8], type[9], type[10], type[11]];

  color(grey(90))
    linear_extrude(length, center = center, convexity = 8)
    union() {
      translate([(1/4) * type[1], 0, 0])
        extrusion_cross_section(bottom_extrusion_type, false);

      translate([0, (3/4) * type[1], 0])
        rotate([0, 0, 90])
        extrusion_cross_section(side_extrusion_type, false);

      translate([0, -(3/4) * type[1], 0])
        rotate([0, 0, 90])
        extrusion_cross_section(side_extrusion_type, false);
    }
}

// https://www.hiwin.de/en/Products/Bearing/Bearings-EK-EF/EK/EK08-C5/p/18-000428
// https://salecnc.net/pictures/cnc_accessories/hose/imageSaleCNC/CNC%20PARTS/Ballscrew%20&%20Support/Web%20image/Support%20EK,%20EF/1.EK08%20&%20EF08%20Set%20Ball%20Screw%20Support/2.EK08%20&%20EF08%20Set%20Ball%20Screw%20Support.jpg
module ek08() {
  vitamin(str("Bearing(", "EK08", ") : Bearing EK08 " ));

  d1 = 8;
  L = 23;
  L1 = 7;
  L2 = 26;
  L3 = 4;
  B = 52;
  H = 32;
  b = 26;
  h = 17;
  B1 = 25;
  H1 = 26;
  P = 38;
  X = 6.6;
  Y = 11;
  Z = 12;

  // translate so aligned with screw #1
  color("#313131")
  translate([-(1/2) * (B - P), 0, 0])
  union() {
    difference() {
      // block
      union() {
        cube([B, L, H1]);

        translate([(1/2) * (B - B1), 0, 0])
          cube([B1, L, H]);
      }

      // ball bearing hole
      translate([(1/2) * B, -eps, h])
      rotate([-90, 0, 0])
        cylinder(r = 12, h = L + 2 * eps);

      // screw #1 bore
      translate([(1/2) * (B - P), (1/2) * L, -eps])
      rotate([0, 0, 0])
        cylinder(d = X, h = H1 + 2 * eps);

      // screw #1 cap
      translate([(1/2) * (B - P), (1/2) * L, H - Z])
      rotate([0, 0, 0])
        cylinder(d = Y, h = H1 + 2 * eps);

      // screw #2 bore
      translate([B - (1/2) * (B - P), (1/2) * L, -eps])
      rotate([0, 0, 0])
        cylinder(d = X, h = H1 + 2 * eps);

      // screw #2 cap
      translate([B - (1/2) * (B - P), (1/2) * L, H - Z])
      rotate([0, 0, 0])
        cylinder(d = Y, h = H1 + 2 * eps);
    }
  }
}

// https://salecnc.net/pictures/cnc_accessories/hose/imageSaleCNC/CNC%20PARTS/Ballscrew%20&%20Support/Web%20image/Support%20EK,%20EF/1.EK08%20&%20EF08%20Set%20Ball%20Screw%20Support/2.EK08%20&%20EF08%20Set%20Ball%20Screw%20Support.jpg
module ef08() {
  vitamin(str("Bearing(", "EF08", ") : Bearing EF08 " ));

  d1 = 6;
  L = 14;
  B = 52;
  H = 32;
  b = 26;
  h = 17;
  B1 = 25;
  H1 = 26;
  P = 38;
  X = 6.6;
  Y = 11;
  Z = 12;

  // translate so aligned with screw #1
  color("#313131")
  translate([-(1/2) * (B - P), 0, 0])
  difference() {
    // block
    union() {
      cube([B, L, H1]);

      translate([(1/2) * (B - B1), 0, 0])
        cube([B1, L, H]);
    }

    // ball bearing hole
    translate([(1/2) * B, -eps, h])
    rotate([-90, 0, 0])
      cylinder(r = 12, h = L + 2 * eps);

    // screw #1 bore
    translate([(1/2) * (B - P), (1/2) * L, -eps])
    rotate([0, 0, 0])
      cylinder(d = X, h = H1 + 2 * eps);

    // screw #1 cap
    translate([(1/2) * (B - P), (1/2) * L, H - Z])
    rotate([0, 0, 0])
      cylinder(d = Y, h = H1 + 2 * eps);

    // screw #2 bore
    translate([B - (1/2) * (B - P), (1/2) * L, -eps])
    rotate([0, 0, 0])
      cylinder(d = X, h = H1 + 2 * eps);

    // screw #2 cap
    translate([B - (1/2) * (B - P), (1/2) * L, H - Z])
    rotate([0, 0, 0])
      cylinder(d = Y, h = H1 + 2 * eps);
  }
}

spindle_er20_height = 62;
spindle_er20_width = 60;
spindle_er20_body_length = 155;
spindle_er20_total_length = 241.5;
spindle_er20_collet_length = 42.5;
spindle_er20_collet_diameter = 30;
spindle_er20_shaft_length = spindle_er20_total_length - spindle_er20_body_length - spindle_er20_collet_length;
spindle_er20_shaft_diameter = 14;

// https://www.aliexpress.com/item/1005001278002287.html
module spindle_er20() {
  vitamin(str("Spindle(", "ER20", ") : Spindle ER20"));

  difference() {
    union() {
      // body
      color("#066E06")
      translate([0, -(1/2) * spindle_er20_width, 0])
        rounded_cube_yz([spindle_er20_body_length, spindle_er20_width, spindle_er20_height], r = 10);

      // shaft
      color("#919191")
      translate([-spindle_er20_shaft_length, 0, (1/2) * spindle_er20_height])
        rotate([0, 90, 0])
        cylinder(d = spindle_er20_shaft_diameter, h = spindle_er20_shaft_length);

      // collet 1/2
      color("#A8A8A8")
        translate([spindle_er20_body_length, 0, (1/2) * spindle_er20_height])
        rotate([0, 90, 0])
        cylinder(d = spindle_er20_collet_diameter, h = (1/2) * spindle_er20_collet_length);

      // collet 2/2
      color("#3D3D3D")
        translate([spindle_er20_body_length + (1/2) * spindle_er20_collet_length, 0, (1/2) * spindle_er20_height])
        rotate([0, 90, 0])
        cylinder(d = spindle_er20_collet_diameter, h = (1/2) * spindle_er20_collet_length);
    }
  }
}
