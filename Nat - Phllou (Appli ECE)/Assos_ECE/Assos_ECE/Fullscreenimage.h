//
//  Fullscreenimage.h
//  BDE_EVENT
//
//  Created by Natanel Partouche on 15/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fullscreenimage : UIViewController
{
    IBOutlet UIImageView *image;
    NSData *data;
}
@property(nonatomic,retain)IBOutlet UIImageView *image;
-(void)setdata:(NSData*)d;
@end
