//
//  Fullscreenimage.m
//  BDE_EVENT
//
//  Created by Natanel Partouche on 15/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "Fullscreenimage.h"

@implementation Fullscreenimage
@synthesize image;
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/
-(IBAction)dismiss:(id)sender
{

    [self dismissModalViewControllerAnimated:YES];
}
-(void)setdata:(NSData*)d
{
    data=d;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    image.image=[UIImage imageWithData:data];

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
