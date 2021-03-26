<a name="TOP"></a>
# Grid-bot
A multi-spindle single-axis CNC.

For the framing, we'll use 8040 aluminium extrusion since it's fit for purpose and readily available here in New Zealand.

Where possible, we'll try to use motion control components found in "pro" consumer CNC machines (AvidCNC, RoverCNC, QueenBee, etc), e.g. stepper motors, lead screws, linear rails, etc.

![Main Assembly](assemblies/main_assembled.png)

<span></span>

---
## Table of Contents
1. [Parts list](#Parts_list)
1. [Drill Assembly](#drill_assembly)
1. [Gang Drill Assembly](#gang_drill_assembly)
1. [X Axis Assembly](#x_axis_assembly)
1. [Main Assembly](#main_assembly)

<span></span>
[Top](#TOP)

---
<a name="Parts_list"></a>
## Parts list
| <span style="writing-mode: vertical-rl; text-orientation: mixed;">6 x Drill</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Gang&nbsp;Drill</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">X&nbsp;Axis</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Main</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">TOTALS</span> |  |
|---:|---:|---:|---:|---:|:---|
|  |  |  |  | | **Vitamins** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp; Ball bearing 688ZZZZ 8mm x 16mm x 5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 140mm |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 200mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 2400mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;7&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;7&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 300mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 320mm |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Leadscrew 8 x 184mm, 8mm lead, 4 starts |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Leadscrew 8 x 700mm, 8mm lead, 4 starts |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp; Linear rail HGH20 x 200mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Linear rail HGH20 x 600mm |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp; Shaft coupling SC_635x8_rigid |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp; Stepper motor NEMA22 x 51.2mm |
| &nbsp;&nbsp;30&nbsp; | &nbsp;&nbsp;23&nbsp; | &nbsp;&nbsp;22&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;75&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  |  |  |  | | **3D printed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;support_seat.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;Total 3D printed parts count |
|  |  |  |  | | **CNC routed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;x_axis_motor_mount.dxf |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;z_axis_motor_mount.dxf |
| &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;Total CNC routed parts count |

<span></span>
[Top](#TOP)

---
<a name="drill_assembly"></a>
## 6 x Drill Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|6| Extrusion E4080 x 200mm|
|6| Leadscrew 8 x 184mm, 8mm lead, 4 starts|
|6| Linear rail HGH20 x 200mm|
|6| Shaft coupling SC_635x8_rigid|
|6| Stepper motor NEMA22 x 51.2mm|


### CNC Routed parts

| 6 x z_axis_motor_mount.dxf |
|---|
| ![z_axis_motor_mount.dxf](dxfs/z_axis_motor_mount.png) 



### Assembly instructions
![drill_assembly](assemblies/drill_assembly.png)

This assembly is for a drill.

Each drill has independent spindle and an independent Z-axis.

![drill_assembled](assemblies/drill_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="gang_drill_assembly"></a>
## Gang Drill Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Extrusion E4080 x 2400mm|
|7| Extrusion E4080 x 300mm|
|14| Extrusion E4080 x 320mm|


### Sub-assemblies

| 6 x drill_assembly |
|---|
| ![drill_assembled](assemblies/drill_assembled_tn.png) 



### Assembly instructions
![gang_drill_assembly](assemblies/gang_drill_assembly.png)

This assembly is for a gang of drills on a frame.

The number of drills should be a divisor of the total number of holes per beam (60). So we might start with 6 drills, so 10 holes to be drilled per drill.

![gang_drill_assembled](assemblies/gang_drill_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="x_axis_assembly"></a>
## X Axis Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|8| Ball bearing 688ZZZZ 8mm x 16mm x 5mm|
|2| Extrusion E4080 x 140mm|
|2| Extrusion E4080 x 2400mm|
|2| Leadscrew 8 x 700mm, 8mm lead, 4 starts|
|4| Linear rail HGH20 x 600mm|
|2| Shaft coupling SC_635x8_rigid|
|2| Stepper motor NEMA22 x 51.2mm|


### 3D Printed parts

| 4 x support_seat.stl |
|---|
| ![support_seat.stl](stls/support_seat.png) 



### CNC Routed parts

| 2 x x_axis_motor_mount.dxf |
|---|
| ![x_axis_motor_mount.dxf](dxfs/x_axis_motor_mount.png) 



### Assembly instructions
![x_axis_assembly](assemblies/x_axis_assembly.png)

This assembly, between the bed and the table, allows the machine to move the material in the X-axis while the spindles move in the Z-axis.

The necessary X-axis travel distance is equal to the total length divided by the number of spindles, so 2400mm / 6 spindles = 400mm / spindle, so the X-axis linear actuator needs to be able to move at least 400mm.

![x_axis_assembled](assemblies/x_axis_assembled.png)

<span></span>
[Top](#TOP)

---
<a name="main_assembly"></a>
## Main Assembly
### Sub-assemblies

| 1 x gang_drill_assembly | 1 x x_axis_assembly |
|---|---|
| ![gang_drill_assembled](assemblies/gang_drill_assembled_tn.png) | ![x_axis_assembled](assemblies/x_axis_assembled_tn.png) 



### Assembly instructions
![main_assembly](assemblies/main_assembly.png)

Main assembly

![main_assembled](assemblies/main_assembled.png)

<span></span>
[Top](#TOP)
