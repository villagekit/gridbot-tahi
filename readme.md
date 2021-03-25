<a name="TOP"></a>
# Grid-bot
A multi-spindle single-axis CNC.

![Main Assembly](assemblies/x_axis_assembled.png)

<span></span>

---
## Table of Contents
1. [Parts list](#Parts_list)
1. [X Axis Assembly](#x_axis_assembly)

<span></span>
[Top](#TOP)

---
<a name="Parts_list"></a>
## Parts list
| <span style="writing-mode: vertical-rl; text-orientation: mixed;">X&nbsp;Axis</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">TOTALS</span> |  |
|---:|---:|:---|
|  | | **Vitamins** |
| &nbsp;&nbsp;2&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 140mm |
| &nbsp;&nbsp;2&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Extrusion E4080 x 2400mm |
| &nbsp;&nbsp;2&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Leadscrew 8 x 700mm, 8mm lead, 4 starts |
| &nbsp;&nbsp;4&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Linear rail HGH20 x 600mm |
| &nbsp;&nbsp;2&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Shaft coupling SC_635x8_rigid |
| &nbsp;&nbsp;2&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Stepper motor NEMA22 x 51.2mm |
| &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  | | **CNC routed parts** |
| &nbsp;&nbsp;2&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;motor_mount.dxf |
| &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;Total CNC routed parts count |

<span></span>
[Top](#TOP)

---
<a name="x_axis_assembly"></a>
## X Axis Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Extrusion E4080 x 140mm|
|2| Extrusion E4080 x 2400mm|
|2| Leadscrew 8 x 700mm, 8mm lead, 4 starts|
|4| Linear rail HGH20 x 600mm|
|2| Shaft coupling SC_635x8_rigid|
|2| Stepper motor NEMA22 x 51.2mm|


### CNC Routed parts

| 2 x motor_mount.dxf |
|---|
| ![motor_mount.dxf](dxfs/motor_mount.png) 



### Assembly instructions
![x_axis_assembly](assemblies/x_axis_assembly.png)

This assembly, between the bed and the table, allows the machine to move the material in the X-axis while the spindles move in the Z-axis.

The necessary X-axis travel distance is equal to the total length divided by the number of spindles, so 2400mm / 6 spindles = 400mm / spindle, so the X-axis linear actuator needs to be able to move at least 400mm.

![x_axis_assembled](assemblies/x_axis_assembled.png)

<span></span>
[Top](#TOP)

---
Main assembly

<span></span>
[Top](#TOP)
