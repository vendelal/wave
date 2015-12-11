//
//  MelodySmart.h
//  MelodySmart
//
//  Copyright (c) 2013 BlueCreation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

#define BC_LIB_MELODY_SMART_IOS_VER 0x0009

@class MelodySmart;

/*!
 *  @enum PioLocation
 *
 *  @discussion Represents the set of PIOs the value is representing
 *
 *  @constant pio_24_31     value is representing PIO 24 to PIO 31.
 *  @constant pio_16_23     value is representing PIO 16 to PIO 23.
 *  @constant pio_8_15      value is representing PIO 8 to PIO 15.
 *  @constant pio_0_7       value is representing PIO 0 to PIO 7.
 *
 */
typedef enum {
    pio_24_31 = 0,
    pio_16_23,
    pio_8_15,
    pio_0_7
} BcSmartPioLocation;

typedef enum {
    bc_smart_no_alert = 0,
    bc_smart_mild_alert,
    bc_smart_high_alert
} BcSmartAlertLevel;

/*!
 *  @protocol MelodySmartDelegate
 *
 *  @discussion The delegate of a MelodySmart object must adopt the <code>MelodySmartDelegate</code> protocol. The requirement of methods are 
 *  dependent on the implementation.
 *
 */
@protocol MelodySmartDelegate <NSObject>

/*!
 *  @method didConnectToMelody:
 *
 *  @param melody  The MelodySmart instance which corresponds to the connected device.
 *
 *  @param result  The result of the connection. YES if connection is successful and NO
 *  otherwise.
 *
 *  @discussion     Invoked when a connection to a melody peripheral has finished.
 *
 */
- (void) melodySmart:(MelodySmart*)melody didConnectToMelody:(BOOL)result;

- (void) melodySmartDidDisconnectFromMelody:(MelodySmart*)melody;

/*!
 *  @method didPopulateMelodyService:
 *
 *  @param melody  The MelodySmart instance which corresponds to the connected device.
 *
 *  @discussion     Invoked when the melody service has been populated after a connection
 *
 */
-(void) melodySmartDidPopulateMelodyService:(MelodySmart*)melody;

/*!
 *  @method didReceiveData:
 *
 *  @param data  The data received from Melody peripheral device.
 *
 *  @discussion     Invoked when data has arrived from the Data service from
 *  the peripheral
 *
 */
- (void) melodySmart:(MelodySmart*)melody didSendData:(NSError*)error;

/*!
 *  @method didReceiveData:
 *
 *  @param data  The data received from Melody peripheral device.
 *
 *  @discussion     Invoked when data has arrived from the Data service from
 *  the peripheral
 *
 */
- (void) melodySmart:(MelodySmart*)melody didReceiveData:(NSData*)data;

/*!
 *  @method didReceivePioChange:
 *
 *  @param data  8 bits representing the new state of 1 or more pios.
 *
 *  @param location the set of PIOs the state is representing PioLocation
 *
 *  @discussion     Invoked when a new pio state has arrived from the Pio state service from the peripheral. This is not yet supported.
 *
 */
@optional
- (void) melodySmart:(MelodySmart*)melody didReceivePioChange:(unsigned char)state WithLocation:(BcSmartPioLocation)location;

/*!
 *  @method didReceivePioSettingChange:
 *
 *  @param data  8 bits representing the new state of 1 or more pios.
 *
 *  @param location the set of PIOs the state is representing PioLocation
 *
 *  @discussion     Invoked when a pio setting state has arrived from the Pio state service from the peripheral. This is not yet supported
 *
 */
@optional
- (void) melodySmart:(MelodySmart*)melody didReceivePioSettingChange:(unsigned char)state WithLocation:(BcSmartPioLocation)location;


/*!
 *  @method didReceiveLinkLossLevel:
 *
 *  @param level  BC Smart Alert Level.
 *
 *  @discussion   Invoked when a the remote device replies reading the link loss alert level set on the remote device.
 *
 */
- (void) meldodySmart:(MelodySmart*)melody didReceiveLinkLossLevel:(BcSmartAlertLevel)level;

/*!
 *  @method didReceiveTxPower:
 *
 *  @param level  BC Smart Alert Level.
 *
 *  @discussion   Invoked when a the remote device replies reading the TX Power level set on the remote device.
 *
 */
- (void) meldodySmart:(MelodySmart*)melody didReceiveTxPower:(NSInteger)power;

@end

/*!
 *  @class MelodySmart
 *
 *  @discussion MelodySmart. This object can searh and commnicate with a Melody Smart peripheral.
 *
 */
@interface MelodySmart : NSObject

/*!
 *  @property delegate
 *
 *  @discussion The delegate object that will receive Melody Smart events.
 *
 */
@property (nonatomic, assign) NSObject<MelodySmartDelegate>	*delegate;

/*!
 *  @method name
 *
 *  @return The name of the peripheral.
 *
 *  @discussion Returns the name of the peripheral in MelodySmart instance.
 *
 */
- (NSString*) name;

/*!
 *  @method RSSI
 *
 *  @return The RSSI of the peripheral.
 *
 *  @discussion Resturns the RSSI of the peripheral in MelodySmart instance
 *
 */
- (NSNumber*) RSSI;

/*!
 *  @method isConnected
 *
 *  @return YES if the peripheral is connected, NO otherwise
 *
 *  @discussion Returns the connection status.
 *
 */
- (BOOL) isConnected;

/*!
 *  @method connect
 *
 *  @discussion Start a connection with this instance of MelodySmart. This instance contains one set of UUIDs
 *
 */
- (void) connect;

/*!
 *  @method disconnect
 *
 *  @discussion Release the connection with the current Melody peripheral referenced in this object.
 *
 */
- (void) disconnect;

/*!
 *  @method sendData
 *
 *  @param data The data to send to the peripheral. Due to BLE protocol limitations, the maximum size of a single data chunk is 20 bytes. No data is transmitted if the chunk exceeds that size.
 *
 *  @discussion Sends data using the Data service to the connected Melody peripheral.
 *
 */
- (bool) sendData:(NSData*) data;

/*!
 *  @method sendPioState
 *
 *  @param data  8 bits representing the new state of 1 or more pios.
 *
 *  @param location the set of PIOs the state is representing PioLocation
 *
 *  @discussion Sends the new state of the pios. Only output PIOs are affected in this method.
 *
 */
- (void) sendPioState:(unsigned char)state WithLocation:(BcSmartPioLocation)location;

/*!
 *  @method sendPioSetting
 *
 *  @param data  8 bits representing the new state of 1 or more pios.
 *
 *  @param location the set of PIOs the state is representing PioLocation
 *
 *  @discussion Configured the PIOs to input and output, bit with 1 represents output, 0 represents input
 *
 */
- (void) sendPioSetting:(unsigned char)state WithLocation:(BcSmartPioLocation)location;

/*!
 *  @method readData
 *
 *  @discussion Request a read over the Data service. Note that this might not be supported by the peripheral.
 *
 */
- (void) readData;

/*!
 *  @method readPioState
 *
 *  @param  location    The location that is required.
 *
 *  @discussion Request a read of the pio state from the peripheral. didRecveivePioChange will be invoked for location even if no changes occured.
 *
 */
- (void) readPioState:(BcSmartPioLocation)location;

/*!
 *  @method readPioSetting
 *
 *  @param  location    The location that is required.
 *
 *  @discussion Request a read of the pio setting state from the peripheral. didRecveivePioSettingChange will be invoked for location even if no changes occured.
 *
 */
- (void) readPioSetting:(BcSmartPioLocation)location;

/*!
 *  @method setDataNotification
 *
 *  @param enable YES to enable notification, NO to disable them
 *
 *  @discussion Enable Notification of the Data service or not.
 *
 */
- (void) setDataNotification:(BOOL) enable;

/*!
 *  @method init
 *
 *  @param enable YES to enable notification, NO to disable them
 *
 *  @discussion Enable Notification of the Pio Report service or not.
 *
 */
- (void) setPioNotification:(BOOL) enable;

/*!
 *  @method identifier
 *
 *  @discussion The unique identifier associated with the peripheral.
 */
- (const NSUUID*) identifier;


/*!
 *  @method readLinkLossLevel
 *
 *  @discussion Read the remote device link loss alert level.
 */
- (void) readLinkLossLevel;

/*!
 *  @method setLinkLossLevel
 *
 *  @param  level  The new level of the link loss alert level of the remove device.
 *
 *  @discussion Set the remote device link loss alert level.
 */
- (void) setLinkLossLevel:(BcSmartAlertLevel) level;

/*!
 *  @method setImmediateAlertLevel
 *
 *  @param  level  Set the alert level of the remote device.
 *
 *  @discussion Set the the alert level of the remote device immediatly.
 */
- (void) setImmediateAlertLevel:(BcSmartAlertLevel) level;

/*!
 *  @method readCurrentTxPower
 *
 *  @discussion Retrieve the current TX power of the remote device.s
 */
- (void) readCurrentTxPower;

/*!
 * This is the set of the remote device Information.
 * This is read after connecting to the remote device.
 */
@property(readonly, nonatomic) NSString *deviceInfoSystemId;
@property(readonly, nonatomic) NSString *deviceInfoModelNumber;
@property(readonly, nonatomic) NSString *deviceInfoSerialNumber;
@property(readonly, nonatomic) NSString *deviceInfoHardwareRevision;
@property(readonly, nonatomic) NSString *deviceInfoFirmwareRevision;
@property(readonly, nonatomic) NSString *deviceInfoSoftwareRevisin;
@property(readonly, nonatomic) NSString *deviceInfoManufacturerName;
@property(readonly, nonatomic) NSInteger pnpSourceID;
@property(readonly, nonatomic) NSInteger pnpVid;
@property(readonly, nonatomic) NSInteger pnpPid;
@property(readonly, nonatomic) NSInteger pnpProductVersion;

@end

