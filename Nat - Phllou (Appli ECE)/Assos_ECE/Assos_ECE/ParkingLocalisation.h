//
//  ParkingLocalisation.h
//  Ispark4.0
//
//  Created by Natanel Partouche on 19/04/11.
//  Copyright 2011 ECE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PuceLocalisationParking.h"
@interface ParkingLocalisation : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,MKAnnotation>{
	
	IBOutlet MKMapView *map;
    IBOutlet UIActivityIndicatorView *acti;

    NSMutableDictionary *dico;
    
	CLLocationManager *locationmanager;
	
    CLLocationCoordinate2D location;
	CLLocationCoordinate2D destination;
}

@property(nonatomic,retain)IBOutlet UIActivityIndicatorView *acti;

@property(nonatomic,retain)IBOutlet MKMapView *map;
-(void)setdico:(NSMutableDictionary*)d;
-(void)shareGooglemapapp;

@end
