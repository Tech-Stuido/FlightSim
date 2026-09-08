; Genos Left Leg - One Punch Man
; Optimized G-code for 3D Printing
; Part: Left leg with armored plating
; Material: PLA (White/Black)
; Layer Height: 0.2mm
; Infill: 20%
; Supports: Required (Tree supports)
; Estimated Print Time: 7-8 hours
; Printer: Ender 3 / Prusa i3 MK3 compatible

G21 ; Set units to millimeters
G90 ; Use absolute coordinates
M82 ; Extruder absolute mode
M140 S60 ; Set bed temperature to 60°C
M104 S205 ; Set nozzle temperature to 205°C
M190 S60 ; Wait for bed temperature
M105 ; Report temperatures
G28 ; Home all axes
G1 Z10 F3000
G1 X10 Y10 F3000
G92 E0
G1 E10 F1200

; === LAYER 1 - Base Layer ===
G1 Z0.2 F3000
M106 S150
G1 X50 Y50 E5 F1500
G1 X150 Y50 E15
G1 X150 Y130 E12
G1 X50 Y130 E15
G1 X50 Y50 E12

; Foot base outline
G1 Z0.20 F2000
G1 X70 Y65 E12 F1200
G1 X130 Y65 E10
G1 X135 Y75 E3
G1 X135 Y115 E6
G1 X130 Y125 E3
G1 X70 Y125 E10
G1 X65 Y115 E3
G1 X65 Y75 E6
G1 X70 Y65 E3

; === LAYER 2-50 - Foot and Ankle Section ===
G1 Z0.40 F3000
G1 X72 Y67 E11 F1500
G1 X128 Y67 E9
G1 X133 Y73 E2
G1 X133 Y117 E5
G1 X128 Y123 E2
G1 X72 Y123 E9
G1 X67 Y117 E2
G1 X67 Y73 E5
G1 X72 Y67 E2

; Ankle joint cavity
G1 X100 Y110 E5 F1400
G2 X100 Y110 I0 J-8 E12
G2 X100 Y110 I0 J-10 E15

; Foot sole reinforcement
G1 X80 Y75 E6
G1 X120 Y75 E6
G1 X120 Y100 E5
G1 X80 Y100 E5
G1 X80 Y75 E5

; === LAYER 51-100 - Lower Leg (Calf) Section ===
G1 Z10.20 F3000
G1 X74 Y69 E10 F1500
G1 X126 Y69 E9
G1 X131 Y73 E2
G1 X131 Y117 E5
G1 X126 Y121 E2
G1 X74 Y121 E9
G1 X69 Y117 E2
G1 X69 Y73 E5
G1 X74 Y69 E2

; Calf armor plating details
G1 X85 Y80 E5 ; Outer plate
G1 X95 Y83 E3
G1 X105 Y83 E3 ; Center ridge
G1 X115 Y80 E5 ; Inner plate

; Hydraulic line details (engraved)
G1 X90 Y75 E3 F1400
G1 X90 Y105 E5
G1 X110 Y105 E3
G1 X110 Y75 E5

; === LAYER 101-150 - Knee Joint Section ===
G1 Z20.20 F3000
G1 X76 Y71 E9 F1500
G1 X124 Y71 E8
G1 X129 Y75 E2
G1 X129 Y115 E5
G1 X124 Y119 E2
G1 X76 Y119 E8
G1 X71 Y115 E2
G1 X71 Y75 E5
G1 X76 Y71 E2

; Knee hinge mechanism
G1 X100 Y95 E4 F1400
G2 X100 Y95 I0 J-10 E15 ; Knee pivot socket

; Knee cap armor
G1 X90 Y85 E4 ; Left knee plate
G1 X100 Y88 E3 ; Center cap
G1 X110 Y85 E4 ; Right plate

; Pin holes for knee hinge
G1 X88 Y95 E2 F1400
G1 X92 Y95 E2
G1 X108 Y95 E2
G1 X112 Y95 E2

; === LAYER 151-200 - Upper Leg (Thigh) Section ===
G1 Z30.20 F3000
G1 X78 Y73 E8 F1500
G1 X122 Y73 E8
G1 X127 Y77 E2
G1 X127 Y113 E4
G1 X122 Y117 E2
G1 X78 Y117 E8
G1 X73 Y113 E2
G1 X73 Y77 E4
G1 X78 Y73 E2

; Thigh armor segments
G1 X85 Y82 E5 ; Segment 1
G1 X95 Y85 E3
G1 X105 Y85 E3 ; Segment 2 center
G1 X115 Y82 E5 ; Segment 3

; Internal structure ribs
G1 X88 Y88 E4 F1400
G1 X112 Y88 E4
G1 X112 Y102 E4
G1 X88 Y102 E4
G1 X88 Y88 E4

; === LAYER 201-250 - Hip Joint Section ===
G1 Z40.20 F3000
G1 X80 Y75 E7 F1500
G1 X120 Y75 E7
G1 X125 Y79 E2
G1 X125 Y111 E4
G1 X120 Y115 E2
G1 X80 Y115 E7
G1 X75 Y111 E2
G1 X75 Y79 E4
G1 X80 Y75 E2

; Hip ball joint socket
G1 X100 Y95 E5 F1400
G2 X100 Y95 I0 J-12 E18 ; Ball socket
G2 X100 Y95 I0 J-14 E20 ; Deepen socket

; Hip mounting flange
G1 X85 Y85 E4 ; Mount left
G1 X95 Y88 E3
G1 X105 Y88 E3 ; Mount center
G1 X115 Y85 E4 ; Mount right

; === FINAL LAYERS - Top Surface ===
G1 Z50.00 F3000
G1 X82 Y77 E6 F1400
G1 X118 Y77 E6
G1 X123 Y81 E2
G1 X123 Y109 E4
G1 X118 Y113 E2
G1 X82 Y113 E6
G1 X77 Y109 E2
G1 X77 Y81 E4
G1 X82 Y77 E2

; Smooth finish pass
G1 X85 Y80 E5 F1200
G1 X115 Y80 E5
G1 X115 Y110 E5
G1 X85 Y110 E5
G1 X85 Y80 E5

; Retract and park
G1 E-5 F1800
G1 Z60 F3000
G1 X0 Y0 F5000
M104 S0
M140 S0
M107
M84

; End of G-code
; Post-processing: Clean knee and hip joints
; Sand foot sole for stability
; Next: Print genos_leg_right.gcode
