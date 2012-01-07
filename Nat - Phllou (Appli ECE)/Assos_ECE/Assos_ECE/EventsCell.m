//
//  EventsCell.m
//  Assos_ECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "EventsCell.h"

@implementation EventsCell
@synthesize jour;
@synthesize chiffrejour;
@synthesize annee;
@synthesize Titre;
@synthesize Description;
@synthesize Assos;

- (void)dealloc {
    [jour release];
    [chiffrejour release];
    [annee release];
    [Titre release];
    [Description release];
    [Assos release];
    [super dealloc];
}
@end
