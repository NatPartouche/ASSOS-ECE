//
//  DetailNews.h
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNews : UIViewController
{
    IBOutlet UITextView *Description;
    IBOutlet UILabel *Date;
    IBOutlet UILabel *Titre;
    IBOutlet UIImageView *image;
    NSMutableDictionary *dico;
}

-(void)setdico:(NSMutableDictionary *)d;
@end
