//
//  BcBeaconManager.h
//  MelodySmart
//
//  Created by Stanislav Nikolov on 04/03/2014.
//  Copyright (c) 2014 BlueCreation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BcBeacon.h"

@protocol BcBeaconManagerDelegate <NSObject>

- (void) bcObservedBeaconsDidChange:(NSArray*)beacons;

@end

@interface BcBeaconManager : NSObject

- (void)startMonitoring;

- (void)stopMonitoring;

/*!
 *  @method Initializes the BcBeaconManager and gives back the initialized singleton instance.
 *
 *  @discussion The initialized singleton instance.
 *
 */
+ (BcBeaconManager*)sharedInstance;

@property (nonatomic, weak) NSObject<BcBeaconManagerDelegate> *delegate;

@end
