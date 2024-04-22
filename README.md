**First 16 bit real mode console that have normal I/O**
---
*How to debug*

Have 2 terminal in the current directory
+ 1 run debug.sh first
+ 1 run `gdb -nx -x realmode` and debug

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
