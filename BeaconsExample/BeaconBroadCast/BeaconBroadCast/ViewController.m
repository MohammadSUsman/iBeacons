//
//  ViewController.m
//  BeaconBroadCast
//
//  Created by MohammadSUsman on 8/15/15.
//  Copyright (c) 2015 MohammadSUsman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUUID *uuidgen  = [[NSUUID alloc] initWithUUIDString:@"1CD38842-0960-4C91-949C-0C5CF7345CA3"];
    
    self.myBeaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuidgen major:1 minor:1 identifier:@"mohammadSulaman"];
}

- (IBAction)broadCastButton:(id)sender {
    
    self.beaconDataMetiral = [self.myBeaconRegion peripheralDataWithMeasuredPower:nil];
    
    // Start the peripheral manager
    self.cbPeripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                     queue:nil
                                                                   options:nil];
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager*)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn)
    {
        // Bluetooth is on
        
        // Update our status label
        self.statusLabel.text = @"Broadcasting...";
        
        // Start broadcasting
        [self.cbPeripheralManager startAdvertising:self.beaconDataMetiral];
    }
    else if (peripheral.state == CBPeripheralManagerStatePoweredOff)
    {
        // Update our status label
        self.statusLabel.text = @"Stopped";
        
        // Bluetooth isn't on. Stop broadcasting
        [self.cbPeripheralManager stopAdvertising];
    }
    else if (peripheral.state == CBPeripheralManagerStateUnsupported)
    {
        self.statusLabel.text = @"Unsupported";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
