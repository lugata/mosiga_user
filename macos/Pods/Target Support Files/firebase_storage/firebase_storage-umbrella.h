#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FLTFirebaseStoragePlugin.h"

FOUNDATION_EXPORT double firebase_storageVersionNumber;
FOUNDATION_EXPORT const unsigned char firebase_storageVersionString[];

