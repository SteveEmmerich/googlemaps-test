//
//  ViewController.h
//  gmtest
//
//  Created by Steve  Emmerich on 10/4/13.
//  Copyright (c) 2013 Steve  Emmerich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController
@property(nonatomic,retain) CLLocationManager *locationManager;

- (NSDictionary*)deviceLocation;
@end
