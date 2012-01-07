//
//  NavNews.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "NavNews.h"
#import "Lancement.h"
#import "DetailNews.h"
#import "NewsCell.h"

@implementation NavNews

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"News";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self performSelectorInBackground:@selector(function) withObject:nil];
   
    

}
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [t reloadData];
    // Do any additional setup after loading the view from its nib.
}
-(void)function
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
    
    NSString *s=[NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://natanelpartouche.com/ECE/Version"]];
    NSLog(@"String s = %@",s);
    int versiondl =[s intValue];
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    NSString *Version=[pref objectForKey:@"Version"];
    int theversion=[Version intValue];
    
    if (versiondl>theversion) {
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
    }
    else
    {
        news=[pref objectForKey:@"News"];
    }
    [t reloadData];

    
    [pool release];

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
    return [news count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    
    NewsCell *cell =(NewsCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        
        NSArray *to=[[NSBundle mainBundle]loadNibNamed:@"NewsCell" owner:nil options:nil ];
        for (id currentobject in to) {
            
            if ([currentobject isKindOfClass:[UITableViewCell class]]) {
                cell=(NewsCell*)currentobject;
                break;
            }
        }
        
    }  
    NSMutableDictionary *dico=[news objectAtIndex:[indexPath row]];
    
    
    if (![[dico objectForKey:@"Datelogo"] isEqual:nil]) {
        cell.image.image=[UIImage imageWithData:[dico objectForKey:@"Datalogo"]];
   
    }
    cell.titre.text=[dico objectForKey:@"Titre"];
    cell.assos.text=[dico objectForKey:@"Assos"];
    cell.date.text=[dico objectForKey:@"Date"];

        
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailNews *detailViewController = [[DetailNews alloc] initWithNibName:@"DetailNews" bundle:nil];
    [detailViewController setdico:[news objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:detailViewController animated:YES ];
}



@end
