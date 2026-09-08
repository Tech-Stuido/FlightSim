; Genos Hair - One Punch Man
; Optimized G-code for 3D Printing
; Part: Signature blonde spiky hair
; Material: PLA (Yellow/Gold)
; Layer Height: 0.15mm
; Infill: 15%
; Supports: Minimal (Tree supports for spikes)
; Estimated Print Time: 3-4 hours
; Printer: Ender 3 / Prusa i3 MK3 compatible

G21 ; Set units to millimeters
G90 ; Use absolute coordinates
M82 ; Extruder absolute mode
M140 S60 ; Set bed temperature to 60°C
M104 S200 ; Set nozzle temperature to 200°C (yellow PLA)
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
G1 X60 Y60 E5 F1500
G1 X140 Y60 E12
G1 X140 Y140 E12
G1 X60 Y140 E12
G1 X60 Y60 E12

; Hair base outline (circular with spike mounts)
G1 Z0.15 F2000
G1 X100 Y70 E8 F1200 ; Bottom center
G1 X115 Y72 E3 ; Right bottom
G1 X130 Y80 E4 ; Right side spike mount
G1 X135 Y100 E3 ; Right mid
G1 X130 Y120 E4 ; Right top spike mount
G1 X115 Y128 E3 ; Top right
G1 X100 Y130 E3 ; Top center spike
G1 X85 Y128 E3 ; Top left
G1 X70 Y120 E4 ; Left top spike mount
G1 X65 Y100 E3 ; Left mid
G1 X70 Y80 E4 ; Left side spike mount
G1 X85 Y72 E3 ; Left bottom
G1 X100 Y70 E3 ; Close loop

; === LAYER 2-30 - Lower Hair Section ===
G1 Z0.30 F3000
G1 X100 Y72 E7 F1500
G1 X113 Y74 E3
G1 X128 Y82 E3
G1 X133 Y98 E3
G1 X128 Y118 E3
G1 X113 Y126 E3
G1 X100 Y128 E3
G1 X87 Y126 E3
G1 X72 Y118 E3
G1 X67 Y98 E3
G1 X72 Y82 E3
G1 X87 Y74 E3
G1 X100 Y72 E3

; Internal support structure
G1 X90 Y85 E4 F1400
G1 X110 Y85 E4
G1 X110 Y115 E5
G1 X90 Y115 E4
G1 X90 Y85 E4

; === LAYER 31-60 - Mid Hair Section ===
G1 Z4.65 F3000
G1 X100 Y74 E6 F1500
G1 X112 Y76 E3
G1 X126 Y84 E3
G1 X131 Y96 E3
G1 X126 Y116 E3
G1 X112 Y124 E3
G1 X100 Y126 E3
G1 X88 Y124 E3
G1 X74 Y116 E3
G1 X69 Y96 E3
G1 X74 Y84 E3
G1 X88 Y76 E3
G1 X100 Y74 E3

; Spike base formations (8 directional spikes)
; Back-right spike base
G1 X125 Y90 E3 F1400
G1 X128 Y95 E2
G1 X125 Y100 E2
G1 X122 Y95 E2
G1 X125 Y90 E2

; Front-right spike base
G1 X120 Y80 E3
G1 X123 Y83 E2
G1 X120 Y86 E2
G1 X117 Y83 E2
G1 X120 Y80 E2

; Front spike base
G1 X100 Y75 E3
G1 X103 Y78 E2
G1 X100 Y81 E2
G1 X97 Y78 E2
G1 X100 Y75 E2

; Front-left spike base
G1 X80 Y80 E3
G1 X83 Y83 E2
G1 X80 Y86 E2
G1 X77 Y83 E2
G1 X80 Y80 E2

; Back-left spike base
G1 X75 Y90 E3
G1 X78 Y95 E2
G1 X75 Y100 E2
G1 X72 Y95 E2
G1 X75 Y90 E2

; === LAYER 61-90 - Upper Hair & Spike Development ===
G1 Z9.15 F3000
G1 X100 Y76 E5 F1500
G1 X111 Y78 E3
G1 X124 Y86 E3
G1 X129 Y94 E3
G1 X124 Y114 E3
G1 X111 Y122 E3
G1 X100 Y124 E3
G1 X89 Y122 E3
G1 X76 Y114 E3
G1 X71 Y94 E3
G1 X76 Y86 E3
G1 X89 Y78 E3
G1 X100 Y76 E3

; Rising spike structures
; Right spike rising
G1 X128 Y95 E2 F1400
G1 X130 Y95 E1
G1 X130 Y97 E1
G1 X128 Y97 E1
G1 X128 Y95 E1

; Front-right spike rising
G1 X122 Y83 E2
G1 X124 Y83 E1
G1 X124 Y85 E1
G1 X122 Y85 E1
G1 X122 Y83 E1

; Center spike rising
G1 X100 Y78 E2
G1 X102 Y78 E1
G1 X102 Y80 E1
G1 X100 Y80 E1
G1 X100 Y78 E1

; Front-left spike rising
G1 X78 Y83 E2
G1 X80 Y83 E1
G1 X80 Y85 E1
G1 X78 Y85 E1
G1 X78 Y83 E1

; Left spike rising
G1 X72 Y95 E2
G1 X74 Y95 E1
G1 X74 Y97 E1
G1 X72 Y97 E1
G1 X72 Y95 E1

; === LAYER 91-120 - Spike Tips Formation ===
G1 Z13.65 F3000
G1 X100 Y78 E4 F1500
G1 X110 Y80 E3
G1 X122 Y88 E3
G1 X127 Y92 E2
G1 X122 Y112 E3
G1 X110 Y120 E3
G1 X100 Y122 E3
G1 X90 Y120 E3
G1 X78 Y112 E3
G1 X73 Y92 E2
G1 X78 Y88 E3
G1 X90 Y80 E3
G1 X100 Y78 E3

; Spike tip detailing (tapering)
; Right spike tip
G1 X130 Y95 E1 F1400
G1 X131 Y95 E1
G1 X131 Y96 E1
G1 X130 Y96 E1

; Front-right spike tip
G1 X124 Y83 E1
G1 X125 Y83 E1
G1 X125 Y84 E1
G1 X124 Y84 E1

; Center spike tip (longest)
G1 X100 Y78 E1
G1 X101 Y78 E1
G1 X101 Y79 E1
G1 X102 Y79 E1
G1 X102 Y78 E1

; Front-left spike tip
G1 X76 Y83 E1
G1 X77 Y83 E1
G1 X77 Y84 E1
G1 X76 Y84 E1

; Left spike tip
G1 X70 Y95 E1
G1 X71 Y95 E1
G1 X71 Y96 E1
G1 X70 Y96 E1

; === LAYER 121-150 - Final Spike Sharpening ===
G1 Z18.15 F3000
G1 X100 Y80 E3 F1500
G1 X109 Y82 E3
G1 X120 Y90 E2
G1 X120 Y110 E2
G1 X109 Y118 E3
G1 X100 Y120 E3
G1 X91 Y118 E3
G1 X80 Y110 E2
G1 X80 Y90 E2
G1 X91 Y82 E3
G1 X100 Y80 E3

; Final spike points
; Each spike narrows to sharp point
G1 X129 Y95 E1 F1400 ; Right
G1 X123 Y84 E1 ; Front-right
G1 X101 Y79 E1 ; Center (highest)
G1 X77 Y84 E1 ; Front-left
G1 X71 Y95 E1 ; Left

; Back spikes (additional detail)
G1 X100 Y120 E1 ; Back center
G1 X110 Y115 E1 ; Back right
G1 X90 Y115 E1 ; Back left

; === FINAL LAYERS - Smooth Surface ===
G1 Z22.50 F3000
G1 X100 Y81 E2 F1400
G1 X108 Y83 E2
G1 X118 Y91 E2
G1 X118 Y109 E2
G1 X108 Y117 E2
G1 X100 Y119 E2
G1 X92 Y117 E2
G1 X82 Y109 E2
G1 X82 Y91 E2
G1 X92 Y83 E2
G1 X100 Y81 E2

; Retract and park
G1 E-5 F1800
G1 Z60 F3000
G1 X0 Y0 F5000
M104 S0
M140 S0
M107
M84

; End of G-code
; Post-processing: Carefully remove tree supports from spikes
; Lightly sand spike tips for smooth finish
; Next: Print genos_hand_left.gcode and genos_hand_right.gcode
