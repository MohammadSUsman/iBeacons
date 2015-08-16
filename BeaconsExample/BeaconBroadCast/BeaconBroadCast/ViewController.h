//
//  ViewController.h
//  BeaconBroadCast
//
//  Created by MohammadSUsman on 8/15/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CBPeripheralManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong,nonatomic) CBPeripheralManager *cbPeripheralManager;
@property (strong, nonatomic)CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) NSDictionary *beaconDataMetiral;





@end

