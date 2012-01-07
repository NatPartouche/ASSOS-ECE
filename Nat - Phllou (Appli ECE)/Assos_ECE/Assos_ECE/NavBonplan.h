//
//  NavBonplan.h
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>
#import "DetailBonplan.h"

@interface NavBonplan : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) NSMutableArray *allAnnotationsArray;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) DetailBonplan *detailBonPlan;

-(void)loadDatas;

-(void)centerOnQG;
-(void)centerOnRg;
-(void)centerOnCnam;
-(void)centerOnUserPosition:(id)sender;

-(void)segmentedControlIndexChanged:(id)sender;

@end
