# Array Signal Processing Exercises

This repository contains exercises from the **Array Signal Processing** course with Professor Sharon Gannot at Bar-Ilan University.

## Beampattern of a Uniform Linear Array (ULA)

We analyze a uniform linear array (ULA) with **N = 10** sensors, uniform weights (**w_n = 1/N**), and sensor spacing **d = \( \lambda/2 \)**.

### Magnitude (dB) of the Beampattern
- **Even number of sensors (N=10):**  
  ![image](https://github.com/user-attachments/assets/677db6ce-7528-4bbb-a5fd-f3ef59e5feb2)
- **Odd number of sensors (N=11):**  
  ![image](https://github.com/user-attachments/assets/f9e5c7a9-cd59-4f3c-917b-2c3184cd62d8)

#### Observations
- For **even N**, a null appears at **endfire (0°)** because each sensor cancels another.
- Increasing **N** results in a **narrower main lobe**.

### Polar Plot of the Power Pattern
- **N=10:**  
  ![image](https://github.com/user-attachments/assets/1a4e566a-be0b-48b7-a3a0-969c20e711f9)
- **N=11:**  
  ![image](https://github.com/user-attachments/assets/6da0da01-5e1d-440e-bb62-c4309b14686b)

#### Observations
- **More sidelobes for N=11** (5 instead of 4), making them narrower.
- Null at **endfire direction** for even N.

### Power Pattern in \(\Theta\)-Space
#### Effect of Sensor Spacing \(d\)
- ![image](https://github.com/user-attachments/assets/3e34db15-a77d-43e0-9455-ef99073b5229)
- Smaller **d** results in:
  - **Wider main lobe** at broadside.
  - **Fewer nulls and sidelobes**.

#### Steering Angles (\(\Theta_T = 0°, 30°, 60°, 90°\))
- ![image](https://github.com/user-attachments/assets/caffcdf4-0d3d-439d-992f-a0a95fda9027)
- **More steering = wider main beam**.

### Sensor Failure (\(w_n = 0\) for \(n=3,5,6\))
- ![image](https://github.com/user-attachments/assets/2273b220-81eb-4940-9461-08a61ca461d7)
- Sensor failure leads to:
  - **Lower main lobe**.
  - **Higher sidelobes**.
  - **Disappearance of nulls**.

## Non-Uniform Weighting

### Beampattern in \(u\)-Space with Different Weights
- ![image](https://github.com/user-attachments/assets/17d6fbf3-4185-4921-b90f-e9c73ef63dd2)

#### Observations
- **Sidelobe reduction** but **wider main lobe**.

## Half-Power Bandwidth

### Beamwidth Variation with Steering Angles (\(2.5° \leq \Theta \leq 90°\))
- ![image](https://github.com/user-attachments/assets/b9b40f4e-ea55-4cb0-b781-0d053725c0d4)

#### Observations
- **Smallest half-power beamwidth at broadside (90°)**.
- Beamwidth **increases** with **more steering** and **smaller N or d**.

## Beampattern of the MVDR Beamformer

### Beampattern in \(u\)-Domain for Different Interferer Locations (\(u_1 = 0.3, 0.004\))
- ![image](https://github.com/user-attachments/assets/035df252-3e13-483c-a226-86f9a0077262)
- ![image](https://github.com/user-attachments/assets/d57a25b2-54e1-4f14-9af7-aeba0651ffc1)

#### Observations
- For **u_1 \( \approx \) u_0** (steering direction), power pattern **explodes (>25dB)** due to conflicting constraints.

### Power Pattern for Different INR Values
- **INR=70 dB & INR=0 dB:**  
  ![image](https://github.com/user-attachments/assets/d1a798fb-09b8-4e96-ac46-f362776fd1b7)
  ![image](https://github.com/user-attachments/assets/754e96d7-371d-4c79-aeb6-dcf00b9dc7da)

#### Observations
- **Interferer direction bends sidelobes**, creating **wave-like structures**.
- **For INR=0**, interference is too weak to distort the main lobe.
- **For INR=70**, interference **breaks the main lobe**.

## Delay-and-Sum Beamformer for Narrowband Signals

We use the provided MATLAB functions **NB_signal** and **polardb**, but instead of **frac_delay**, we use **delayseq** (better performance).

### Delay Computation
- ![image](https://github.com/user-attachments/assets/5e19c9a5-7193-4fec-98e5-3f24123584c5)

### Comparison of DSP for Endfire and Broadside Steering
- **Endfire:**  
  ![image](https://github.com/user-attachments/assets/7430e994-c475-4475-a31e-c9224e456f9c)
- **Broadside:**  
  ![image](https://github.com/user-attachments/assets/c458c2ae-a469-4ca9-8607-0ffd38b2d4c3)

### Simulated vs Analytical Beampattern
- ![image](https://github.com/user-attachments/assets/dd074c30-4901-482a-9cac-498974acbb6f)
- ![image](https://github.com/user-attachments/assets/c3eccc45-bee8-4a60-b009-be5162a5fcd6)

#### Observations
- **Simulated beampattern** follows the **same trend** as the analytical one.

---
This README provides a structured overview of the key exercises and observations in **Array Signal Processing**, improving readability and clarity.

