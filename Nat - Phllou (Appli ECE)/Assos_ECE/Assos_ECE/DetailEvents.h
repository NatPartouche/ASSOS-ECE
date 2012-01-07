//
//  DetailEvents.h
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailEvents : UIViewController
{
    IBOutlet UIImageView *image;
    NSMutableDictionary *dico;
    IBOutlet UILabel *Titre;
    IBOutlet UITextView *Date;
    IBOutlet UILabel *Assos;
    IBOutlet UITextView *Description;
}
- (IBAction)localiser:(id)sender;
 
- (IBAction)imagefullscreen:(id)sender;
-(void)setdico:(NSMutableDictionary*)d;
@end
