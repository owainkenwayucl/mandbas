Dim as Double xmin, xmax, ymin, ymax, r2, x0, y0, x, y, xt, rs, gs, bs
Dim as UInteger xres, yres, niter, c, iter
Dim as String inst
Dim as UInteger col, brt
Dim as UInteger i,j, fj 

REM These are fixed values.
xres = 640
yres = 480
r2 = 4.0

REM Appearance settings:
niter = 255
rs = 1
gs = 1
bs = 1 

REM Get area of interest.
Cls
Print "Owain's Mandelbrot generator"
Print "============================"
Print ""

Input "Xmax [1.0]: ", inst
xmax = 1
If inst <> "" Then xmax = Val(inst) 
Input "Xmin [-2.0]: ", inst
xmin = -2
If inst <> "" Then xmin = Val(inst) 
Input "Ymax [1.0]: ", inst
ymax = 1
If inst <> "" Then ymax = Val(inst) 
Input "Ymin [-1.0]: ", inst 
ymin = -1
If inst <> "" Then ymin = Val(inst) 
Input "Max iterations [256]: ", inst
If inst <> "" Then niter = Val(inst) - 1 
Input "Red Scale [1.0]: ", inst
If inst <> "" Then rs = Val(inst) 
Input "Green Scale [1.0]: ", inst
If inst <> "" Then gs = Val(inst) 
Input "Blue Scale [1.0]: ", inst
If inst <> "" Then bs = Val(inst) 

REM Set max + min scales.
If rs > 1 Then rs = 1
If gs > 1 Then gs = 1
If bs > 1 Then bs = 1

If rs < 0 Then rs = 0
If gs < 0 Then gs = 0
If bs < 0 Then bs = 0

REM 640x480 in 32 bit colour.
Screen 18, 32

REM Hide mouse
SetMouse 0, 0, 0

REM Usual Mandelbrot loop over all pixels.
For i = 0 To 639
   x0 = ((i/xres)*(xmax-xmin))+xmin
   For j = 0 to 479
      y0 = ((j/yres)*(ymax-ymin))+ymin
      iter = 0
      x = 0
      y = 0
      While (((x*x) + (y*y) < r2) And (iter < niter))
         xt=(x*x)-(y*y)+x0
         y=2.0*x*y+y0
         x=xt
         iter=iter+1
      Wend    

REM Get brightness and generate colour  
      brt = ((niter - iter)/niter)*256
      col = Rgb(rs*brt,gs*brt,bs*brt)

REM Flip image vertically.
      fj = (yres -1) - j

REM Plot point.
      pset(i,fj), col
   Next j
Next i

REM Wait for the user to press a key before exiting.
Sleep

