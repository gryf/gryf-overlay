/*
 * WMRES -- A display resolution changer for the Window Maker menu
 * Thrown together by Sam Brauer (sam@webslingerZ.com) 01-APR-1999
 * Set this up as an external menu whose definition is read from a pipe.
 * I ripped the vidmode code from Ian Moore's gtkuickres program.
 * He in turn ripped it from Adam Kopacz's xvidmode.
 * Thanks guys!!!
 *
 * Modified by Laurent Julliard <laurent AT moldus DOT org> - -
 *    - 2002-09-12 Also display the vertical Frequency next to the Video
 *      mode. This is very useful when one have the same resolution with
 *      different refresh rate to drive either a monitor or an external
 *      video projector (useful for laptop users like me :-)
 *
 * Compilation instructions:
 * gcc -o wmres wmres.c -L/usr/X11R6/lib -lXxf86vm -lXmu -lX11
 * or maybe
 * gcc -o wmres wmres.c -L/usr/X11/lib -lXxf86vm -lXmu -lX11
 * It depends on your system/distribution where the X libraries are located.
 */
#include <X11/Xlib.h>
#include <X11/extensions/xf86dga.h>
#include <X11/extensions/xf86vmode.h>
#include <stdio.h>

int main (int argc, char *argv[])
{
	Display *dpy;
	XF86VidModeModeInfo **vm_modelines; 
	int vm_count;

	int i;
	unsigned int width, height, dotclock;

	dpy=XOpenDisplay("");
	XF86VidModeGetAllModeLines(dpy,XDefaultScreen(dpy),&vm_count,&vm_modelines);
	if(!(vm_count)) {
		fprintf(stderr,"error: no video modes found\n");
		exit(1);
   }

	if(argc > 3) {
		width = atoi(argv[1]);
		height = atoi(argv[2]);
		dotclock = atoi(argv[3]);

		for(i=0; i < vm_count; i++) {
			if(vm_modelines[i]->hdisplay==width && vm_modelines[i]->vdisplay==height && vm_modelines[i]->dotclock==dotclock) {
				XF86VidModeSwitchToMode(dpy,XDefaultScreen(dpy),vm_modelines[i]);
				XFlush(dpy);
				return 0;
			}
		}
	}

	printf("\"Resolutions\" MENU\n");
	for(i=0; i < vm_count; i++) {
	    unsigned int vfreq = (vm_modelines[i]->dotclock*1000)/(vm_modelines[i]->htotal*vm_modelines[i]->vtotal);
	    printf("\"%dx%d %dHz\" EXEC %s %d %d %d\n",vm_modelines[i]->hdisplay,vm_modelines[i]->vdisplay, vfreq, argv[0], vm_modelines[i]->hdisplay, vm_modelines[i]->vdisplay, vm_modelines[i]->dotclock);
	}
	printf("\"Resolutions\" END\n");
	return 0;
}       


