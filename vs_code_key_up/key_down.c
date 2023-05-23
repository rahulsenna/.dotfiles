#include <X11/X.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <ctype.h>
#include <X11/keysym.h>
#include <string.h>


Window getCurrentFocus(Display *display)
{
    Window curFocus;
    int revert;
    XGetInputFocus(display, &curFocus, &revert);
    return curFocus;
}

int main()
{
    Display       *display = XOpenDisplay(NULL);
    Window         root = DefaultRootWindow(display);
    Window         curFocus;
    char           buf[17];
    KeySym         ks;
    XComposeStatus comp;
    int            len;
    int            revert;


    XGetInputFocus(display, &curFocus, &revert);
    XSelectInput(display, curFocus, KeyPressMask|FocusChangeMask);

    XKeyEvent F15 = {};
    F15.keycode   = XK_F4;
    F15.type      = KeyPress;
    F15.root      = root;
    F15.display   = display;
    F15.window    = curFocus;

 
    while (1) // only key down events are sent: KeyPressMask for curFocus
    {
        XEvent ev;
        XNextEvent(display, &ev);

        if (ev.type  == FocusOut)
        {
          {
              Window newFocus = getCurrentFocus(display);
              if (newFocus != curFocus)
              {
                curFocus = newFocus;
                
                XGetInputFocus(display, &curFocus, &revert);
                XSelectInput(display, curFocus, KeyPressMask|FocusChangeMask);


                F15.keycode = XK_F4;
                F15.type = KeyPress;
                F15.root = root;
                F15.display = display;
                F15.window = curFocus;
              }
          }   
        }
    
    
        len = XLookupString(&ev.xkey, buf, 16, &ks, &comp);

        if (ks == XK_Shift_L || ks == XK_Shift_R)// Shift Keys
        {
            XSendEvent(display, curFocus, True, 0, (XEvent *) &F15);
        }    
    }
}

// gcc -o key_down_x11 key_down.c -lX11