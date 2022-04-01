<a name="TOP"></a>
# Gridbot-ez-cad
A simple open source machine for automated [grid beam](https://gridbeam.xyz) production.

Where possible, uses easy-to-source OpenBuilds components (e.g. [MakerStore](https://www.makerstore.com.au/), [BulkMan 3D](https://bulkman3d.com/)) or other readily available standardized parts, following inspiration from open source "pro" consumer CNC machines.

One spindle, two axis of motion (beam-length and beam-width).

Hardware design assets and documentation licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/), `.scad` files licensed under GPL-3.0 (as with NopSCADlib).

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
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 120mm x 100mm x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 120mm x 20mm x 6mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Aluminium tooling plate 160mm x 144mm x 6mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Bearing EF08  |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Bearing EK08  |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Extrusion E20100 x 270mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Extrusion E2080 x 1500mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Leadscrew 8 x 250mm, 10mm lead, 1 starts |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Linear rail HGH15CA x 240mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Linear rail HGH20CA x 1500mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Linear rail carriage HGH20CA |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;50&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;50&nbsp; | &nbsp;&nbsp; Nut M5 sliding T |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;46&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;46&nbsp; | &nbsp;&nbsp; Screw M5 cap x 16mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Screw M5 cs cap x 16mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Shaft coupling SC_635x8_rigid |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Spindle ER20 |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Stepper motor NEMA22 x 51.2mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Stepper motor NEMA22 x 86mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;11&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;109&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;125&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  |  |  |  |  |  | | **CNC routed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;gear_rack_motor_mount_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;length_axis_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;spindle_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;spindle_plate_spacer.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;width_axis_plate.dxf |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;Total CNC routed parts count |

<span></span>
[Top](#TOP)

---
<a name="workholding_assembly"></a>
## Workholding Assembly
### Assembly instructions
![workholding_assembly](assemblies/workholding_assembly_tn.png)

This assembly is to hold the workpiece: the grid beam.

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
|2| Linear rail carriage HGH20CA|
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
|1| Aluminium tooling plate 160mm x 144mm x 6mm|


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
|1| Aluminium tooling plate 160mm x 144mm x 6mm|
|1| Extrusion E2080 x 1500mm|
|2| Linear rail HGH20CA x 1500mm|
|4| Linear rail carriage HGH20CA|
|50| Nut M5 sliding T|
|46| Screw M5 cap x 16mm|
|4| Screw M5 cs cap x 16mm|
|1| Stepper motor NEMA22 x 86mm|


### CNC Routed parts

| 1 x gear_rack_motor_mount_plate.dxf | 1 x length_axis_plate.dxf |
|---|---|
| ![gear_rack_motor_mount_plate.dxf](dxfs/gear_rack_motor_mount_plate.png) | ![length_axis_plate.dxf](dxfs/length_axis_plate.png) 



### Assembly instructions
![length_axis_assembly](assemblies/length_axis_assembly.png)

This assembly is for the axis that will travel along the length of the grid beam.

![length_axis_assembled](assemblies/length_axis_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="main_assembly"></a>
## Main Assembly
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
