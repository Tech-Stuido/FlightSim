; Genos Head - One Punch Man
; Optimized G-code for 3D Printing
; Part: Head with detailed facial features
; Material: PLA (White/Yellow)
; Layer Height: 0.15mm
; Infill: 15%
; Supports: Required (Tree supports)
; Estimated Print Time: 4-5 hours
; Printer: Ender 3 / Prusa i3 MK3 compatible

G21 ; Set units to millimeters
G90 ; Use absolute coordinates
M82 ; Extruder absolute mode
M140 S60 ; Set bed temperature to 60°C
M104 S200 ; Set nozzle temperature to 200°C
M190 S60 ; Wait for bed temperature
M105 ; Report temperatures
G28 ; Home all axes
G1 Z10 F3000 ; Move nozzle up
G1 X10 Y10 F3000 ; Move to front left
G92 E0 ; Reset extruder position
G1 E10 F1200 ; Prime nozzle

; === LAYER 1 - Base Layer ===
; Bed adhesion brim
G1 Z0.2 F3000 ; Move to first layer height
M106 S150 ; Set fan speed to 60%
G1 X50 Y50 E5 F1500 ; Start printing brim
G1 X150 Y50 E15
G1 X150 Y150 E15
G1 X50 Y150 E15
G1 X50 Y50 E15

; Head base outline
G1 Z0.15 F2000 ; First layer height
G1 X75 Y75 E10 F1200 ; Move to start position
G1 X125 Y75 E8 ; Bottom edge
G1 X125 Y125 E8 ; Right edge
G1 X75 Y125 E8 ; Top edge
G1 X75 Y75 E8 ; Left edge

; === LAYER 2-50 - Lower Head Structure ===
G1 Z0.30 F3000
; Continue building jaw and lower face structure
G1 X75 Y75 E5 F1500
G1 X125 Y75 E10
G1 X125 Y125 E10
G1 X75 Y125 E10
G1 X75 Y75 E10

; === LAYER 51-100 - Mid Face Section ===
G1 Z7.65 F3000 ; Move to layer 51
; Building cheek and eye socket areas
G1 X80 Y80 E8 F1500
G1 X95 Y85 E5 ; Left eye socket start
G1 X105 Y85 E3
G1 X120 Y80 E5
G1 X120 Y120 E8
G1 X80 Y120 E8

; === LAYER 101-150 - Eye Detail Layer ===
G1 Z15.15 F3000 ; Move to layer 101
; Detailed eye sockets with recessed areas
G1 X82 Y82 E6 F1400
G1 X88 Y84 E2 ; Left eye detail
G1 X92 Y84 E2
G1 X98 Y84 E2 ; Right eye detail
G1 X104 Y84 E2
G1 X118 Y82 E6
G1 X118 Y118 E8
G1 X82 Y118 E8

; === LAYER 151-200 - Upper Face & Nose Bridge ===
G1 Z22.65 F3000 ; Move to layer 151
; Nose bridge and upper cheek definition
G1 X85 Y85 E7 F1500
G1 X90 Y90 E3 ; Nose bridge
G1 X95 Y92 E2
G1 X100 Y92 E2
G1 X105 Y90 E3
G1 X115 Y85 E7
G1 X115 Y115 E7
G1 X85 Y115 E7

; === LAYER 201-250 - Forehead Section ===
G1 Z30.15 F3000 ; Move to layer 201
; Forehead armor plating details
G1 X87 Y87 E8 F1500
G1 X92 Y89 E3 ; Center forehead ridge
G1 X103 Y89 E3
G1 X113 Y87 E8
G1 X113 Y113 E8
G1 X87 Y113 E8

; === LAYER 251-300 - Hair Attachment Points ===
G1 Z37.65 F3000 ; Move to layer 251
; Top of head with hair mounting features
G1 X88 Y88 E8 F1500
G1 X90 Y85 E2 ; Hair mount slots
G1 X110 Y85 E4
G1 X112 Y88 E2
G1 X112 Y112 E8
G1 X88 Y112 E8

; === FINAL LAYERS - Top Surface ===
G1 Z45.00 F3000 ; Final layers
; Smooth top surface finish
G1 X89 Y89 E7 F1400
G1 X111 Y89 E7
G1 X111 Y111 E7
G1 X89 Y111 E7

; Retract and move away
G1 E-5 F1800 ; Retract filament
G1 Z50 F3000 ; Raise nozzle
G1 X0 Y0 F5000 ; Move to home position
M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
M107 ; Turn off fan
M84 ; Disable motors

; End of G-code
; Post-processing: Remove supports, sand eye sockets
; Next: Print genos_hair.gcode
