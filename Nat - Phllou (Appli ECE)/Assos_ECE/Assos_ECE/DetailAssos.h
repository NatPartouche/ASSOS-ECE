//
//  DetailAssos.h
//  Assos_ECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailAssos : UIViewController
{
    NSMutableDictionary *dico;
    IBOutlet UIImageView *logo;
    IBOutlet UITextView *Description;
}

-(void)setdico:(NSMutableDictionary *)d;

@end
