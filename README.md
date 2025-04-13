# FPGA Digital Clock on DE2 Board

This is a Verilog-based digital clock project implemented on the DE2 Cyclone II FPGA board. It displays hours, minutes, and seconds in BCD format on 7-segment displays, and includes an alarm feature.

## 🛠 Features
- Real-time clock counting seconds, minutes, hours
- Alarm input via switch
- LED alert when alarm time matches
- Modular design: BCD counter, 7-segment decoder

## 🔧 How to use
- `SW[0]`: Reset
- `SW[1]`: Alarm enable
- `SW[17:2]`: Set alarm time in BCD (16-bit: hour[7:0] + minute[7:0])

## 📁 File Structure
- `src/BCD_counter.v`: Main counter module
- `src/giaimaled7seg.v`: BCD to 7-segment decoder
- `src/Dong_Ho.v`: Top module integrating all components

## 🧑‍💻 Author

**Le Minh Tri**  
📧 minhtri.lmt2004@gmail.com
🌐 [GitHub Profile](https://github.com/minhtrile2004)

## 📜 License
This project is licensed under the MIT License.
