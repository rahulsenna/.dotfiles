#include <X11/X.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <ctype.h>
#include <X11/keysym.h>
#include <string.h>

#if 0 
    #include <stdio.h>
    int catcher( Display *disp, XErrorEvent *xe )
    {
            printf( "Something bad had happened.\n" );
            return 0;
    }
#endif

Window getCurrentFocus(Display *display)
{
    Window curFocus;
    int revert;
    XGetInputFocus(display, &curFocus, &revert);
    return curFocus;
}


int main()
{
    Display *display = XOpenDisplay(NULL);
    Window root = DefaultRootWindow(display);
    Window curFocus = getCurrentFocus(display);
    char buf[17];
    KeySym ks;
    XComposeStatus comp;
    int len;
    int revert;

    XGetInputFocus(display, &curFocus, &revert);
    XSelectInput(display, curFocus, KeyReleaseMask|FocusChangeMask);

    XKeyEvent F15 = {};
    F15.keycode = XK_F4;
    F15.type = KeyPress;
    F15.root = root;
    F15.display = display;
    F15.window = curFocus;

    XKeyEvent F16 = F15, F17 = F15, F18 = F15, F19 = F15;
    F16.keycode = XK_F5;
    F17.keycode = XK_F6;
    F18.keycode = XK_F7;
    F19.keycode = XK_F8;

    // XSetErrorHandler( catcher ); // <-- inserted to set error handler

    while (1)
    {
        XEvent ev;
        XNextEvent(display, &ev);

        if (ev.type  == FocusOut)
        {
          {
              Window newFocus = getCurrentFocus(display);
              if (newFocus != 1 && newFocus != curFocus)
              {
                curFocus = newFocus;
                
                XGetInputFocus(display, &curFocus, &revert);
                XSelectInput(display, curFocus, KeyReleaseMask|FocusChangeMask);


                F15.keycode = XK_F4;
                F15.type = KeyPress;
                F15.root = root;
                F15.display = display;
                F15.window = curFocus;

                F16 = F15, F17 = F15, F18 = F15, F19 = F15;
                F16.keycode = XK_F5;
                F17.keycode = XK_F6;
                F18.keycode = XK_F7;
                F19.keycode = XK_F8;
              }
          }   
        }

        if(ev.type == KeyRelease)
        {
            
        len = XLookupString(&ev.xkey, buf, 16, &ks, &comp);
        if (len > 0 && isprint(buf[0]))
        {
            buf[len] = 0;
            switch (buf[0])
            {
                case 's': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F16); break; }
                case 'd': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F17); break; }
                case 'f': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F18); break; }
                case 'g': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F19); break; }
                
                case 'S': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F16); break; }
                case 'D': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F17); break; }
                case 'F': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F18); break; }
                case 'G': { XSendEvent(display, curFocus, True, 0, (XEvent *)&F19); break; }
            }
        }
        else
        {
            if (ks == XK_Shift_L || ks == XK_Shift_R)
            {
                XSendEvent(display, curFocus, True, 0, (XEvent *)&F15);
            }
        }
        }
    
    }

    // XSetErrorHandler( NULL ); // <-- restore the default error handler

    XCloseDisplay(display);
    return 0;
}
