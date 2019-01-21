#import "nativeidentifier.h"
#import <UIKit/UIScreen.h>

bool iOSHasNotch() {
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        CGRect rect = [[UIScreen mainScreen] nativeBounds];
        switch ((int) rect.size.height) {
            case 1792: // iPhone Xr
            case 2436: // iPhone X/Xs
            case 2688: // iPhone Xs Max
                return true;
        }
    }
    return false;
}
