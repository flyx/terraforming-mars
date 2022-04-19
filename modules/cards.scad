module blue_brown() {
  difference() {
    cube([53, 97, 30]);
    translate([2, 2, 2]) cube([22, 93, 30]);
    translate([25, 2, 2]) cube([18, 93, 30]);
    translate([44, 12, 2]) cube([4, 73, 30]);
    translate([48, 48.5, 28]) rotate([0, 90, 0]) cylinder(r=24.5, h=4, center=true, $fn=200);
  }
}

module card_cutout() {
  translate([2, 69, 2]) rotate([90, 0, 0]) linear_extrude(67) polygon([[0,0], [5, 60], [42, 60], [37, 0]]);
}

module toothless(offset) {
  len = offset ? 140.02 : 140;
  min = offset ? -0.01 : 0;

  rotate([90, 0, 0]) linear_extrude(len) polygon([[min, 0], [4, 0], [2, 4 - min], [min, 4 - min]]);
}

module double_black() {
  difference() {
    cube([50, 140, 60]);
    card_cutout();
    translate([0, 69, 0]) card_cutout();
    translate([-0.01, 140.01, 56]) toothless(true);
    translate([50, -0.01, 56]) rotate([0, 0, 180]) toothless(true);
  }
}

module cover() {
  difference() {
    cube([50, 36, 140]);
    translate([2, 2, 2]) cube([46, 36, 140]);
  }
  translate([0, 40, 140]) rotate([90, 0, 0]) toothless(false);
  translate([50, 40, 0]) rotate([-90, 0, 180]) toothless(false);
}