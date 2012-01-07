//
//  NavBonplan.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "NavBonplan.h"
#import "AnnotationBonPlan.h"

@implementation NavBonplan
@synthesize allAnnotationsArray, segmentedControl, mapView, detailBonPlan;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Bons Plans";
        self.tabBarItem.image = [UIImage imageNamed:@"map.png"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)centerOnQG{
    NSLog(@"centerOnQG");
    
    MKCoordinateRegion region; 
    MKCoordinateSpan span; 
    span.latitudeDelta=0.01; 
    span.longitudeDelta=0.01; 
    
    CLLocationCoordinate2D newLocation; 
    
    newLocation.latitude = 48.851967;
    newLocation.longitude = 2.287409;
    
    
    region.span=span; 
    region.center=newLocation; 
    
    [mapView setRegion:region animated:TRUE]; 
    [mapView regionThatFits:region];  
}

-(void)centerOnRg{
    NSLog(@"centerOnRG");
    
    MKCoordinateRegion region; 
    MKCoordinateSpan span; 
    span.latitudeDelta=0.01; 
    span.longitudeDelta=0.01; 
    
    CLLocationCoordinate2D newLocation; 
    
    newLocation.latitude =  48.85448;
    newLocation.longitude = 2.325574;
    
    
    region.span=span; 
    region.center=newLocation; 
    
    [mapView setRegion:region animated:TRUE]; 
    [mapView regionThatFits:region];  
}

-(void)centerOnCnam{
    NSLog(@"centerOnCnam");
    
    MKCoordinateRegion region; 
    MKCoordinateSpan span; 
    span.latitudeDelta=0.01; 
    span.longitudeDelta=0.01; 
    
    CLLocationCoordinate2D newLocation; 
    
    newLocation.latitude =  48.866804;
    newLocation.longitude = 2.354615;
    
    region.span=span; 
    region.center=newLocation; 
    
    [mapView setRegion:region animated:TRUE]; 
    [mapView regionThatFits:region]; 
}

-(void)centerOnUserPosition:(id)sender{
    NSLog(@"centerOnUserPosition");
    
    [segmentedControl setSelectedSegmentIndex:-1];
    
    // On fait déplacer la carte vers la nouvelle position courante de l'utilisateur
    MKCoordinateRegion region;
    region.center = mapView.userLocation.coordinate;
    // Le span est le niveau de zoom
    MKCoordinateSpan span;
    span.latitudeDelta = .01;
    span.longitudeDelta = .01;
    region.span = span;
    // Application des nouvelles coordonnées
    [mapView setRegion:region animated:TRUE];
    [mapView regionThatFits:region];  
}

-(void)segmentedControlIndexChanged:(id)sender{
    
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self centerOnQG];
            break;
        case 1:
            [self centerOnRg];
            break;
        case 2:
            [self centerOnCnam];
            
        default:
            break;
    }
    
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    NSLog(@"mapView regionDidChangeAnimated");
    if(animated == FALSE){
        [segmentedControl setSelectedSegmentIndex:-1];
    }
}

#pragma mark - View lifecycle

-(void)loadDatas
{
    //initialisation des pins
    NSString *path = [[NSBundle mainBundle] pathForResource:@"annotations" ofType:@"plist"];
    NSArray *plistArray = [[NSArray alloc] initWithContentsOfFile:path];
    allAnnotationsArray = [[NSMutableArray alloc] initWithObjects:nil];
    
    for(int i = 0; i < [plistArray count]; i++){
        NSLog(@"annotation %d",i);
        NSDictionary *dic = [plistArray objectAtIndex:i];
        NSString *title = [dic objectForKey:@"Name"];
        NSString *type = [dic objectForKey:@"Type"];
        NSString *latitude = [dic objectForKey:@"Latitude"];
        NSString *longitude = [dic objectForKey:@"Longitude"];
        CLLocationCoordinate2D location;
        location.latitude = [latitude doubleValue];
        location.longitude = [longitude doubleValue];
        NSString *description = [dic objectForKey:@"Description"];
        NSString *imgName = [dic objectForKey:@"ImageName"];
        
        AnnotationBonPlan *annot = [[AnnotationBonPlan alloc] initWithTitle:title withDescription:description withType:type withCoordinate:location andImgName:imgName];
        [allAnnotationsArray addObject:annot];
        [mapView addAnnotation:annot];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initialisation de la navbar
    UIBarButtonItem *tempBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"target.png"] style:UIBarButtonItemStylePlain target:self action:@selector(centerOnUserPosition:)];
    self.navigationItem.rightBarButtonItem = tempBarButton;
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:[[NSArray alloc] initWithObjects:@" QG", @"RG", @"Cnam ", nil]];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentedControl addTarget:self action:@selector(segmentedControlIndexChanged:) forControlEvents:UIControlEventAllEvents];
    
    self.navigationItem.titleView = segmentedControl;
    
    // Initialisation classique d'une View
    // On veut afficher la position courante de l'utilisateur
    [mapView setShowsUserLocation:TRUE];
    // MKMapTypeStandard est un mode d'affichage parmis 3 disponibles
    // (les deux autres sont MKMapTypeSatelitte et MKMapTypeHybrid)
    [mapView setMapType:MKMapTypeStandard];
    
    // CLLocationManager permet la gestion de la position géographique de l'utilisateur
    CLLocationManager *locationManager=[[CLLocationManager alloc] init];
    // Le fait de setter le Delegate permet d'appeler méthodes implémentées dans cette classe
    [locationManager setDelegate:self];
    // Définit l'échelle de distance à prendre en compte pour le raffraichissement de la position courante
    [locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [locationManager startUpdatingLocation];
    
    //on centre sur paris
    MKCoordinateRegion region; 
    MKCoordinateSpan span; 
    span.latitudeDelta = 0.1; 
    span.longitudeDelta = 0.1; 
    
    CLLocationCoordinate2D newLocation; 
    
    newLocation.latitude =  48.859633;
    newLocation.longitude = 2.313652;
    
    region.span=span; 
    region.center=newLocation; 
    
    [mapView setRegion:region animated:TRUE]; 
    [mapView regionThatFits:region]; 
    
    detailBonPlan = [[DetailBonplan alloc] init];
    
    [self loadDatas];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [mapView release];
    [super dealloc];
}

- (MKAnnotationView *)mapView:(MKMapView *)_mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";   
    if ([annotation isKindOfClass:[AnnotationBonPlan class]]) {
        AnnotationBonPlan *location = (AnnotationBonPlan *) annotation;
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        if ([location.type compare:@"locaux"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorPurple;
            annotationView.canShowCallout = YES;
            annotationView.rightCalloutAccessoryView = nil;
        } else if ([location.type compare:@"partenaire"] == NSOrderedSame) {
            annotationView.pinColor = MKPinAnnotationColorRed;
            annotationView.canShowCallout = YES;
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            rightButton.tag = [allAnnotationsArray indexOfObject:location];
            [rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView = rightButton;
        }else {
            NSLog(@"Unknown: %@", location.type);
        }
        
        return annotationView;
    }
    
    return nil;    
}

- (void)showDetails:(id)sender{
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        UIButton *button = (UIButton*)sender;
        
        [self.navigationController pushViewController:detailBonPlan animated:YES];
        AnnotationBonPlan *annot = [allAnnotationsArray objectAtIndex:button.tag];
        detailBonPlan.title = [annot getTitle];
        [detailBonPlan.textView setText:[annot getDescription]];
        if(annot.bonPlanImg != NULL)
            [detailBonPlan.logoImageView setImage:annot.bonPlanImg];
        else
            [detailBonPlan.logoImageView setImage:[UIImage imageNamed:@"logoBDE@2x.png"]];
    }
}

@end
