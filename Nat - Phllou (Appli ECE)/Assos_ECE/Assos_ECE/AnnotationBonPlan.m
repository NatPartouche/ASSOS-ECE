//
//  AnnotationBonPlan.m
//  AssosECE
//
//  Created by Philippe Auriach on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "AnnotationBonPlan.h"

@implementation AnnotationBonPlan

@synthesize title, subtitle, annotType, annotTitle, bonPlanImg, coordinate, annotDescription;

-(id)initWithTitle:(NSString *)_title withDescription:(NSString *)_description withType:(NSString *)_type withCoordinate:(CLLocationCoordinate2D)_coordinates andImgName:(NSString*)_imgName{
    
    if( (self = [super init]) ){
        annotTitle = _title;
        annotDescription = _description;
        annotType = _type;
        coordinate = _coordinates;
        bonPlanImg = [UIImage imageNamed:_imgName];
    }
    return self;
}

- (NSString *)title {
    return annotTitle;
}

- (NSString *)subtitle {
    return nil;
}

- (NSString *)getTitle {
    return annotTitle;
}

- (NSString *)getDescription {
    return annotDescription;
}

-(NSString *) type{
    return annotType;
}

@end
