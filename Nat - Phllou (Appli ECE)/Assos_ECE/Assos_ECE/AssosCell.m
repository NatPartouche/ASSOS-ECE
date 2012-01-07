//
//  AssosCell.m
//  Assos_ECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "AssosCell.h"

@implementation AssosCell
@synthesize titre;
@synthesize type;
@synthesize logo;


- (void)dealloc {
    [logo release];
    [titre release];
    [type release];
    [super dealloc];
}
@end
