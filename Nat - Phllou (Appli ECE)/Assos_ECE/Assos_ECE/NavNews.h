//
//  NavNews.h
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaserNewsEvents.h"

@interface NavNews : UIViewController
{
    IBOutlet UITableView *t;
    NSMutableArray *news;
}
@end
