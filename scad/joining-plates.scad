// joining plates: https://www.makerstore.com.au/product/joining-plates/


function joining_plate_thickness(type) = type[2];
function joining_plate_polygon_points(type) = type[3];
function joining_plate_center_point(type) = type[4];
function joining_plate_hole_positions_list(type) = type[5];
function joining_plate_hole_radius(type) = type[6];

jp_2_hole = [
  "2 Hole",
  "2 Hole Joining Plate",
  4,
  [
    [0, 0],
    [40, 0],
    [40, 18],
    [0, 18]
  ],
  [10, 9],
  [
    [10, 9],
    [30, 9]
  ],
  M4_clearance_radius
];

jp_3_hole = [
  "3 Hole",
  "3 Hole Joining Plate",
  4,
  [
    [0, 0],
    [60, 0],
    [60, 18],
    [0, 18]
  ],
  [30, 9],
  [
    [10, 9],
    [30, 9],
    [50, 9]
  ],
  M4_clearance_radius
];

jp_5_hole_t = [
  "5 Hole T",
  "5 Hole T Joining Plate",
  4,
  [
    [0, 0],
    [60, 0],
    [60, 20],
    [40, 60],
    [20, 60],
    [0, 20],
  ],
  [30, 10],
  [
    [10, 10],
    [30, 10],
    [30, 30],
    [30, 50],
    [50, 10],
  ],
  M4_clearance_radius
];

jp_5_hole_90d = [
  "5 Hole 90°",
  "5 Hole 90° Joining Plate",
  4,
  [
    [0, 0],
    [60, 0],
    [60, 20],
    [20, 60],
    [0, 60],
  ],
  [10, 10],
  [
    [10, 10],
    [10, 30],
    [10, 50],
    [30, 10],
    [50, 10],
  ],
  M4_clearance_radius
];

jp_7_hole_cross = [
  "7 Hole Cross",
  "7 Hole Cross Joining Plate",
  4,
  [
    [20, 0],
    [40, 0],
    [60, 40],
    [60, 60],
    [40, 100],
    [20, 100],
    [0, 60],
    [0, 40]
  ],
  [30, 50],
  [
    [10, 50],
    [30, 10],
    [30, 30],
    [30, 50],
    [30, 70],
    [30, 90],
    [50, 50],
  ],
  M4_clearance_radius
];

module joining_plate(type) {
  vitamin(str("Joining Plate(", type[0], "): ", type[1]));

  linear_extrude(height = type[2])
    joining_plate_dxf(type);
}

module joining_plate_dxf(type) {
  dxf(str("Joining Plate(", type[0], "): ", type[1]));
  
  translate(-1 * joining_plate_center_point(type))
  difference() {
    polygon(points = joining_plate_polygon_points(type));

    joining_plate_hole_positions(type)
      circle(r = joining_plate_hole_radius(type));
  }
}

module joining_plate_hole_positions(type) {
  for (position = joining_plate_hole_positions_list(type)) {
    translate(position)
      children();
  }
}
