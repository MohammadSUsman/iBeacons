//
//  ViewController.h
//  BeaconReciver
//
//  Created by Brianna Przybysz on 8/15/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) CLLocationManager *clLocationManager;
@property (strong, nonatomic) CLBeaconRegion *beaconRegion;


@end

