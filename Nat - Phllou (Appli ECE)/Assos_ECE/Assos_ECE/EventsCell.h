//
//  EventsCell.h
//  Assos_ECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *jour;
@property (retain, nonatomic) IBOutlet UILabel *chiffrejour;
@property (retain, nonatomic) IBOutlet UILabel *annee;
@property (retain, nonatomic) IBOutlet UILabel *Titre;
@property (retain, nonatomic) IBOutlet UILabel *Description;
@property (retain, nonatomic) IBOutlet UILabel *Assos;

@end
