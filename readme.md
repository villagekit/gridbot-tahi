<a name="TOP"></a>
# Gridbot-tahi
A simple open source machine for automated [grid beam](https://gridbeam.xyz) production.

Where possible, uses easy-to-source OpenBuilds components (e.g. [MakerStore](https://www.makerstore.com.au/), [BulkMan 3D](https://bulkman3d.com/)) or other readily available standardized parts, following inspiration from open source "pro" consumer CNC machines.

One spindle, two axis of motion (beam-length and beam-width).


![Main Assembly](assemblies/main_assembled.png)

<span></span>

---
## Table of Contents
1. [Parts list](#Parts_list)
1. [Workholding Assembly](#workholding_assembly)
1. [Spindle Assembly](#spindle_assembly)
1. [Hanpose Hpv6 Linear Guide Assembly](#hanpose_hpv6_linear_guide_assembly)
1. [Width Axis Assembly](#width_axis_assembly)
1. [Length Axis Assembly](#length_axis_assembly)
1. [Main Assembly](#main_assembly)



<span></span>
[Top](#TOP)

---
<a name="Parts_list"></a>
## Parts list
| <span style="writing-mode: vertical-rl; text-orientation: mixed;">Workholding</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Spindle</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Hanpose&nbsp;Hpv6&nbsp;Linear&nbsp;Guide</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Width&nbsp;Axis</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Length&nbsp;Axis</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Main</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">TOTALS</span> |  |
|---:|---:|---:|---:|---:|---:|---:|:---|
|  |  |  |  |  |  | | **Vitamins** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; 40 |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 120mm x 100mm x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 120mm x 20mm x 6mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 128mm x 159mm x 6mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 48mm x 80mm x 6mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 55mm x 25mm x 5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 60mm x 10mm x 5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 60mm x 20mm x 5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Bearing EF08  |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Bearing EK08  |
| &nbsp;&nbsp;16&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; |  &nbsp;&nbsp;22&nbsp; | &nbsp;&nbsp; Double L Bracket |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; External Gear Rack |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Extrusion E20100 x 270mm |
| &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Extrusion E2040 x 120mm |
| &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Extrusion E2040 x 1500mm |
| &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Extrusion E2040 x 200mm |
| &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Extrusion E2040 x 320mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Extrusion E2080 x 1500mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Gear Rack Motor Mount Plate |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Leadscrew 8 x 250mm, 10mm lead, 1 starts |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Linear rail HGH15CA x 1500mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Linear rail HGH15CA x 240mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Linear rail carriage HGH15CA |
| &nbsp;&nbsp;64&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;50&nbsp; | &nbsp;&nbsp;24&nbsp; |  &nbsp;&nbsp;138&nbsp; | &nbsp;&nbsp; Nut M5 sliding T |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp; Nut M5 x 4mm nyloc |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;46&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;46&nbsp; | &nbsp;&nbsp; Screw M4 cap x 16mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Screw M4 cs cap x 16mm |
| &nbsp;&nbsp;64&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;24&nbsp; |  &nbsp;&nbsp;88&nbsp; | &nbsp;&nbsp; Screw M5 cap x  8mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Screw M5 cap x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Screw M5 cap x 16mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Screw M5 cap x 20mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Screw M5 cap x 60mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Screw M5 grub x  5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Shaft coupling SC_635x8_rigid |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Single L Bracket |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Spindle ER20 |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Spring 7.5mm OD, 1.2mm gauge x 20mm long, open end |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Stepper motor NEMA22 x 51.2mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Stepper motor NEMA22 x 86mm |
| &nbsp;&nbsp;157&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;11&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;131&nbsp; | &nbsp;&nbsp;54&nbsp; | &nbsp;&nbsp;358&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  |  |  |  |  |  | | **3D printed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;dq542ma_mount_1.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;dq542ma_mount_2.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;stm32_f7676zi_din_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;Total 3D printed parts count |
|  |  |  |  |  |  | | **CNC routed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;length_axis_bottom_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;length_axis_motor_side_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;length_side_cover_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;spindle_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;spindle_plate_spacer.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;width_axis_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;Total CNC routed parts count |


Hardware design assets and documentation licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), `.scad` files licensed under GPL-3.0 (as with NopSCADlib).

Previous design notes: https://wiki.villagekit.com/en/grid-bot

Inspiration:

- Phil and Richard's multi-spindle drill press: https://youtu.be/PIMESt9iLYg
- BeamCNC: https://github.com/VladLunachev/BeamCNC/
- https://wiki.replimat.org/wiki/Automated_drilling_machines
- https://youtu.be/YmD3KoqatHs
- https://youtu.be/1WsEdbiqdlA
- https://youtu.be/ksaT63qqIJM
- https://youtu.be/h0pohupmKKk
- https://youtu.be/mg9bALNiYPU
- https://youtu.be/ocbE4NLd9go

<span></span>
[Top](#TOP)

---
<a name="workholding_assembly"></a>
## Workholding Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|16| Double L Bracket|
|4| Extrusion E2040 x 120mm|
|1| Extrusion E2040 x 1500mm|
|4| Extrusion E2040 x 200mm|
|4| Extrusion E2040 x 320mm|
|64| Nut M5 sliding T|
|64| Screw M5 cap x  8mm|


### Assembly instructions
![workholding_assembly](assemblies/workholding_assembly_tn.png)

This assembly is to hold the workpiece (the grid beam) and the rest of the machine.

![workholding_assembled](assemblies/workholding_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="spindle_assembly"></a>
## Spindle Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Aluminium tooling plate 120mm x 100mm x 10mm|
|2| Aluminium tooling plate 120mm x 20mm x 6mm|
|1| Spindle ER20|


### CNC Routed parts

| 1 x spindle_plate.dxf | 2 x spindle_plate_spacer.dxf |
|---|---|
| ![spindle_plate.dxf](dxfs/spindle_plate.png) | ![spindle_plate_spacer.dxf](dxfs/spindle_plate_spacer.png) 



### Assembly instructions
![spindle_assembly](assemblies/spindle_assembly.png)

This assembly is for a spindle and motor connected via gears.

- Spindle: [ER20 Spindle Head for Drilling](https://www.aliexpress.com/item/1005001278002287.html)
- Motor: [iHSV57-180 Nema23 180W Integrated Servo Motor](https://www.makerstore.com.au/product/elec-ihsv57-180/)

![spindle_assembled](assemblies/spindle_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="hanpose_hpv6_linear_guide_assembly"></a>
## Hanpose Hpv6 Linear Guide Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Aluminium tooling plate 120mm x 100mm x 10mm|
|1| Bearing EF08 |
|1| Bearing EK08 |
|1| Extrusion E20100 x 270mm|
|1| Leadscrew 8 x 250mm, 10mm lead, 1 starts|
|2| Linear rail HGH15CA x 240mm|
|2| Linear rail carriage HGH15CA|
|1| Shaft coupling SC_635x8_rigid|
|1| Stepper motor NEMA22 x 51.2mm|


### Assembly instructions
![hanpose_hpv6_linear_guide_assembly](assemblies/hanpose_hpv6_linear_guide_assembly_tn.png)

Hanpose HPV6: https://www.aliexpress.com/item/32908794883.html

![hanpose_hpv6_linear_guide_assembled](assemblies/hanpose_hpv6_linear_guide_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="width_axis_assembly"></a>
## Width Axis Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Aluminium tooling plate 128mm x 159mm x 6mm|


### CNC Routed parts

| 1 x width_axis_plate.dxf |
|---|
| ![width_axis_plate.dxf](dxfs/width_axis_plate.png) 



### Sub-assemblies

| 1 x hanpose_hpv6_linear_guide_assembly |
|---|
| ![hanpose_hpv6_linear_guide_assembled](assemblies/hanpose_hpv6_linear_guide_assembled_tn.png) 



### Assembly instructions
![width_axis_assembly](assemblies/width_axis_assembly.png)

This assembly is for the axis that will travel perpendicular to the length of the grid beam (i.e. along the width of the grid beam).

![width_axis_assembled](assemblies/width_axis_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="length_axis_assembly"></a>
## Length Axis Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| 40|
|1| Aluminium tooling plate 128mm x 159mm x 6mm|
|2| Aluminium tooling plate 48mm x 80mm x 6mm|
|1| Aluminium tooling plate 55mm x 25mm x 5mm|
|2| Aluminium tooling plate 60mm x 10mm x 5mm|
|1| Aluminium tooling plate 60mm x 20mm x 5mm|
|3| External Gear Rack|
|1| Extrusion E2080 x 1500mm|
|1| Gear Rack Motor Mount Plate|
|2| Linear rail HGH15CA x 1500mm|
|4| Linear rail carriage HGH15CA|
|50| Nut M5 sliding T|
|3| Nut M5 x 4mm nyloc|
|46| Screw M4 cap x 16mm|
|4| Screw M4 cs cap x 16mm|
|1| Screw M5 cap x 10mm|
|1| Screw M5 cap x 16mm|
|1| Screw M5 cap x 20mm|
|1| Screw M5 cap x 60mm|
|1| Screw M5 grub x  5mm|
|2| Single L Bracket|
|1| Spring 7.5mm OD, 1.2mm gauge x 20mm long, open end|
|1| Stepper motor NEMA22 x 86mm|


### CNC Routed parts

| 1 x length_axis_bottom_plate.dxf | 1 x length_axis_motor_side_plate.dxf | 2 x length_side_cover_plate.dxf |
|---|---|---|
| ![length_axis_bottom_plate.dxf](dxfs/length_axis_bottom_plate.png) | ![length_axis_motor_side_plate.dxf](dxfs/length_axis_motor_side_plate.png) | ![length_side_cover_plate.dxf](dxfs/length_side_cover_plate.png) 



### Assembly instructions
![length_axis_assembly](assemblies/length_axis_assembly.png)

This assembly is for the axis that will travel along the length of the grid beam.

![length_axis_assembled](assemblies/length_axis_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="main_assembly"></a>
## Main Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|6| Double L Bracket|
|24| Nut M5 sliding T|
|24| Screw M5 cap x  8mm|


### 3D Printed parts

| 1 x dq542ma_mount_1.stl | 1 x dq542ma_mount_2.stl | 1 x stm32_f7676zi_din_mount.stl |
|---|---|---|
| ![dq542ma_mount_1.stl](stls/dq542ma_mount_1.png) | ![dq542ma_mount_2.stl](stls/dq542ma_mount_2.png) | ![stm32_f7676zi_din_mount.stl](stls/stm32_f7676zi_din_mount.png) 



### Sub-assemblies

| 1 x length_axis_assembly | 1 x spindle_assembly | 1 x width_axis_assembly |
|---|---|---|
| ![length_axis_assembled](assemblies/length_axis_assembled_tn.png) | ![spindle_assembled](assemblies/spindle_assembled_tn.png) | ![width_axis_assembled](assemblies/width_axis_assembled_tn.png) 


| 1 x workholding_assembly |
|---|
| ![workholding_assembled](assemblies/workholding_assembled_tn.png) 



### Assembly instructions
![main_assembly](assemblies/main_assembly.png)

Main assembly

![main_assembled](assemblies/main_assembled.png)

<span></span>
[Top](#TOP)
