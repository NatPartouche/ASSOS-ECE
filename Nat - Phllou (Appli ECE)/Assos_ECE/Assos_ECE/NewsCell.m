//
//  NewsCell.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
@synthesize image;
@synthesize titre;
@synthesize assos;
@synthesize date;


- (void)dealloc {
    [image release];
    [titre release];
    [assos release];
    [date release];
    [super dealloc];
}
@end
