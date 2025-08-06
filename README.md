# Traffic-Controller
Traffic Controller RTL designed in Verilog and verified it with the help of Testbench
Project Overview
The Traffic Light Controller simulates an automated control system for traffic signals at a junction. The controller cycles through Red, Green, and Yellow lights for vehicles in a timed sequence, ensuring smooth traffic flow. The design is based on a Finite State Machine (FSM) approach.

Key Features:
Controls traffic lights with RED, GREEN, and YELLOW phases.
State transitions based on clock cycles and timing constraints.
Synchronous Reset functionality.

FSM-driven state machine (Moore/Mealy-based).

Files Description
design.v:
Contains the RTL implementation of the Traffic Light Controller. Defines the state machine, output signal assignments, and timing logic for transitions between RED, GREEN, and YELLOW lights.

testbench.v:
Simulates the controller by generating clock, reset signals, and observing light sequences. Verifies the correct operation of the state machine under various conditions.

How to Run
Compile the design and testbench:
iverilog -o traffic_controller_tb design.v testbench.v

Run the simulation:
vvp traffic_controller_tb

(Optional) View waveform using GTKWave:
gtkwave dump.vcd

Skills Demonstrated
FSM Design (Moore/Mealy Machine).
Traffic Signal Control Logic.
Writing Testbenches for FSM-based designs.
Simulation & Debugging using Icarus Verilog and GTKWave.

Future Enhancements
Add pedestrian crossing signals and control logic.
Introduce sensor-based adaptive traffic light control.
Parameterize the timing intervals for flexible configurations.

