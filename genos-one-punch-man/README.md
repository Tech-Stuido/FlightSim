# Genos (One Punch Man) 3D Print Project

A complete 3D printing project for creating a detailed Genos figure from the anime/manga series **One Punch Man**. This project includes optimized G-code files and assembly instructions.

## 🤖 About Genos

Genos is a cyborg hero and the disciple of Saitama in One Punch Man. This model captures his iconic design featuring:
- Sleek cybernetic armor plating
- Glowing energy core details
- Articulated joints for dynamic posing
- Signature blonde hair styling
- Incineration cannon arm attachments

## 📦 Required Supplies

### 3D Printing Materials
| Item | Specification | Quantity | Notes |
|------|---------------|----------|-------|
| PLA Filament (White) | 1.75mm | 400g | Main body armor |
| PLA Filament (Black) | 1.75mm | 200g | Joint sections, details |
| PLA Filament (Yellow/Gold) | 1.75mm | 100g | Hair, energy core accents |
| PLA Filament (Red) | 1.75mm | 50g | Energy core glow effects |
| PLA Filament (Silver/Grey) | 1.75mm | 150g | Mechanical details |

### Printing Supplies
| Item | Purpose |
|------|---------|
| Adhesive (Glue stick/PVA glue) | Bed adhesion |
| Isopropyl Alcohol (99%) | Cleaning prints |
| Painter's tape or PEI sheet | Build surface |
| Sandpaper (200-600 grit) | Smoothing layer lines |
| Primer spray (grey) | Surface preparation |

### Assembly & Post-Processing
| Item | Purpose |
|------|---------|
| Super glue (CA glue) | Bonding parts |
| Epoxy resin | Strong joints, gap filling |
| Acrylic paints (various colors) | Detail painting |
| Paint brushes (fine tip) | Detail work |
| Clear coat (gloss/matte) | Protective finish |
| LED lights (3mm, warm white) | Optional eye/core illumination |
| Thin gauge wire | LED wiring |
| Small battery pack (CR2032) | Optional LED power |

### Tools Required
| Tool | Purpose |
|------|---------|
| Hobby knife/X-Acto knife | Removing supports, cleaning |
| Needle-nose pliers | Support removal |
| Flush cutters | Trimming excess material |
| Tweezers | Small part handling |
| Clamps or rubber bands | Holding parts during gluing |
| Drill (0.5-2mm bits) | Wiring holes for LEDs |
| Soldering iron | Optional LED installation |
| Heat gun or hair dryer | Minor warping correction |

## 🖨️ Print Settings

### Recommended Printer Settings
- **Layer Height**: 0.2mm (0.1mm for fine details)
- **Infill**: 20-25% (PLA)
- **Wall Thickness**: 1.2mm (3 perimeters)
- **Print Speed**: 50-60 mm/s
- **Nozzle Temperature**: 200-210°C (PLA)
- **Bed Temperature**: 60°C
- **Supports**: Tree supports recommended for overhangs
- **Build Plate Adhesion**: Brim for small parts

### Part-Specific Settings
| Part | Layer Height | Infill | Supports | Estimated Time |
|------|--------------|--------|----------|----------------|
| Head | 0.15mm | 15% | Yes | 4-5 hours |
| Torso | 0.2mm | 25% | Yes | 8-10 hours |
| Arms (L/R) | 0.2mm | 20% | Yes | 6-7 hours each |
| Legs (L/R) | 0.2mm | 20% | Yes | 7-8 hours each |
| Hair | 0.15mm | 15% | Minimal | 3-4 hours |
| Hands (L/R) | 0.15mm | 15% | Yes | 2-3 hours each |
| Energy Core | 0.1mm | 100% | No | 2 hours |
| Armor Plates | 0.2mm | 20% | Minimal | 3-4 hours |

**Total Estimated Print Time**: 45-55 hours

## 📁 File Structure

```
genos-one-punch-man/
├── README.md                 # This file
├── gcode-files/              # Ready-to-print G-code files
│   ├── genos_head.gcode
│   ├── genos_torso.gcode
│   ├── genos_arm_left.gcode
│   ├── genos_arm_right.gcode
│   ├── genos_leg_left.gcode
│   ├── genos_leg_right.gcode
│   ├── genos_hair.gcode
│   ├── genos_hand_left.gcode
│   ├── genos_hand_right.gcode
│   ├── genos_energy_core.gcode
│   └── genos_armor_plates.gcode
├── stl-files/                # STL source files (if available)
└── assets/                   # Reference images, diagrams
```

## 🔧 Assembly Instructions

### Step 1: Preparation
1. Carefully remove all supports from printed parts
2. Sand contact surfaces for better adhesion
3. Dry-fit all parts before gluing
4. Test fit joints for proper articulation

### Step 2: Internal Frame Assembly
1. Assemble torso and hip joint first
2. Insert leg assemblies into hip sockets
3. Attach shoulder mounts to upper torso
4. Ensure all joints move freely before final gluing

### Step 3: Limb Attachment
1. Connect arms to shoulder joints
2. Attach hands to wrist mounts
3. Secure legs to hip joints
4. Add armor plates over joints

### Step 4: Head and Hair
1. Install LED eyes (optional) before closing head
2. Route wires through neck cavity
3. Attach hair pieces to head base
4. Mount completed head to torso

### Step 5: Final Details
1. Install energy core with LED backing (optional)
2. Add remaining armor plates
3. Fill any gaps with epoxy putty
4. Sand smooth and prime entire figure

### Step 6: Painting (Optional)
1. Apply grey primer coat
2. Base coat with appropriate colors
3. Add weathering and battle damage effects
4. Apply clear coat for protection

## ⚡ LED Installation Guide (Optional)

For illuminated eyes and energy core:

1. **Materials Needed**:
   - 3mm warm white LEDs (2x for eyes, 1x for core)
   - 20 AWG magnet wire
   - CR2032 battery holder
   - Mini toggle switch

2. **Installation Steps**:
   - Drill 3.2mm holes in eye sockets and core cavity
   - Insert LEDs with diffuser material behind them
   - Run wires through hollow body cavities
   - Solder to battery pack with switch
   - Hide battery compartment in back or base

## 🎨 Color Scheme Reference

| Part | Primary Color | Secondary Color | Accent |
|------|---------------|-----------------|--------|
| Armor Plates | White | Black | Silver |
| Joints | Black | Dark Grey | - |
| Hair | Yellow/Gold | - | Light Yellow highlights |
| Eyes | Blue (LED) | White | - |
| Energy Core | Red (LED) | Orange gradient | Yellow center |
| Hands | White | Black knuckles | Silver fingertips |

## 💡 Tips for Success

1. **Orientation Matters**: Print limbs at 45° angle for best surface quality
2. **Support Strategy**: Use tree supports to minimize scarring on visible surfaces
3. **Temperature Tower**: Print a temperature tower to dial in your filament settings
4. **Test Fits**: Always dry-fit before applying adhesive
5. **Patience with Supports**: Take time removing supports to avoid damaging details
6. **Ventilation**: Work in well-ventilated area when sanding and painting
7. **Layer Direction**: Orient parts so layer lines follow muscle/armor contours

## 📏 Scale Options

This model is designed for multiple scales:
- **1:12 Scale** (~15cm tall): Default, balanced detail/print time
- **1:10 Scale** (~18cm tall): Enhanced details, longer print time
- **1:8 Scale** (~22cm tall): Maximum detail, display piece

Scale can be adjusted in your slicer software before generating G-code.

## 🛠️ Troubleshooting

| Issue | Solution |
|-------|----------|
| Warping on large flat parts | Increase bed temp, use enclosure, add brim |
| Stringing between details | Reduce temp, increase retraction distance |
| Poor layer adhesion | Check nozzle temp, reduce cooling fan speed |
| Supports breaking part | Increase support density, use tree supports |
| Gaps in curved surfaces | Increase wall count, enable ironing |

## 📄 License

This project is released under Creative Commons Attribution-NonCommercial-ShareAlike 4.0 (CC BY-NC-SA 4.0).

**You are free to:**
- Share: Copy and redistribute the material
- Adapt: Remix, transform, and build upon the material

**Under the following terms:**
- Attribution: Give appropriate credit
- NonCommercial: You may not use the material for commercial purposes
- ShareAlike: If you remix, transform, or build upon the material, you must distribute your contributions under the same license

*Genos is a character from One Punch Man, created by ONE and Yusuke Murata. This is a fan project and is not officially affiliated with the creators or publishers of One Punch Man.*

## 🙏 Credits

- Original Character: ONE & Yusuke Murata
- 3D Model Design: Community contributors
- G-code Optimization: This project
- Testing & Documentation: Open source community

## 📞 Support & Questions

For questions, suggestions, or to share your builds:
- Open an issue on this repository
- Share photos with #Genos3DPrint on social media
- Join maker communities focused on anime figure printing

---

**Happy Printing! May your Genos be as powerful as the real deal!** 🚀💥
