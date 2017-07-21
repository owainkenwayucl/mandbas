# Mandelbrot Implementation in FreeBASIC

This is just a quick implementation of a Mandelbrot set generator in FreeBASIC to play with doing graphics on FreeDOS.


To compile the code run `fbc mandel.bas` and then to run the code run `mandel.exe`.  You will then be prompted to set some variables (max/min values for X/Y, number of interations, and whether to scale red, green and blue values relative to each other) for which the default values are in square brackets, after which it will plot your resulting Mandelbrot.

To exit, press any key.

*(Note, for some reason I've noticed that the `sleep` at the end can cause a general protection fault if you leave it too long - I assume this is a bug in FreeBASIC somewhere)*

```none
C:\HOME\SOURCE\MANDBAS\>fbc mandel.bas
C:\HOME\SOURCE\MANDBAS\>mandel.exe

 <<<Screen clears>>>

Owain's Mandelbrot generator
============================

Xmax [1.0]:
Xmin [-2.0]:
Ymax [1.0]: 
Ymin [-1.0]:
Max iterations [256]: 
Red Scale [1.0]: 
Green Scale [1.0]: 
Blue Scale [1.0]:

 <<<Screen clears>>>
```


![Render with above settings](https://pbs.twimg.com/media/DFM8bQeUIAEeLG1.jpg)