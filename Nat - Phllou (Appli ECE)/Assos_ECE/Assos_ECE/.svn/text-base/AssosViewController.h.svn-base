//
//  AssosViewController.h
//  BDE_EVENT
//
//  Created by Philippe Auriach on 11/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Association.h"
#import "AssosCustomCell.h"
#import "AssoDetailsViewController.h"

@interface AssosViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *associationsTableViewArray;
    
    IBOutlet UITableView *tableView;
    UITableViewCell *customCell;
    BOOL datasLoaded;
}

@property (nonatomic, retain) NSMutableArray *associationsTableViewArray;

@property (nonatomic, retain) IBOutlet AssoDetailsViewController *detailsViewController;
@property (nonatomic, retain) IBOutlet UIImageView *iPadLogoImageView;
@property (nonatomic, retain) IBOutlet UILabel *iPadNameLabel;
@property (nonatomic, retain) IBOutlet UITextView *iPadDescriptionTextView;

-(void)loadDatas;


@end
