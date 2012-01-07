//
//  NavEvents.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "NavEvents.h"
#import "EventsCell.h"
@implementation NavEvents

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Events";
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

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    events=[pref objectForKey:@"Events"];

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [events count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventsCell";
    
    EventsCell *cell =(EventsCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        NSArray *to=[[NSBundle mainBundle]loadNibNamed:@"EventsCell" owner:nil options:nil ];
        for (id currentobject in to) {
            
            if ([currentobject isKindOfClass:[UITableViewCell class]]) {
                cell=(EventsCell*)currentobject;
                break;
            }
        }
        
    }  
    NSMutableDictionary *dico=[events objectAtIndex:[indexPath row]];
    
    cell.Titre.text=[dico objectForKey:@"Titre"];
    cell.Assos.text=[dico objectForKey:@"Assos"];
    cell.Description.text=[dico objectForKey:@"Description"];
    
    cell.annee.text=[dico objectForKey:@"Annee"];
    cell.jour.text=[dico objectForKey:@"Jour"];
    cell.chiffrejour.text=[dico objectForKey:@"JourChiffre"];
    
    return cell;
}
//Jeudi 17 Novembre 2011
#import "DetailEvents.h"
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailEvents *detailViewController = [[DetailEvents alloc] initWithNibName:@"DetailEvents" bundle:nil];
    NSMutableDictionary *d=[events objectAtIndex:[indexPath row]];
    [detailViewController setdico:d];
    
    [self.navigationController pushViewController:detailViewController animated:YES ];
}



@end
