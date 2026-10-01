# FANUC M-20iA/35M Robotic Arm Simulation 🤖

This project focuses on the mathematical modeling and simulation of the FANUC M-20iA/35M 6-DOF industrial robotic arm.

## 📌 Key Features
*   **Forward Kinematics:** Implemented using standard Denavit-Hartenberg (DH) parameters.
*   **Inverse Kinematics:** Applied the kinematic decoupling method to solve for position (first 3 joints) and orientation (final 3 joints).
*   **Singularity Analysis:** Evaluated the Jacobian matrix to identify shoulder, elbow, and wrist singularities.
*   **Trajectory Planning:** Programmed 5th-order (Quintic) polynomial and trapezoidal velocity profiles with a visual PVA (Position-Velocity-Acceleration) GUI.
*   **3D Design Integration:** Extracted URDF files from SolidWorks for MATLAB visualization.

## 🛠 Tools Used
*   **MATLAB & Simulink:** Mathematical computation, App Designer GUI creation, and data plotting.
*   **SolidWorks:** Mechanical CAD modeling and coordinate system extraction.

## 🚀 Repository Structure
*   `SourceMatlab/`: Contains all MATLAB source code, GUI files, and Simulink models.
*   `M-20iA35M_URDF_final/`: Contains the exported URDF model from SolidWorks.
*   `fanuc_robot_simulate_report.pdf`: Comprehensive report detailing the methodology and simulation results.

## 🎥 Simulation Video (Click on Picture)
[![demo](https://github.com/user-attachments/assets/62073a8f-0e06-4351-90d4-b1c90d623da1)](https://drive.google.com/file/d/1zqe8e0UqTjf2a8iz2-RpAGMRuo8zkGr4/view?usp=sharing)

