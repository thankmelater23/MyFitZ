//
//  main.m
//  
//
//  Created by Andre Villanueva on 12/26/15.
//
//

#import <Foundation/Foundation.h>

// From here to end of file added by Injection Plugin //

#ifdef DEBUG
static char _inMainFilePath[] = __FILE__;
static const char *_inIPAddresses[] = {"192.168.1.76", "192.168.1.72", "127.0.0.1", 0};

#define INJECTION_ENABLED
#import "/tmp/injectionforxcode/BundleInjection.h"
#endif
