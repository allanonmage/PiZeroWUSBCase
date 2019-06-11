# PiZeroWUSBCase

You can find this thing on Thingiverse: https://www.thingiverse.com/thing:3621197



I was inspired by https://www.thingiverse.com/thing:2516525, but I couldn't get his thing to work for me, so I built my own from scratch.


Aside from cool factor, I can't think of too many use-cases for this 
doohicky.  I'm thinking this would be a good password vault.  The Pi 
could sync up via its own network connection, and then the user could 
securely access his password through a USB network connection to the Pi.
  SSH, VNC, etc.


I've got though something like 14 iterations so far making fine 
adjustments, but it's in a very usable state.  Printed on a custom 
Printrbot LC.  The MicroSD card and freedom coin are for a size 
comparison.


As far as stretch goals, I got a small LCD for it, and I'd like to 
add a button to power the Pi off properly.  I left the GPIO open for 
development purposes, but in the case of a password vault, that should 
be closed up.


You'll need a Raspberry Pi Zero, a USB stem kit, and you'll need to 
solder it up.  Once you get the hardware assembled, you can add this 
case and some #4 screws and that's it for hardware.


https://www.sparkfun.com/products/14526
https://shop.pimoroni.com/products/zero-stem-usb-otg-connector


Software wise, you'll want to take a look at these tutorials.  The 
software is more challenging than the hardware by far, especially if you
 run into a host Windows install that doesn't want to play nice.


There are several good blogs and tutorials taking you through the 
setup of what to do with this, including troubleshooting.  You could 
make a PoisonTap, USB Mass storage, serial console, or any other of a 
number of things.


https://www.hardill.me.uk/wordpress/2017/01/23/raspberry-pi-zero-gadgets/
http://irq5.io/2016/12/22/raspberry-pi-zero-as-multiple-usb-gadgets/
http://fruitywifi.boards.net/thread/185/fruitywifi-rpi-zero-ethernet-gadget

And the obligatory Adafruit link: https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget/ethernet-gadget

