// din mounts:
//
// NOTE: length is direction of din rail.
//
// drg-01:
// - https://www.gotronik.pl/drg-01-uchwyt-mocujacy-na-szyne-din-35mm-p-6660.html

function drg_length(type) = type[2];
function drg_width(type) = type[3];
function drg_hole_radius(type) = type[4];
function drg_hole_positions_list(type) = type[5];

drg_01 = [
  "DRG-01",
  "DRG-01",
  10,
  43,
  (1/2) * 2.75,
  [
    [5, -(1/2) * 25],
    [5, 0],
    [5, (1/2) * 25],
  ],
];

module drg_mount(type, mount_length, mount_width, mount_thickness, mount_hole_radius, mount_hole_positions_list, hole_spacer_radius, hole_spacer_thickness) {
  width = max(drg_width(type), mount_width);

  translate([
    -drg_length(type),
    0,
  ])
  union() {
    linear_extrude(mount_thickness)
      difference() {
        translate([
          0,
          -(1/2) * width,
        ])
        square([
          2 * drg_length(type) + mount_length,
          width,
        ]);

        for (position = mount_hole_positions_list) {
          translate(position)
          circle(r = mount_hole_radius);
        }

        drg_holes(type);

        translate([
          drg_length(type) + mount_length,
          0,
        ])
        drg_holes(type);
      }

      linear_extrude(mount_thickness + hole_spacer_thickness)
      union() {
        for (position = mount_hole_positions_list) {
          translate(position)
          difference() {
            circle(r = hole_spacer_radius);
            circle(r = mount_hole_radius);
          }
        }
      }
    }
}

module drg_hole_positions(type) {
  for (position = drg_hole_positions_list(type)) {
    translate(position)
      children();
  }
}

module drg_holes(type) {
  drg_hole_positions(type)
    drg_hole(type);
}

module drg_hole(type) {
  circle(r = drg_hole_radius(type));
}
