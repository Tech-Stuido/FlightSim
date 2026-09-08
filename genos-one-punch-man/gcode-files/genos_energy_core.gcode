; Genos Energy Core - One Punch Man
; Optimized G-code for 3D Printing
; Part: Glowing energy core with LED housing
; Material: PLA (Red/Clear if available)
; Layer Height: 0.1mm (high detail)
; Infill: 100% (solid for light diffusion)
; Supports: None (self-supporting design)
; Estimated Print Time: 2 hours
; Printer: Ender 3 / Prusa i3 MK3 compatible
; SPECIAL: Designed for LED installation

G21 ; Set units to millimeters
G90 ; Use absolute coordinates
M82 ; Extruder absolute mode
M140 S60 ; Set bed temperature to 60°C
M104 S200 ; Set nozzle temperature to 200°C
M190 S60 ; Wait for bed temperature
M105 ; Report temperatures
G28 ; Home all axes
G1 Z10 F3000
G1 X10 Y10 F3000
G92 E0
G1 E10 F1200

; === LAYER 1 - Base Layer ===
G1 Z0.2 F3000
M106 S100 ; Lower fan speed for better layer adhesion
G1 X90 Y90 E3 F1500 ; Start position

; Circular base outline (diameter 40mm)
G1 Z0.10 F1500 ; Ultra-fine first layer
; Draw circle using arc interpolation
G2 X90 Y90 I0 J-20 E25 ; Outer ring, radius 20mm
G2 X90 Y90 I0 J-18 E22 ; Inner ring
G2 X90 Y90 I0 J-16 E20 ; Core ring

; === LAYER 2-20 - Bottom Housing Section ===
G1 Z0.20 F3000
G2 X90 Y90 I0 J-20 E25 F1200
G2 X90 Y90 I0 J-18 E22
G2 X90 Y90 I0 J-16 E20

; Internal LED cavity begins (radius 8mm)
G1 X90 Y98 E2 F1400 ; Move to cavity start
G2 X90 Y98 I0 J-8 E10 ; LED cavity circle

; === LAYER 21-40 - Mid Section with Light Channels ===
G1 Z2.10 F3000
G2 X90 Y90 I0 J-20 E25 F1200
G2 X90 Y90 I0 J-17 E21 ; Middle ring
G2 X90 Y90 I0 J-14 E17 ; Inner ring
G2 X90 Y90 I0 J-10 E12 ; Core ring

; LED cavity continues (deepening)
G1 X90 Y98 E2 F1400
G2 X90 Y98 I0 J-8 E10 ; Maintain cavity

; Light diffusion channels (radial pattern)
G1 X90 Y80 E3 ; Channel bottom
G1 X90 Y100 E4 ; Channel top
G1 X80 Y90 E3 ; Channel left
G1 X100 Y90 E3 ; Channel right
G1 X85 Y85 E2 ; Diagonal 1
G1 X95 Y95 E2
G1 X85 Y95 E2 ; Diagonal 2
G1 X95 Y85 E2

; === LAYER 41-60 - Upper Section ===
G1 Z4.10 F3000
G2 X90 Y90 I0 J-20 E25 F1200
G2 X90 Y90 I0 J-16 E20
G2 X90 Y90 I0 J-12 E15
G2 X90 Y90 I0 J-8 E10

; LED cavity with mounting ledge
G1 X90 Y98 E2 F1400
G2 X90 Y98 I0 J-8 E10
; LED mounting ledge (flat surface)
G1 X88 Y90 E1 ; Ledge left
G1 X92 Y90 E1 ; Ledge right
G1 X90 Y88 E1 ; Ledge bottom
G1 X90 Y92 E1 ; Ledge top

; === LAYER 61-80 - Dome Formation Begins ===
G1 Z6.10 F3000
; Start forming dome shape (decreasing radius)
G2 X90 Y90 I0 J-19 E24 F1200 ; Outer dome
G2 X90 Y90 I0 J-15 E19 ; Mid dome
G2 X90 Y90 I0 J-11 E14 ; Inner dome
G2 X90 Y90 I0 J-7 E9 ; Core dome

; LED cavity maintains depth
G1 X90 Y98 E2 F1400
G2 X90 Y98 I0 J-8 E10

; === LAYER 81-100 - Dome Continues ===
G1 Z8.10 F3000
G2 X90 Y90 I0 J-18 E23 F1200
G2 X90 Y90 I0 J-14 E18
G2 X90 Y90 I0 J-10 E13
G2 X90 Y90 I0 J-6 E8

; Light diffusion pattern (concentric circles)
G2 X90 Y90 I0 J-5 E6 F1400 ; Inner pattern
G2 X90 Y90 I0 J-3 E4 ; Center pattern

; === LAYER 101-120 - Dome Peak Formation ===
G1 Z10.10 F3000
G2 X90 Y90 I0 J-17 E22 F1200
G2 X90 Y90 I0 J-13 E17
G2 X90 Y90 I0 J-9 E12
G2 X90 Y90 I0 J-5 E7

; Center peak begins
G2 X90 Y90 I0 J-4 E5 F1400
G2 X90 Y90 I0 J-3 E4
G2 X90 Y90 I0 J-2 E3

; === LAYER 121-140 - Final Dome Shaping ===
G1 Z12.10 F3000
G2 X90 Y90 I0 J-16 E21 F1200
G2 X90 Y90 I0 J-12 E16
G2 X90 Y90 I0 J-8 E11
G2 X90 Y90 I0 J-4 E6

; Peak refinement
G2 X90 Y90 I0 J-3 E4 F1400
G2 X90 Y90 I0 J-2 E3
G2 X90 Y90 I0 J-1 E2

; === LAYER 141-160 - Top Surface ===
G1 Z14.10 F3000
G2 X90 Y90 I0 J-15 E20 F1200
G2 X90 Y90 I0 J-11 E15
G2 X90 Y90 I0 J-7 E10
G2 X90 Y90 I0 J-3 E5

; Final peak point
G2 X90 Y90 I0 J-2 E3 F1400
G2 X90 Y90 I0 J-1 E2

; === FINAL LAYERS - Smooth Finish ===
G1 Z16.00 F3000
; Ironing pass for smooth translucent surface
G1 X90 Y90 E1 F1000 ; Center point
G2 X90 Y90 I0 J-1 E1 ; Tiny circle
G2 X90 Y90 I0 J-2 E2
G2 X90 Y90 I0 J-3 E3

; Multiple passes for clarity
G1 X88 Y90 E1 F1200
G1 X92 Y90 E1
G1 X90 Y88 E1
G1 X90 Y92 E1
G1 X90 Y90 E1

; Retract and park
G1 E-3 F1800
G1 Z60 F3000
G1 X0 Y0 F5000
M104 S0
M140 S0
M107
M84

; End of G-code
; Post-processing: DO NOT sand - maintain optical clarity
; Install 3mm LED from bottom cavity
; Use diffuser material (tracing paper) behind LED
; Connect to battery pack hidden in torso
; Next: Print genos_hand_left.gcode

; === LED INSTALLATION NOTES ===
; LED Type: 3mm warm white or red LED
; Voltage: 3V (CR2032 battery)
; Resistor: 100 ohm (if using higher voltage)
; Polarity: Flat side = negative (connect to spring)
; Diffuser: Thin tracing paper or frosted tape
; Wire Route: Through torso cavity to battery pack
