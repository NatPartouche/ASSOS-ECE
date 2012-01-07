//
//  DetailAssos.m
//  Assos_ECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "DetailAssos.h"

@implementation DetailAssos

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    logo.image=[UIImage imageNamed:[dico objectForKey:@"Image"]];
    Description.text=[dico objectForKey:@"Description"];
}

- (void)viewDidUnload
{
    [logo release];
    logo = nil;
    [Description release];
    Description = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)setdico:(NSMutableDictionary *)d
{
    dico=d;
}
- (void)dealloc {
    [logo release];
    [Description release];
    [super dealloc];
}
@end
