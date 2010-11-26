 pip install numexpr
 pip install cython 
 pip install tables



EPD:
- You have to install a newer version of tables

  You can use the HDF in EPD though.

HDF5_DIR=$USR/opt/EPD LZO_DIR=$USR pip install --upgrade tables

- I had to remove the ncurses lib from EPD/lib, otherwise I could not isntall ipython
"name collision between TERM1 TERM!"

remember there is not virtualenv
