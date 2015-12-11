//
//  BcBeacon.h
//  MelodySmart
//
//  Created by Stanislav Nikolov on 04/03/2014.
//  Copyright (c) 2014 BlueCreation. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    BcProximityClassUnknown,
    BcProximityClassImmediate,
    BcProximityClassNear,
    BcProximityClassFar,
} BcProximityClass;

@interface BcBeacon : NSObject

@property (readonly) int majorNumber;
@property (readonly) int minorNumber;
@property (readonly) BcProximityClass proximityClass;
@property (readonly) double approximateDistance;

@end
