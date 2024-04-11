**First 16 bit real mode console that have normal I/O**
---

*How to debug*
1. Run debug.sh
2. Open gdb and type command `target remote localhost:1234`
3. Set breakpoint at `0x7c00` and continue to debug
---

* Clrscr:
  + Clear the screen and move the pointer to the upper left corner of the console window

* Put_char:
  + Print the character have ascii code storage in `bl` to console

* Print:
  + Print the string storage at address `di` to console

* Read_char:
  + Read a character from user input and save to `al`

* Read:
  + Read user input until `Enter` and write the result to buffer with maximum 100 bytes length

* Write_char
  + Write character save in `bl` to address di

* End_line:
  + Replace the current address in `di` with null bytes and then end line console to new line

* End_func:
  + End the current function
