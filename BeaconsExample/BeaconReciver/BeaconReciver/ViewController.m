//
//  ViewController.m
//  BeaconReciver
//
//  Created by Brianna Przybysz on 8/15/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.clLocationManager = [[CLLocationManager alloc]init];
    self.clLocationManager.delegate = self;
    
    NSUUID *uuidGen  = [[NSUUID alloc]initWithUUIDString:@"1CD38842-0960-4C91-949C-0C5CF7345CA3"];
    self.beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuidGen identifier:@"mohammadSulaman"];
    
    [self.clLocationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager*)manager didEnterRegion:(CLRegion*)region
{
    [self.clLocationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager*)manager didExitRegion:(CLRegion*)region
{
    [self.clLocationManager stopRangingBeaconsInRegion:self.beaconRegion];
    self.statusLabel.text = @"No";
}

-(void)locationManager:(CLLocationManager*)manager
       didRangeBeacons:(NSArray*)beacons
              inRegion:(CLBeaconRegion*)region
{
    // Beacon found!
    self.statusLabel.text = @"Beacon found!";
    
    CLBeacon *foundBeacon = [beacons firstObject];
    
    // You can retrieve the beacon data from its properties
    //NSString *uuid = foundBeacon.proximityUUID.UUIDString;
    //NSString *major = [NSString stringWithFormat:@"%@", foundBeacon.major];
    //NSString *minor = [NSString stringWithFormat:@"%@", foundBeacon.minor];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
