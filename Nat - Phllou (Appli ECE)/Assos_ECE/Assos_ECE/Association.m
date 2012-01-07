//
//  Association.m
//  BDE_EVENT
//
//  Created by Philippe Auriach on 12/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "Association.h"

@implementation Association

@synthesize assoDescription, logo, name, assoType;

-(id)initWithName:(NSString*)_name withDescription:(NSString*)_description withType:(NSString*)_type andImage:(NSString*)_imgName{
    name = _name;
    assoType = _type;
    assoDescription = _description;
    logo = [UIImage imageNamed:_imgName];
    
    return self;
}


-(id)initimagr:(NSString*)_imgName;

{
    logo=[UIImage imageNamed:_imgName];
    return logo;
}
@end
