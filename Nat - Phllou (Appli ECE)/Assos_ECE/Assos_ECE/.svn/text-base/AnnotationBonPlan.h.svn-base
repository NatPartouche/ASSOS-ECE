//
//  AnnotationBonPlan.h
//  AssosECE
//
//  Created by Philippe Auriach on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AnnotationBonPlan : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *annotTitle;
@property (nonatomic, readonly) NSString *annotDescription;
@property (nonatomic, readonly) NSString *annotType;
@property (nonatomic, readonly) UIImage *bonPlanImg;

-(id)initWithTitle:(NSString *)_title withDescription:(NSString *)_description withType:(NSString *)_type withCoordinate:(CLLocationCoordinate2D)_coordinates andImgName:(NSString*)_imgName;

- (NSString *)getTitle;

- (NSString *)getDescription;

- (NSString *)type;

@end
