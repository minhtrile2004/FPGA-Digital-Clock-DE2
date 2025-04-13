# ⏰ FPGA Digital Clock with Alarm on DE2 Cyclone II

This project implements a digital clock with an alarm feature using Verilog on the DE2 Cyclone II FPGA development board. It displays hours, minutes, and seconds in BCD format on 7-segment displays and allows users to set an alarm time via onboard switches.

## 🎯 Features

- **Real-Time Clock**: Counts seconds, minutes, and hours accurately.
- **Alarm Functionality**: Users can set an alarm time; an LED alert is triggered when the current time matches the alarm time.
- **Modular Design**: Includes separate modules for BCD counting and 7-segment display decoding.
- **User Interaction**: Control and set alarm times using the board's switches.

## 🔧 Usage Instructions

- `SW[0]`: Reset the clock.
- `SW[1]`: Enable or disable the alarm.
- `SW[17:2]`: Set the alarm time in BCD format (16-bit: hour[7:0] + minute[7:0]).



## 🧑‍💻 Author

**Le Minh Tri**  
3rd Year Computer Engineering Student  
📧 minhtri.lmt2004@gmail.com  
🔗 [GitHub Profile](https://github.com/minhtrile2004)

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---


