//
//  ProximityManager.h
//  MelodySmart
//
//  Copyright (c) 2014 BlueCreation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MelodySmart.h"

@protocol BcProximityDelegate <NSObject>

- (void) bcProximityDidConnect:(MelodySmart*)melody;

@end

@interface BcProximityManager : NSObject

@property (nonatomic, weak) NSObject<BcProximityDelegate>	*delegate;

/*!
 *  @method Initializes the BcProximitymanager and gives back the initialized singleton instance.
 *
 *  @discussion The initialized singleton instance.
 *
 */
+ (BcProximityManager*)sharedInstance;

/*!
 * @method Starts proximity detection.
 */
- (void)startProximityDetection;

/*!
 * @method Stops proximity detection.
 */
- (void)stopProximityDetection;

@end
