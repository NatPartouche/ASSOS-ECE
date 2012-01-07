//
//  PaserNewsEvents.m
//  BDE_EVENT
//
//  Created by Natanel Partouche on 15/11/11.
//  Copyright (c) 2011 ECE Paris. All rights reserved.
//

#import "PaserNewsEvents.h"
/*
 */
@implementation PaserNewsEvents

-(id)init
{

    self = [super init];
    return self;
}

-(NSString*)removecaractere:(NSString*)s
{
    s=[s stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    
    return s;
}

-(NSString*)removecaracterebackslashn:(NSString*)s
{
    s=[s stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return s;
}


-(void)loadEvenements
{
    Evenements=[[NSMutableArray alloc]init];
    racine=@"http://natanelpartouche.com";
    currentElement=[[NSMutableString alloc]init];
    [self parseXMLFileAtURL:[NSString stringWithFormat:@"%@/ECE/Evenement.xml",racine]];
    
}

-(void)loadNews
{
    News=[[NSMutableArray alloc]init];
    
    racine=@"http://natanelpartouche.com";
    currentElement=[[NSMutableString alloc]init];
    [self parseXMLFileAtURL:[NSString stringWithFormat:@"%@/ECE/News.xml",racine]];
    
    
}

-(void)parseXMLFileAtURL:(NSString *)URL
{
	NSURL *xmlurl=[NSURL URLWithString:URL];
    
	rssparser=[[NSXMLParser alloc]initWithContentsOfURL:xmlurl];
	[rssparser setDelegate:self];
	[rssparser setShouldProcessNamespaces:NO];
    [rssparser setShouldReportNamespacePrefixes:NO];
    [rssparser setShouldResolveExternalEntities:NO];
    [rssparser parse];
    
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
	currentElement=[elementName copy];
    if ([currentElement isEqualToString:@"News"]) {

        dico=[[NSMutableDictionary alloc]init];
        Titre=[[NSMutableString alloc]init];
        Assos=[[NSMutableString alloc]init];
        Description=[[NSMutableString alloc]init];
        Date=[[NSMutableString alloc]init];
        logo=[[NSMutableString alloc]init];
        logo1=[[NSMutableString alloc]init];
        
    }
    if ([currentElement isEqualToString:@"Evenement"]) {
        dico=[[NSMutableDictionary alloc]init];
        jour=[[NSMutableString alloc]init];
        jourchiffre=[[NSMutableString alloc]init ];
        annee=[[NSMutableString alloc]init];
        Titre=[[NSMutableString alloc]init];
        Assos=[[NSMutableString alloc]init];
        Latitude=[[NSMutableString alloc]init];
        Longitude=[[NSMutableString alloc]init];
        Prix=[[NSMutableString alloc]init];
        Description=[[NSMutableString alloc]init];
        Date=[[NSMutableString alloc]init];
        logo=[[NSMutableString alloc]init];
        logo1=[[NSMutableString alloc]init];
    }
}




-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{	
    string=[self removecaractere:string];
    string=[self removecaracterebackslashn:string];
    
    if ([currentElement isEqualToString:@"Jour"]) {
        [jour appendString:string];
    }
    if ([currentElement isEqualToString:@"JourChiffre"]) {
        [jourchiffre appendString:string];
    }
    if ([currentElement isEqualToString:@"Annee"]) {
        [annee appendString:string];
    }
    if ([currentElement isEqualToString:@"logo1"]) {
        [logo1 appendString:string];
    }
    if ([currentElement isEqualToString:@"Titre"]) {
        [Titre appendString:string];
    }
    if ([currentElement isEqualToString:@"Assos"]) {
        [Assos appendString:string];
    }
    if ([currentElement isEqualToString:@"Latitude"]) {
        [Latitude appendString:string];
    }   
    if ([currentElement isEqualToString:@"Longitude"]) {
        [Longitude appendString:string];
    }
    if ([currentElement isEqualToString:@"Description"]) {
        [Description appendString:string];
    }
    if ([currentElement isEqualToString:@"Prix"]) {
        [Prix appendString:string];
    }
    if ([currentElement isEqualToString:@"logo"]) {
        [logo appendString:string];
    }
    if ([currentElement isEqualToString:@"Date"]) {
        [Date appendString:string];
    }
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{	
    
    currentElement=[elementName copy];
    
    if ([currentElement isEqualToString:@"News"]) {
        [dico setObject:Titre forKey:@"Titre"];
        [dico setObject:Assos forKey:@"Assos"];
        [dico setObject:Description forKey:@"Description"];
        [dico setObject:Date forKey:@"Date"];
        [dico setObject:logo forKey:@"logo"]; 
        [dico setObject:logo1 forKey:@"logo1"];
        [News addObject:dico];
    }
    
    if ([currentElement isEqualToString:@"Evenement"]) {
        annee = [[NSMutableString alloc] initWithString:[[annee componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""]];
        [dico setObject:annee forKey:@"Annee"];
        jour = [[NSMutableString alloc] initWithString:[[jour componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""]];
        [dico setObject:jour forKey:@"Jour"];
        [dico setObject:jourchiffre forKey:@"JourChiffre"];
        [dico setObject:Titre forKey:@"Titre"];
        [dico setObject:Assos forKey:@"Assos"];
        [dico setObject:Latitude forKey:@"Latitude"];
        [dico setObject:Longitude forKey:@"Longitude"];
        [dico setObject:Prix forKey:@"Prix"];
        [dico setObject:Description forKey:@"Description"];
        [dico setObject:Date forKey:@"Date"];
        [dico setObject:logo forKey:@"logo"];
        [dico setObject:logo1 forKey:@"logo1"];
        [Evenements addObject:dico];
    }
}

-(void)loadpicturesEvenement
{
    for (int i=0; i<[Evenements count]; i++) {
        
    NSMutableDictionary *d=[Evenements objectAtIndex:i];
        
    NSString *string=[NSString stringWithFormat:@"http://natanelpartouche.com/ECE/images/%@",[d objectForKey:@"logo"]];
    string=[string stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"url : %@",string);
    NSURL *url=[NSURL URLWithString:string];
    NSData *datalogo=[NSData dataWithContentsOfURL:url];
        [d setObject:datalogo forKey:@"Datalogo"];
        
       string=[NSString stringWithFormat:@"http://natanelpartouche.com/ECE/images/%@",[d objectForKey:@"logo1"]];
        
        string=[string stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"url : %@",string);
      url=[NSURL URLWithString:string];
      datalogo=[NSData dataWithContentsOfURL:url];
        [d setObject:datalogo forKey:@"Datalogo1"];
    }
}

-(void)loadpicturesNews
{
    for (int i=0; i<[News count]; i++) {
        
        NSMutableDictionary *d=[News objectAtIndex:i];
        
        NSString *string=[NSString stringWithFormat:@"http://natanelpartouche.com/ECE/images/%@",[d objectForKey:@"logo"]];
        string=[string stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"url = %@",string);

        NSURL *url=[NSURL URLWithString:string];
        NSData *datalogo=[NSData dataWithContentsOfURL:url];
            [d setObject:datalogo forKey:@"Datalogo"];
    }
}


#pragma mark - Application's Documents directory

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"did START doc");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"did End doc");
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"parseError");
}



-(NSMutableArray*)returnEvenement
{
    return Evenements;
}
-(NSMutableArray*)returnNews
{
    return News;
}


@end
