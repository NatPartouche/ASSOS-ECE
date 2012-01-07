//
//  DetailNews.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "DetailNews.h"

@implementation DetailNews

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
    Description.text=[dico objectForKey:@"Description"];
    Date.text=[dico objectForKey:@"Date"];
    Titre.text=[dico objectForKey:@"Titre"];
    self.title=[dico objectForKey:@"Assos"];
    image.image=[UIImage imageWithData:[dico objectForKey:@"Datalogo"]];
    

}

- (void)viewDidUnload
{
    [Titre release];
    Titre = nil;
    [Date release];
    Date = nil;
    [image release];
    image = nil;
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
    [Titre release];
    [Date release];
    [image release];
    [Description release];
    [super dealloc];
}
@end
