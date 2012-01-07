//
//  PuceLocalisationParking.h
//  DerniereVersionIspark
//
//  Created by Natanel Partouche on 03/05/11.
//  Copyright 2011 ECE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>


@interface PuceLocalisationParking : NSObject <MKAnnotation> {
    
	CLLocationCoordinate2D coordinate; 
	NSString *title; 
	NSString *subtitle;
    int idannot;
    
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate; 
@property (nonatomic, copy) NSString *title; 
@property (nonatomic, copy) NSString *subtitle;
-(int)getidannot;
-(void)setidannot:(int)ida;

@end
