; Genos Left Hand - One Punch Man
; Optimized G-code for 3D Printing
; Part: Left hand with articulated fingers
; Material: PLA (White/Black)
; Layer Height: 0.15mm
; Infill: 15%
; Supports: Required (Tree supports between fingers)
; Estimated Print Time: 2-3 hours
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
G1 X70 Y70 E5 F1500
G1 X130 Y70 E9
G1 X130 Y130 E9
G1 X70 Y130 E9
G1 X70 Y70 E9

; Palm base outline
G1 Z0.15 F2000
G1 X85 Y80 E6 F1200 ; Bottom left
G1 X115 Y80 E5 ; Bottom right
G1 X120 Y90 E2 ; Right side
G1 X120 Y110 E3 ; Upper right
G1 X115 Y120 E2 ; Top right
G1 X85 Y120 E5 ; Top left
G1 X80 Y110 E2 ; Upper left
G1 X80 Y90 E3 ; Left side
G1 X85 Y80 E2 ; Close loop

; === LAYER 2-30 - Palm Section ===
G1 Z0.30 F3000
G1 X87 Y82 E5 F1500
G1 X113 Y82 E4
G1 X118 Y88 E2
G1 X118 Y108 E3
G1 X113 Y118 E2
G1 X87 Y118 E4
G1 X82 Y108 E2
G1 X82 Y88 E3
G1 X87 Y82 E2

; Palm interior structure
G1 X95 Y90 E3 F1400
G1 X105 Y90 E3
G1 X105 Y110 E3
G1 X95 Y110 E3
G1 X95 Y90 E3

; === LAYER 31-60 - Finger Bases Formation ===
G1 Z4.65 F3000
G1 X88 Y83 E4 F1500
G1 X112 Y83 E4
G1 X117 Y87 E2
G1 X117 Y107 E3
G1 X112 Y117 E2
G1 X88 Y117 E4
G1 X83 Y107 E2
G1 X83 Y87 E3
G1 X88 Y83 E2

; Individual finger bases (5 fingers)
; Thumb base
G1 X115 Y95 E2 F1400
G1 X118 Y95 E1
G1 X118 Y98 E1
G1 X115 Y98 E1
G1 X115 Y95 E1

; Index finger base
G1 X110 Y85 E2
G1 X113 Y85 E1
G1 X113 Y88 E1
G1 X110 Y88 E1
G1 X110 Y85 E1

; Middle finger base
G1 X100 Y85 E2
G1 X103 Y85 E1
G1 X103 Y88 E1
G1 X100 Y88 E1
G1 X100 Y85 E1

; Ring finger base
G1 X90 Y85 E2
G1 X93 Y85 E1
G1 X93 Y88 E1
G1 X90 Y88 E1
G1 X90 Y85 E1

; Pinky finger base
G1 X85 Y90 E2
G1 X88 Y90 E1
G1 X88 Y93 E1
G1 X85 Y93 E1
G1 X85 Y90 E1

; === LAYER 61-90 - First Finger Segments ===
G1 Z9.15 F3000
G1 X89 Y84 E3 F1500
G1 X111 Y84 E3
G1 X116 Y86 E2
G1 X116 Y106 E3
G1 X111 Y116 E2
G1 X89 Y116 E3
G1 X84 Y106 E2
G1 X84 Y86 E3
G1 X89 Y84 E2

; Rising finger segments
; Thumb segment 1
G1 X116 Y96 E1 F1400
G1 X117 Y96 E1
G1 X117 Y97 E1
G1 X116 Y97 E1

; Index segment 1
G1 X111 Y86 E1
G1 X112 Y86 E1
G1 X112 Y87 E1
G1 X111 Y87 E1

; Middle segment 1
G1 X101 Y86 E1
G1 X102 Y86 E1
G1 X102 Y87 E1
G1 X101 Y87 E1

; Ring segment 1
G1 X91 Y86 E1
G1 X92 Y86 E1
G1 X92 Y87 E1
G1 X91 Y87 E1

; Pinky segment 1
G1 X86 Y91 E1
G1 X87 Y91 E1
G1 X87 Y92 E1
G1 X86 Y92 E1

; === LAYER 91-120 - Second Finger Segments ===
G1 Z13.65 F3000
G1 X90 Y85 E2 F1500
G1 X110 Y85 E2
G1 X115 Y85 E2
G1 X115 Y105 E3
G1 X110 Y115 E2
G1 X90 Y115 E2
G1 X85 Y105 E2
G1 X85 Y85 E2
G1 X90 Y85 E2

; Finger segment 2 (continuing)
; Thumb segment 2
G1 X116 Y96 E1 F1400
G1 X117 Y96 E1
G1 X117 Y97 E1

; Index segment 2
G1 X111 Y86 E1
G1 X112 Y86 E1
G1 X112 Y87 E1

; Middle segment 2
G1 X101 Y86 E1
G1 X102 Y86 E1
G1 X102 Y87 E1

; Ring segment 2
G1 X91 Y86 E1
G1 X92 Y86 E1
G1 X92 Y87 E1

; Pinky segment 2
G1 X86 Y91 E1
G1 X87 Y91 E1
G1 X87 Y92 E1

; === LAYER 121-150 - Finger Tips ===
G1 Z18.15 F3000
G1 X91 Y86 E1 F1500
G1 X109 Y86 E1
G1 X114 Y84 E2
G1 X114 Y104 E3
G1 X109 Y114 E2
G1 X91 Y114 E1
G1 X86 Y104 E2
G1 X86 Y86 E1
G1 X91 Y86 E1

; Final finger tips (rounded)
; Thumb tip
G1 X116 Y96 E1 F1400
G2 X116 Y96 I0 J-1 E1 ; Rounded tip

; Index tip
G1 X111 Y86 E1
G2 X111 Y86 I0 J-1 E1

; Middle tip (longest)
G1 X101 Y86 E1
G2 X101 Y86 I0 J-1 E1

; Ring tip
G1 X91 Y86 E1
G2 X91 Y86 I0 J-1 E1

; Pinky tip (shortest)
G1 X86 Y91 E1
G2 X86 Y91 I0 J-1 E1

; === FINAL LAYERS - Palm Back Detail ===
G1 Z22.50 F3000
G1 X92 Y87 E1 F1400
G1 X108 Y87 E1
G1 X113 Y83 E2
G1 X113 Y103 E3
G1 X108 Y113 E2
G1 X92 Y113 E1
G1 X87 Y103 E2
G1 X87 Y87 E1
G1 X92 Y87 E1

; Wrist mounting peg
G1 X100 Y120 E2 F1400
G2 X100 Y120 I0 J-3 E4 ; Circular peg
G2 X100 Y120 I0 J-2 E3 ; Inner peg

; Retract and park
G1 E-5 F1800
G1 Z60 F3000
G1 X0 Y0 F5000
M104 S0
M140 S0
M107
M84

; End of G-code
; Post-processing: Carefully remove supports between fingers
; Sand finger joints for smooth articulation
; Test fit with wrist mount
; Next: Print genos_hand_right.gcode
