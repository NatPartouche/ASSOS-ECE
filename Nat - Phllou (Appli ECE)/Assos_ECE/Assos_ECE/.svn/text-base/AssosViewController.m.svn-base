//
//  AssosViewController.m
//  BDE_EVENT
//
//  Created by Philippe Auriach on 11/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "AssosViewController.h"

@implementation AssosViewController

@synthesize associationsTableViewArray, detailsViewController, iPadDescriptionTextView, iPadNameLabel, iPadLogoImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Assos";
        self.tabBarItem.image = [UIImage imageNamed:@"assos.png"];
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
    
    //loading associations infos
    [self loadDatas];
    
}

-(void)loadDatas{
    if(!datasLoaded){
        //loading associations infos
        associationsTableViewArray = [[NSMutableArray alloc] initWithObjects:nil];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"associations" ofType:@"plist"];
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:path];
        
        for(int i=0; i<[array count]; i++){
            NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
            Association *asso = [[Association alloc] initWithName:[dic objectForKey:@"Name"] withDescription:[dic objectForKey:@"Description"] withType:[dic objectForKey:@"Type"] andImage:[dic objectForKey:@"Image"]];
            [associationsTableViewArray addObject:asso];
        }
        //tri par ordre alphabetique
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        associationsTableViewArray = [NSMutableArray arrayWithArray:[associationsTableViewArray sortedArrayUsingDescriptors:sortDescriptors]];
        
        datasLoaded = true;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if([[UIDevice currentDevice] userInterfaceIdiom] != UIUserInterfaceIdiomPhone){
            [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:TRUE scrollPosition:UITableViewScrollPositionTop];
            [self tableView:tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - tableView Delegate Methods
- (NSInteger)tableView:(UITableView *)_tableView numberOfRowsInSection:(NSInteger)section{

        return [associationsTableViewArray count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AssosCustomCellIdentifier";
    AssosCustomCell *cell = (AssosCustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"AssoCustomCellView_iPhone" owner:self options:nil];
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (AssosCustomCell *) currentObject;
				break;
			}
		}
	}
    
	Association *asso = [associationsTableViewArray objectAtIndex:indexPath.row];
     
    cell.nameLabel.text = [asso name];
    cell.typeLabel.text = [asso assoType];
    cell.logoImageView.image = [asso logo];
    
    return cell;
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Association *asso = [associationsTableViewArray objectAtIndex:indexPath.row];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        [self.navigationController pushViewController:detailsViewController animated:YES];
        [detailsViewController.nameLabel setText:[asso name]];
        [detailsViewController.descriptionLabel setText:[asso assoDescription]];
        [detailsViewController.logoImageView setImage:[asso logo]];
    }else{
        [iPadLogoImageView setImage:[asso logo]];
        [iPadNameLabel setText:[asso name]];
        [iPadDescriptionTextView setText:[asso assoDescription]];
    }
}


@end
