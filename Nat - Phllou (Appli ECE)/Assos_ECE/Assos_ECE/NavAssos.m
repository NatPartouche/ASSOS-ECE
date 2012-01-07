//
//  NavAssos.m
//  Assos_ECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "NavAssos.h"
#import "AssosCell.h"
@implementation NavAssos

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Les Assos";
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"associations" ofType:@"plist"];
    Assos=[[NSMutableArray alloc]initWithContentsOfFile:path];
    
    
    
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



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [Assos count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AssosCell";
    
    AssosCell *cell =(AssosCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        NSArray *to=[[NSBundle mainBundle]loadNibNamed:@"AssosCell" owner:nil options:nil ];
        for (id currentobject in to) {
            
            if ([currentobject isKindOfClass:[UITableViewCell class]]) {
                cell=(AssosCell*)currentobject;
                break;
            }
        }
        
    }  
    NSMutableDictionary *dico=[Assos objectAtIndex:[indexPath row]];
    
    
    cell.titre.text=[dico objectForKey:@"Name"];
    cell.type.text=[dico objectForKey:@"Type"];
    cell.logo.image=[UIImage imageNamed:[dico objectForKey:@"Image"]];
  
    
    return cell;
}
//Jeudi 17 Novembre 2011
#import "DetailAssos.h"
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailAssos *detailViewController = [[DetailAssos alloc] initWithNibName:@"DetailAssos" bundle:nil];
    NSMutableDictionary *d=[Assos objectAtIndex:[indexPath row]];
    [detailViewController setdico:d];
    
    [self.navigationController pushViewController:detailViewController animated:YES ];
}


@end
