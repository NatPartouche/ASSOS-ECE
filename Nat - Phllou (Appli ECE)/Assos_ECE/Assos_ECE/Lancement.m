//
//  Lancement.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "Lancement.h"

@implementation Lancement
@synthesize Acti;

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
    [Acti startAnimating];
    
    [self performSelectorInBackground:@selector(chargementdesdonnees) withObject:nil];
}

#import "PaserNewsEvents.h"
-(void)chargementdesdonnees
{    
    PaserNewsEvents *p=[[PaserNewsEvents alloc] init];
    [p loadNews];
    [p loadpicturesNews];
    [p loadEvenements];
    [p loadpicturesEvenement];
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:[p returnNews] forKey:@"News"];
    [pref setValue:[p returnEvenement] forKey:@"Events"];
    NSString *s=[NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://natanelpartouche.com/ECE/Version"]];
    [pref setValue:s forKey:@"Version"];
    [pref synchronize];
    [Acti stopAnimating];
    [self dismissModalViewControllerAnimated:YES];

}
- (void)viewDidUnload
{
    [self setActi:nil];
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
    [Acti release];
    [super dealloc];
}
@end
