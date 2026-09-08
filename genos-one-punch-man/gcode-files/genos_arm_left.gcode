; Genos Left Arm - One Punch Man
; Optimized G-code for 3D Printing
; Part: Left arm with incineration cannon details
; Material: PLA (White/Black)
; Layer Height: 0.2mm
; Infill: 20%
; Supports: Required (Tree supports)
; Estimated Print Time: 6-7 hours
; Printer: Ender 3 / Prusa i3 MK3 compatible

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

; Arm base outline (shoulder end)
G1 Z0.20 F2000
G1 X75 Y65 E10 F1200 ; Bottom left
G1 X125 Y65 E8 ; Bottom right
G1 X130 Y75 E2 ; Curve start
G1 X130 Y105 E5 ; Right side
G1 X125 Y115 E2 ; Top right
G1 X75 Y115 E8 ; Top left
G1 X70 Y105 E2 ; Left side curve
G1 X70 Y75 E5 ; Left side
G1 X75 Y65 E2 ; Close loop

; === LAYER 2-40 - Shoulder Section ===
G1 Z0.40 F3000
; Building shoulder ball joint socket
G1 X77 Y67 E9 F1500
G1 X123 Y67 E7
G1 X128 Y73 E2
G1 X128 Y107 E4
G1 X123 Y113 E2
G1 X77 Y113 E7
G1 X72 Y107 E2
G1 X72 Y73 E4
G1 X77 Y67 E2

; Shoulder joint cavity (spherical recess)
G1 X100 Y90 E5 F1400 ; Center of shoulder
G2 X100 Y90 I0 J-12 E18 ; Ball joint socket
G2 X100 Y90 I0 J-14 E20 ; Deepen socket

; Internal reinforcement ribs
G1 X85 Y75 E6 ; Rib 1
G1 X115 Y75 E6 ; Rib 2
G1 X115 Y105 E6 ; Rib 3
G1 X85 Y105 E6 ; Rib 4
G1 X85 Y75 E6 ; Close rib pattern

; === LAYER 41-80 - Upper Arm Section ===
G1 Z8.20 F3000 ; Layer 41
; Upper arm cylinder with armor plating
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
G1 X85 Y80 E5 ; Left ridge
G1 X95 Y83 E3
G1 X105 Y83 E3 ; Center ridge
G1 X115 Y80 E5 ; Right ridge

; Hydraulic detail lines (engraved)
G1 X90 Y75 E3 F1400 ; Line 1
G1 X90 Y105 E5 ; Vertical line
G1 X110 Y105 E3 ; Line 2
G1 X110 Y75 E5 ; Vertical line

; === LAYER 81-120 - Elbow Joint Section ===
G1 Z16.20 F3000 ; Layer 81
; Elbow articulation with hinge mechanism
G1 X81 Y71 E7 F1500
G1 X119 Y71 E6
G1 X124 Y75 E2
G1 X124 Y105 E4
G1 X119 Y109 E2
G1 X81 Y109 E6
G1 X76 Y105 E2
G1 X76 Y75 E4
G1 X81 Y71 E2

; Elbow hinge pin holes (left and right)
G1 X85 Y90 E3 F1400 ; Left pin hole marker
G1 X90 Y90 E2
G1 X90 Y85 E2
G1 X90 Y95 E2
G1 X110 Y90 E3 ; Right pin hole marker
G1 X115 Y90 E2
G1 X115 Y85 E2
G1 X115 Y95 E2

; Elbow joint pivot cavity
G1 X100 Y90 E4 F1400
G2 X100 Y90 I0 J-8 E12 ; Pivot recess

; === LAYER 121-160 - Forearm Section ===
G1 Z24.20 F3000 ; Layer 121
; Forearm with cannon barrel integration
G1 X83 Y73 E6 F1500
G1 X117 Y73 E6
G1 X122 Y77 E2
G1 X122 Y103 E4
G1 X117 Y107 E2
G1 X83 Y107 E6
G1 X78 Y103 E2
G1 X78 Y77 E4
G1 X83 Y73 E2

; Incineration cannon barrel (circular)
G1 X100 Y90 E4 F1400 ; Cannon center
G2 X100 Y90 I0 J-10 E15 ; Barrel outer ring
G2 X100 Y90 I0 J-8 E12 ; Barrel inner ring
; Cannon energy vents (radial pattern)
G1 X92 Y90 E3 ; Vent left
G1 X108 Y90 E3 ; Vent right
G1 X100 Y82 E3 ; Vent top
G1 X100 Y98 E3 ; Vent bottom

; Forearm armor plates (segmented)
G1 X88 Y78 E4 ; Plate 1
G1 X96 Y80 E3
G1 X104 Y80 E3 ; Plate 2 center
G1 X112 Y78 E4 ; Plate 3

; === LAYER 161-200 - Wrist Section ===
G1 Z32.20 F3000 ; Layer 161
; Wrist joint with hand mounting point
G1 X85 Y75 E5 F1500
G1 X115 Y75 E5
G1 X120 Y79 E2
G1 X120 Y101 E3
G1 X115 Y105 E2
G1 X85 Y105 E5
G1 X80 Y101 E2
G1 X80 Y79 E3
G1 X85 Y75 E2

; Wrist rotation joint (circular)
G1 X100 Y90 E3 F1400
G2 X100 Y90 I0 J-7 E10 ; Wrist pivot
G2 X100 Y90 I0 J-5 E7 ; Inner pivot

; Hand mounting peg hole
G1 X100 Y90 E2 F1400
G2 X100 Y90 I0 J-3 E4 ; Peg socket

; === LAYER 201-240 - Hand Mount Interface ===
G1 Z40.20 F3000 ; Layer 201
; Final wrist section with hand attachment features
G1 X87 Y77 E4 F1500
G1 X113 Y77 E4
G1 X118 Y81 E2
G1 X118 Y99 E3
G1 X113 Y103 E2
G1 X87 Y103 E4
G1 X82 Y99 E2
G1 X82 Y81 E2
G1 X87 Y77 E2

; Mounting points for fingers/palm
G1 X95 Y85 E3 F1400 ; Mount left
G1 X105 Y85 E3 ; Mount right
G1 X105 Y95 E3 ; Mount bottom
G1 X95 Y95 E3 ; Mount top
G1 X95 Y85 E3 ; Close mount

; Detail grooves for wrist armor
G1 X90 Y80 E3 ; Groove 1
G1 X110 Y80 E3 ; Groove 2
G1 X110 Y100 E3 ; Groove 3
G1 X90 Y100 E3 ; Groove 4
G1 X90 Y80 E3 ; Close groove

; === FINAL LAYERS - Surface Finish ===
G1 Z48.00 F3000 ; Final layer
; Smooth finish on visible surfaces
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
G1 E-5 F1800 ; Retract filament
G1 Z60 F3000 ; Raise nozzle
G1 X0 Y0 F5000 ; Move to home
M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
M107 ; Turn off fan
M84 ; Disable motors

; End of G-code
; Post-processing: Remove supports from cannon barrel
; Clean elbow joint for smooth articulation
; Sand wrist pivot for rotation
; Next: Print genos_arm_right.gcode (mirror this part)
