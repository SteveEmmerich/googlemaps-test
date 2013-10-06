//
//  ViewController.m
//  gmtest
//
//  Created by Steve  Emmerich on 10/4/13.
//  Copyright (c) 2013 Steve  Emmerich. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController
{
    GMSMapView *mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    [_locationManager startUpdatingLocation];
    
    GMSCameraPosition *Camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:Camera];
    mapView_.myLocationEnabled = true;
    self.view = mapView_;
    
    //create marker at center of map
    GMSMarker *Marker = [[GMSMarker alloc] init];
    Marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    Marker.title = @"Sydney";
    Marker.snippet = @"Austraila";
    Marker.map = mapView_;
    

    CGRect buttonFrame = CGRectMake( 10, 380, 100, 30 );
    UIButton *button = [[UIButton alloc] initWithFrame: buttonFrame];
    [button setTitle: @"My Location" forState: UIControlStateNormal];
    [button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
    [button setBackgroundColor: [UIColor blackColor]];
    [self.view addSubview: button];
    [button addTarget: self
               action: @selector(nextPage)
     forControlEvents: UIControlEventTouchDown];
    
   }
- (void)nextPage
{
  
    CLLocationDegrees longitude = _locationManager.location.coordinate.longitude;
    CLLocationDegrees latitude = _locationManager.location.coordinate.latitude;
 
   // NSLog(@"Button Pressed", longitude, latitude);
    GMSCameraPosition *Camera = [GMSCameraPosition cameraWithLatitude:latitude longitude:longitude zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:Camera];
    mapView_.myLocationEnabled = true;
    self.view = mapView_;
    
    //create marker at center of map
    GMSMarker *Marker = [[GMSMarker alloc] init];
    Marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    Marker.title = @"Your Location";
    Marker.snippet = [NSString stringWithFormat:@"Latitude:%f Longitude:%f", latitude, longitude];
    Marker.map = mapView_;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString*)deviceLongitude {
    NSString *theLocation = [NSString stringWithFormat:@"latitude:%f, longitude:%f", _locationManager.location.coordinate.latitude, _locationManager.location.coordinate.longitude];
  //  NSLog(theLocation);
    return theLocation;
}
@end
