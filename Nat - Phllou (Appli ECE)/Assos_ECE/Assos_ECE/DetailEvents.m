//
//  DetailEvents.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "DetailEvents.h"

@implementation DetailEvents

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
    
    image.image=[UIImage imageWithData:[dico objectForKey:@"Datalogo"]];
    Titre.text=[dico objectForKey:@"Titre"];
    Description.text=[dico objectForKey:@"Description"];
    Date.text=[dico objectForKey:@"Date"];
    Assos.text=[dico objectForKey:@"Assos"];
    // Do any additional setup after loading the view from its nib.
}

-(void)setdico:(NSMutableDictionary *)d
{
    dico=d;
}
#import "ParkingLocalisation.h"
- (IBAction)localiser:(id)sender {
    
    ParkingLocalisation *p=[[ParkingLocalisation alloc]init];
    [p setdico:dico];
    [self.navigationController pushViewController:p animated:YES];
}
#import "Fullscreenimage.h"

- (IBAction)imagefullscreen:(id)sender {
    
    Fullscreenimage *f=[[Fullscreenimage alloc]init];
    [f setdata:[dico objectForKey:@"Datalogo1"]];
    f.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:f animated:YES];
    
    
    
}

- (void)viewDidUnload
{
    [image release];
    image = nil;
    [Titre release];
    Titre = nil;
    [Date release];
    Date = nil;
    [Assos release];
    Assos = nil;
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

- (void)dealloc {
    [image release];
    [Titre release];
    [Date release];
    [Assos release];
    [Description release];
    [super dealloc];
}
@end
