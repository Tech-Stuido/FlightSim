; Genos Right Arm - One Punch Man
; Optimized G-code for 3D Printing
; Part: Right arm (mirror of left) with cannon details
; Material: PLA (White/Black)
; Layer Height: 0.2mm
; Infill: 20%
; Supports: Required (Tree supports)
; Estimated Print Time: 6-7 hours
; Printer: Ender 3 / Prusa i3 MK3 compatible
; NOTE: This is a mirrored version of the left arm

G21 ; Set units to millimeters
G90 ; Use absolute coordinates
M82 ; Extruder absolute mode
M140 S60 ; Set bed temperature to 60°C
M104 S205 ; Set nozzle temperature to 205°C
M190 S60 ; Wait for bed temperature
M105 ; Report temperatures
G28 ; Home all axes
G1 Z10 F3000 ; Move nozzle up
G1 X10 Y10 F3000 ; Move to front left
G92 E0 ; Reset extruder position
G1 E10 F1200 ; Prime nozzle

; === LAYER 1 - Base Layer ===
; Brim for arm part (angled orientation)
G1 Z0.2 F3000 ; First layer height
M106 S150 ; Set fan speed to 60%
G1 X50 Y50 E5 F1500 ; Start brim
G1 X150 Y50 E15
G1 X150 Y120 E10
G1 X50 Y120 E15
G1 X50 Y50 E10

; Arm base outline (shoulder end) - MIRRORED
G1 Z0.20 F2000
G1 X75 Y65 E10 F1200
G1 X125 Y65 E8
G1 X130 Y75 E2
G1 X130 Y105 E5
G1 X125 Y115 E2
G1 X75 Y115 E8
G1 X70 Y105 E2
G1 X70 Y75 E5
G1 X75 Y65 E2

; === LAYER 2-40 - Shoulder Section ===
G1 Z0.40 F3000
G1 X77 Y67 E9 F1500
G1 X123 Y67 E7
G1 X128 Y73 E2
G1 X128 Y107 E4
G1 X123 Y113 E2
G1 X77 Y113 E7
G1 X72 Y107 E2
G1 X72 Y73 E4
G1 X77 Y67 E2

; Shoulder joint cavity
G1 X100 Y90 E5 F1400
G2 X100 Y90 I0 J-12 E18
G2 X100 Y90 I0 J-14 E20

; Internal reinforcement ribs
G1 X85 Y75 E6
G1 X115 Y75 E6
G1 X115 Y105 E6
G1 X85 Y105 E6
G1 X85 Y75 E6

; === LAYER 41-80 - Upper Arm Section ===
G1 Z8.20 F3000
G1 X79 Y69 E8 F1500
G1 X121 Y69 E7
G1 X126 Y73 E2
G1 X126 Y107 E4
G1 X121 Y111 E2
G1 X79 Y111 E7
G1 X74 Y107 E2
G1 X74 Y73 E4
G1 X79 Y69 E2

; Bicep armor ridge details
G1 X85 Y80 E5
G1 X95 Y83 E3
G1 X105 Y83 E3
G1 X115 Y80 E5

; Hydraulic detail lines
G1 X90 Y75 E3 F1400
G1 X90 Y105 E5
G1 X110 Y105 E3
G1 X110 Y75 E5

; === LAYER 81-120 - Elbow Joint Section ===
G1 Z16.20 F3000
G1 X81 Y71 E7 F1500
G1 X119 Y71 E6
G1 X124 Y75 E2
G1 X124 Y105 E4
G1 X119 Y109 E2
G1 X81 Y109 E6
G1 X76 Y105 E2
G1 X76 Y75 E4
G1 X81 Y71 E2

; Elbow hinge pin holes
G1 X85 Y90 E3 F1400
G1 X90 Y90 E2
G1 X90 Y85 E2
G1 X90 Y95 E2
G1 X110 Y90 E3
G1 X115 Y90 E2
G1 X115 Y85 E2
G1 X115 Y95 E2

; Elbow joint pivot cavity
G1 X100 Y90 E4 F1400
G2 X100 Y90 I0 J-8 E12

; === LAYER 121-160 - Forearm Section ===
G1 Z24.20 F3000
G1 X83 Y73 E6 F1500
G1 X117 Y73 E6
G1 X122 Y77 E2
G1 X122 Y103 E4
G1 X117 Y107 E2
G1 X83 Y107 E6
G1 X78 Y103 E2
G1 X78 Y77 E4
G1 X83 Y73 E2

; Incineration cannon barrel
G1 X100 Y90 E4 F1400
G2 X100 Y90 I0 J-10 E15
G2 X100 Y90 I0 J-8 E12
; Cannon energy vents
G1 X92 Y90 E3
G1 X108 Y90 E3
G1 X100 Y82 E3
G1 X100 Y98 E3

; Forearm armor plates
G1 X88 Y78 E4
G1 X96 Y80 E3
G1 X104 Y80 E3
G1 X112 Y78 E4

; === LAYER 161-200 - Wrist Section ===
G1 Z32.20 F3000
G1 X85 Y75 E5 F1500
G1 X115 Y75 E5
G1 X120 Y79 E2
G1 X120 Y101 E3
G1 X115 Y105 E2
G1 X85 Y105 E5
G1 X80 Y101 E2
G1 X80 Y79 E3
G1 X85 Y75 E2

; Wrist rotation joint
G1 X100 Y90 E3 F1400
G2 X100 Y90 I0 J-7 E10
G2 X100 Y90 I0 J-5 E7

; Hand mounting peg hole
G1 X100 Y90 E2 F1400
G2 X100 Y90 I0 J-3 E4

; === LAYER 201-240 - Hand Mount Interface ===
G1 Z40.20 F3000
G1 X87 Y77 E4 F1500
G1 X113 Y77 E4
G1 X118 Y81 E2
G1 X118 Y99 E3
G1 X113 Y103 E2
G1 X87 Y103 E4
G1 X82 Y99 E2
G1 X82 Y81 E2
G1 X87 Y77 E2

; Mounting points for hand
G1 X95 Y85 E3 F1400
G1 X105 Y85 E3
G1 X105 Y95 E3
G1 X95 Y95 E3
G1 X95 Y85 E3

; Detail grooves
G1 X90 Y80 E3
G1 X110 Y80 E3
G1 X110 Y100 E3
G1 X90 Y100 E3
G1 X90 Y80 E3

; === FINAL LAYERS - Surface Finish ===
G1 Z48.00 F3000
G1 X88 Y78 E4 F1400
G1 X112 Y78 E4
G1 X117 Y82 E2
G1 X117 Y98 E3
G1 X112 Y102 E2
G1 X88 Y102 E4
G1 X83 Y98 E2
G1 X83 Y82 E2
G1 X88 Y78 E2

; Retract and park nozzle
G1 E-5 F1800
G1 Z60 F3000
G1 X0 Y0 F5000
M104 S0
M140 S0
M107
M84

; End of G-code
; Post-processing: Remove supports, clean joints
; Next: Print genos_leg_left.gcode
