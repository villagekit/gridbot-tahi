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

// sheets
AL10       = [ "AL10",       "Aluminium tooling plate", 10, [0.9, 0.9, 0.9, 1    ], false];

// stepper motors
//                                                                corner  body    boss    boss          shaft               cap         thread black  end    shaft    shaft
//                                                  side, length, radius, radius, radius, depth, shaft, length,      holes, heights,    dia,   caps,  conn,  length2, bore
NEMA23_HG86001Y21B     = ["NEMA23_HG86001Y21B",     56.4, 86,     75.7/2, 35,   38.1/2, 1.6,   6.35,    21,        47.1,    [8,     8], 3,     false, false, 0,       0];

// ball bearings
//          name     id od   w    colour       or    ir    fd   fw
SKF708  = ["SKF708", 8, 22,  7.5, "silver",    0.5,  0.7,   0,    0];

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

    // ball bearing
    translate([(1/2) * B, (1/2) * L, h])
      rotate([-90, 0, 0])
      ball_bearing(SKF708);
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

    // ball bearing
    translate([(1/2) * B, (1/2) * L, h])
      rotate([-90, 0, 0])
      ball_bearing(SKF708);
  }
}
