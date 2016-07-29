// data
mm = 1e-3;
lenc = 5*mm;
factor = 3 ;
lenc2 = lenc/factor;

B = 100*mm;
H = 50*mm;
b = B/factor;
h = H/factor;

// points
Point(1) = {0,0,0,lenc2};
Point(2) = {b,0,0,lenc2};
Point(3) = {b,h,0,lenc2};
Point(4) = {0,h,0,lenc2};

Point(5) = {B,0,0,lenc};
Point(6) = {B,H,0,lenc};
Point(7) = {0,H,0,lenc};


Printf('Points drawn...');

//lines
Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,1};

Line(5) = {2,5};
Line(6) = {5,6};
Line(7) = {6,7};
Line(8) = {7,4};

Printf('Lines drawn...');

// surfaces
Line Loop(1) = {1,2,3,4}; // dielectric
Plane Surface(1) = {1};

Line Loop(2) = {5,6,7,8,-3,-2}; // air
Plane Surface(2) = {2};

Printf('Surfaces drawn...');


// physical objects (link to GetDP)
Physical Surface(101) = {1}; // dielectric
Physical Surface(102) = {2}; // air
Physical Line(103) = {1,5}; // bottom ground
Physical Line(104) = {7}; // upper electrode

Printf('Physical objects created...');

// mesh refinements
Characteristic Length {3} = lenc2/factor;
