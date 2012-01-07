//
//  ParkingLocalisation.m
//  Ispark4.0
//
//  Created by Natanel Partouche on 19/04/11.
//  Copyright 2011 ECE. All rights reserved.
//

#import "ParkingLocalisation.h"

@implementation ParkingLocalisation
@synthesize coordinate;
@synthesize acti;
@synthesize map;


- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *but=[[UIBarButtonItem alloc]initWithTitle:@"itinéraire" style:UIBarButtonItemStyleDone target:self action:@selector(shareGooglemapapp)];

    self.navigationItem.rightBarButtonItem=but;
	self.title=@"Localisation";
   
	[map setMapType:MKMapTypeStandard];
    map.showsUserLocation=YES;

	[map setDelegate:self];
	
	locationmanager=[[CLLocationManager alloc] init];

	
	if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
		[locationmanager stopMonitoringSignificantLocationChanges];
		[locationmanager startUpdatingLocation];
	}
	
	[locationmanager setDelegate:self];
	[locationmanager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
	
	[locationmanager startUpdatingLocation];
	[self.view addSubview:map];	
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	region.center.latitude = [[dico objectForKey:@"Latitude"] doubleValue] ;
	region.center.longitude = [[dico objectForKey:@"Longitude"] doubleValue];
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
    [map setRegion:region animated:YES]; 

    PuceLocalisationParking *ann = [[[PuceLocalisationParking alloc] init] autorelease]; 
	ann.title =[dico objectForKey:@"Titre"];
	ann.subtitle =[dico objectForKey:@"Date"]; 
    ann.coordinate = region.center; 

	[map addAnnotation:ann];
	
}
-(void)setdico:(NSMutableDictionary*)d
{
    dico=d;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [locationmanager stopMonitoringSignificantLocationChanges];
    [locationmanager stopUpdatingHeading];
    [locationmanager stopUpdatingLocation];
    locationmanager=nil;
	NSLog(@"des");
}


#pragma mark - Annotation

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:
(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinView = nil; 
	if(annotation != map.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil ) pinView = [[[MKPinAnnotationView alloc]
										  initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
        
        
        pinView.pinColor = MKPinAnnotationColorPurple; 
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
    } 
	else {
		[map.userLocation setTitle:@"Position Actuelle"];
	}
	return pinView;
}


#pragma mark - CLLocationManagerDelegate


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	

	double lat=[[dico objectForKey:@"Latitude"] doubleValue];
	double lo=[[dico objectForKey:@"Longitude"] doubleValue];
	location.latitude=lat;
	location.longitude=lo;
	
    
    NSLog(@"lat = %f",lat);
    NSLog(@"long = %f",lo);
    
	
	destination=newLocation.coordinate;
	
	// On fait deplacer la carte vers la nouvelle position courante de l'utilisateur
	MKCoordinateRegion region;

	region.center = location;
	// Le span est le niveau de zoom
	MKCoordinateSpan span;
	span.latitudeDelta = 1.0;
	span.longitudeDelta = 1.0;
	region.span = span;
	// Application des nouvelles coordonnées
	[map setRegion:region animated:TRUE];
	
}


-(void)shareGooglemapapp
{

	CLLocationCoordinate2D start = { destination.latitude,destination.longitude};
	CLLocationCoordinate2D end = { location.latitude,location.longitude };        
	
	NSString *googleMapsURLString = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%1.6f,%1.6f&daddr=%1.6f,%1.6f",
									 start.latitude, start.longitude, end.latitude, end.longitude];
	
    NSLog(@"%@",googleMapsURLString);
	NSURL *url=[NSURL URLWithString:googleMapsURLString];
	
	[[UIApplication sharedApplication] openURL:(NSURL *)url];
	[locationmanager stopUpdatingLocation];
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	map=nil;
	locationmanager=nil;
    acti=nil;
}


- (void)dealloc {
	
	[map release];	
    [locationmanager release];
    [super dealloc];
}


@end
