include <../variables.scad>;

module numbers_cutout() {
  translate([0,0,-0.5]) for (digit = [0:4]) {
    diagonal = sqrt(player_cube * player_cube * 2);
    translate([diagonal/2 * (digit - digit % 2), diagonal * (digit % 2), 0]) rotate(digit % 2 == 0 ? 45 : -45) rotate([0, -10, 0]) {
      cube([player_cube + 0.6, player_cube + 0.01, 4]);
    }
  }
}

module production() {
  numbers_cutout();
  translate([0, -sqrt(player_cube)*5, 0]) numbers_cutout();
  translate([sqrt(player_cube)*9.5, sqrt(player_cube)*3.9, 0]) rotate(-90) numbers_cutout();
}

module lower_connection() {
  translate([-0.01, 2, 0]) cube([15.01, 2, 2]);
  translate([13, 2, 0]) cube([2, 35.51, 2]);
  translate([-0.01, 35.51, 0]) cube([15.01, 2, 2]);
}

module upper_connection() {
  translate([0, 117.5, 0]) {
    cube([15.01, 2, 2]);
    cube([2, 33, 2]);
    translate([0, 33, 0]) cube([15.01, 2, 2]);
  }
}

module base_left() {
  difference() {
    union() {
      translate([0, 77.5, 0]) cube([97, 97.5, 5]);
      cube([82, 77.51, 5]);
      translate([82, 0, 0]) lower_connection();
    }
    translate([82, 0, -0.01]) upper_connection();
    translate([0, 80, 0]) cylinder(center=true, r=17, h=10.1, $fn=200);
  }
}

module money_cutout() {
  translate([11, 110.5, 3]) {
    translate([0, 0, 1.05]) difference() {
        cylinder(r=5, center=true, h=2.1, $fn=200);
        cylinder(r=4.5, center=true, h=2.1, $fn=200);
    }
    len = sqrt(4.5*4.5 - 2.5*2.5);
    for (r = [0, 90]) {
      rotate(r) {
        translate([-5, -0.25, 0]) cube([9.5, 0.5, 2.1]);
        for (i = [1, -1]) {
          translate([-5.4 + (5 - len), i*2.5 - 0.25, 0]) cube([len * 2.2, 0.5, 2.1]);
        }
      }
    }
    translate([-7.5, -6, 0]) difference() {
      cube([15, 12, 2.1]);
      translate([0.5, 0.5, 0]) cube([14, 11, 2.1]);
    }
    translate([9, -1, 0]) cube([6, 2, 2.1]);
    translate([11, -3, 0]) cube([2, 6, 2.1]);
  }

  translate([47, 98.5, 2]) {
    translate([-sqrt(player_cube)*1.25, -sqrt(player_cube)*4.5, 0]) rotate(90) numbers_cutout();
    production();
  }

  translate([10, 118, 3]) cube([85, 35, 2.1]);
}

module plant_cutout() {
  translate([10, 2, 3]) cube([70, 35, 2.1]);
  translate([30, 57.5, 2]) production();
}

module storage(width) {
  difference() {
    cube([width * 10 - 1, 19, 4.1]);
    translate([-0.5, 9, -0.01]) cube([width * 10, 1, 2.01]);
    for (i=[1:width-1]) {
      translate([i*10 - 1, -0.01, -0.01]) cube([1, 20, 2.01]);
    }
  }
}

module plate_left() {
  difference() {
    base_left();
    translate([16, 154, 1]) storage(8);
    money_cutout();
    translate([10, 77, 3]) cube([120, 1, 2.1]);
    plant_cutout();
  }
}

module base_right() {
  difference() {
    union() {
      translate([15, 77.5, 0]) cube([135, 97.5, 5]);
      cube([150, 77.51, 5]);
      upper_connection();
    }
    translate([0, 0, -0.01]) lower_connection();
    translate([150, 80, 0]) cylinder(center=true, r=17, h=10.1, $fn=200);
  }
}

module material_cutout() {
  translate([0, 19.5, 3]) cube([60, 35, 2.1]);
  translate([7, 0, 2]) production();
}

module power_heat() {
  translate([0, 0, 3]) cube([60, 35, 2.1]);
  translate([10, 55.5, 2]) production();

  translate([62, 0, 0]) {
    translate([0, 0, 3]) cube([75, 35, 2.1]);
    translate([17.5, 55.5, 2]) production();
  }

  translate([59, 17.5, 3]) cube([4, 17.5, 2.1]);
}


module plate_right() {
  difference() {
    base_right();
    translate([17, 154, 1]) storage(12);
    translate([-0.01, 77, 3]) cube([140.01, 1, 2.1]);

    translate([17, 98.5, 0]) {
      material_cutout();
      translate([62, 0, 0]) material_cutout();
    }

    translate([2, 2, 0]) power_heat();

  }
}