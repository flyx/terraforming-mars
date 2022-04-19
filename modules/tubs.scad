module hex_tub() {
  difference() {
    linear_extrude(53) polygon([[0, 0], [-10, 17.5], [30, 17.5], [20, 0]]);
    translate([1, 1, 2]) linear_extrude(49) polygon([[0, 0], [-10, 17.5], [28, 17.5], [18, 0]]);
  }
}

module hex() {
  translate([0, 0, 2]) rotate([80, 0, 0]) linear_extrude(3) polygon([[0, 0], [-10, 17.5], [30, 17.5], [20, 0]]);
}

module brown() {
  difference() {
    cube([187, 22, 17.5]);
    for(y=[0:1]) {
      for(x=[0:3]) {
        translate([12 + 48 * x, 3 + 13*y, 0]) hex();
      }
    }
    for(x=[0:2]) {
      translate([36 + 48 * x, 9.5, 0]) hex();
    }
  }
}

module money() {
  difference() {
    union() {
      difference() {
        cube([187, 70, 35]);
        translate([2, 2, -1]) cube([183, 66, 37]);
      }
      difference() {
        cube([187, 70, 7]);
        for(x=[0:2]) {
          translate([32.5 + x*61, 35, 102.5]) rotate([90, 0, 0]) cylinder(center=true, r=100.5, h=66, $fn=200);
        }
      }
      for(x=[0:1]) for (y=[0:1]) {
        translate([x*187 + (x ? -2 : 2), y*70 + (y ? -2 : 2), 17.5]) rotate([0, 0, 45]) cube([30, 30, 35], center=true);
      }
    }
    for (x=[0:1]) for (y=[0:1]) {
      translate([x*187 + 3 * (x ? 0.5 : -0.5), y*70 + (y ? 1 : -1), 17.5]) rotate([0, 0, 45]) cube([34, 34, 36], center=true);
    }
  }
}