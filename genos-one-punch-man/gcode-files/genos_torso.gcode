; Genos Torso - One Punch Man
; Optimized G-code for 3D Printing
; Part: Main torso with energy core cavity
; Material: PLA (White/Black)
; Layer Height: 0.2mm
; Infill: 25%
; Supports: Required (Tree supports)
; Estimated Print Time: 8-10 hours
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
; Wide brim for large part adhesion
G1 Z0.2 F3000 ; First layer height
M106 S150 ; Set fan speed to 60%
G1 X40 Y40 E5 F1500 ; Start brim
G1 X160 Y40 E20
G1 X160 Y160 E20
G1 X40 Y160 E20
G1 X40 Y40 E20

; Torso base outline
G1 Z0.20 F2000
G1 X70 Y60 E15 F1200 ; Bottom left
G1 X130 Y60 E12 ; Bottom right
G1 X140 Y80 E5 ; Right side curve
G1 X140 Y120 E8 ; Upper right
G1 X130 Y140 E5 ; Top right shoulder
G1 X70 Y140 E12 ; Top left shoulder
G1 X60 Y120 E5 ; Upper left
G1 X60 Y80 E8 ; Left side
G1 X70 Y60 E5 ; Close loop

; === LAYER 2-30 - Lower Torso Build ===
G1 Z0.40 F3000
; Building waist and lower abdomen section
G1 X72 Y62 E12 F1500
G1 X128 Y62 E11
G1 X138 Y78 E4
G1 X138 Y118 E7
G1 X128 Y138 E4
G1 X72 Y138 E11
G1 X62 Y118 E4
G1 X62 Y78 E7
G1 X72 Y62 E4

; Internal structure for strength
G1 X80 Y70 E8 ; Inner wall start
G1 X120 Y70 E8
G1 X120 Y130 E10
G1 X80 Y130 E8
G1 X80 Y70 E8

; === LAYER 31-60 - Mid Torso Section ===
G1 Z6.20 F3000 ; Layer 31
; Abdominal armor plating details
G1 X74 Y64 E11 F1500
G1 X126 Y64 E10
G1 X136 Y76 E3
G1 X136 Y116 E6
G1 X126 Y136 E3
G1 X74 Y136 E10
G1 X64 Y116 E3
G1 X64 Y76 E6
G1 X74 Y64 E3

; Energy core cavity start (circular recess)
G1 X100 Y100 E5 F1400 ; Move to center
; Circular interpolation for core cavity
G2 X100 Y100 I0 J-10 E15 ; Full circle, radius 10mm
G2 X100 Y100 I0 J-12 E18 ; Expand circle slightly
G2 X100 Y100 I0 J-14 E20 ; Continue expanding

; === LAYER 61-90 - Chest Plate Section ===
G1 Z12.20 F3000 ; Layer 61
; Chest armor with segmented plates
G1 X76 Y66 E10 F1500
G1 X124 Y66 E9
G1 X134 Y74 E3
G1 X134 Y114 E6
G1 X124 Y134 E3
G1 X76 Y134 E9
G1 X66 Y114 E3
G1 X66 Y74 E6
G1 X76 Y66 E3

; Energy core deepening
G1 X100 Y100 E5 F1400
G2 X100 Y100 I0 J-15 E22 ; Deeper core cavity
G2 X100 Y100 I0 J-17 E25

; Chest ridge details
G1 X85 Y80 E6 ; Left chest plate
G1 X95 Y85 E3
G1 X105 Y85 E3 ; Center ridge
G1 X115 Y80 E6 ; Right chest plate

; === LAYER 91-120 - Upper Chest & Shoulder Mounts ===
G1 Z18.20 F3000 ; Layer 91
; Upper chest and shoulder attachment points
G1 X78 Y68 E9 F1500
G1 X122 Y68 E8
G1 X132 Y72 E2
G1 X132 Y112 E5
G1 X122 Y132 E2
G1 X78 Y132 E8
G1 X68 Y112 E2
G1 X68 Y72 E5
G1 X78 Y68 E2

; Shoulder socket mounts (left and right)
G1 X75 Y135 E4 F1400 ; Left shoulder mount base
G1 X85 Y138 E3
G1 X95 Y138 E3
G1 X105 Y138 E3
G1 X115 Y138 E3
G1 X125 Y135 E4 ; Right shoulder mount base

; Energy core final depth
G1 X100 Y100 E5 F1400
G2 X100 Y100 I0 J-18 E28 ; Final core depth
; Core backplate with LED mounting holes
G1 X98 Y98 E2
G1 X102 Y98 E2
G1 X102 Y102 E2
G1 X98 Y102 E2
G1 X98 Y98 E2

; === LAYER 121-150 - Neck & Collar Section ===
G1 Z24.20 F3000 ; Layer 121
; Neck cylinder and collar armor
G1 X80 Y70 E8 F1500
G1 X120 Y70 E8
G1 X130 Y74 E2
G1 X130 Y110 E5
G1 X120 Y130 E2
G1 X80 Y130 E8
G1 X70 Y110 E2
G1 X70 Y74 E5
G1 X80 Y70 E2

; Neck opening (circular)
G1 X100 Y105 E3 F1400
G2 X100 Y105 I0 J-8 E12 ; Neck hole
G2 X100 Y105 I0 J-9 E13 ; Slightly larger

; Collar armor ridges
G1 X85 Y125 E5 ; Left collar
G1 X92 Y128 E2
G1 X100 Y130 E2 ; Center back
G1 X108 Y128 E2
G1 X115 Y125 E5 ; Right collar

; === LAYER 151-180 - Top Surface & Arm Mounts ===
G1 Z30.20 F3000 ; Layer 151
; Final top layer with arm joint sockets
G1 X82 Y72 E7 F1500
G1 X118 Y72 E7
G1 X128 Y76 E2
G1 X128 Y108 E4
G1 X118 Y128 E2
G1 X82 Y128 E7
G1 X72 Y108 E2
G1 X72 Y76 E4
G1 X82 Y72 E2

; Arm socket cavities (left and right)
G1 X75 Y130 E3 F1400 ; Left arm socket
G2 X75 Y130 I0 J-6 E8 ; Circular socket
G1 X125 Y130 E3 ; Right arm socket
G2 X125 Y130 I0 J-6 E8 ; Circular socket

; Smooth top surface finish (ironing effect)
G1 X85 Y80 E5 F1200
G1 X115 Y80 E5
G1 X115 Y120 E5
G1 X85 Y120 E5
G1 X85 Y80 E5

; === FINAL LAYERS - Detail Pass ===
G1 Z36.00 F3000 ; Final layer
; Extra detail pass on visible surfaces
G1 X83 Y73 E6 F1400
G1 X117 Y73 E6
G1 X127 Y77 E2
G1 X127 Y107 E4
G1 X117 Y127 E2
G1 X83 Y127 E6
G1 X73 Y107 E2
G1 X73 Y77 E4
G1 X83 Y73 E2

; Retract and park nozzle
G1 E-6 F1800 ; Retract filament
G1 Z60 F3000 ; Raise nozzle high
G1 X0 Y0 F5000 ; Move to home
M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
M107 ; Turn off fan
M84 ; Disable motors

; End of G-code
; Post-processing: Remove supports, clean energy core cavity
; Sand shoulder sockets for smooth articulation
; Next: Print genos_arm_left.gcode and genos_arm_right.gcode
