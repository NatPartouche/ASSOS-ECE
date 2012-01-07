//
//  PaserNewsEvents.h
//  BDE_EVENT
//
//  Created by Natanel Partouche on 15/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface PaserNewsEvents : NSObject<NSXMLParserDelegate>
{

    //Evenement
    NSMutableString *Titre,*Assos,*Latitude,*Longitude,*Prix,*Description,*Date,*logo,*logo1,*jour,*jourchiffre,*annee;
    //News
  
    NSMutableArray *News;
    
    
    NSMutableArray *Evenements;
    
    NSString *racine;
    
    NSMutableString *currentElement;
    NSXMLParser *rssparser;
    
    NSMutableDictionary *dico;




}
-(NSMutableArray *)getimageassos;
-(void)parseXMLFileAtURL:(NSString *)URL;
-(void)loadEvenements;
-(void)loadNews;
-(void)loadpicturesNews;
-(void)loadpicturesEvenement;
-(NSMutableArray *)returnEvenement;
-(NSMutableArray *)returnNews;

@end
