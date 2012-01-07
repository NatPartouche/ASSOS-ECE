//
//  PuceLocalisationParking.m
//  DerniereVersionIspark
//
//  Created by Natanel Partouche on 03/05/11.
//  Copyright 2011 ECE. All rights reserved.
//

#import "PuceLocalisationParking.h"


@implementation PuceLocalisationParking

@synthesize coordinate,title,subtitle;


-(void)dealloc{
	[title release];
	[super dealloc];
}

-(void)setidannot:(int)ida
{
    idannot=ida;
}
-(int)getidannot
{
    return idannot;
}

@end
