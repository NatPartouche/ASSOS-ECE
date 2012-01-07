//
//  AppDelegate.m
//  AssosECE
//
//  Created by Natanel Partouche on 01/12/11.
//  Copyright (c) 2011 ECE. All rights reserved.
//

#import "AppDelegate.h"
#import "NavNews.h"
#import "NavEvents.h"
#import "NavBonplan.h"
@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}
#import "NavAssos.h"
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    UITabBarController *tab=[[UITabBarController alloc]init];
    NavNews *navvews=[[NavNews alloc]init];
    NavEvents *navevents=[[NavEvents alloc]init ];
    NavBonplan *navbonplan=[[NavBonplan alloc]init];
    NavAssos *navassos=[[NavAssos alloc]init];
    
    
    
    UINavigationController *navn=[[UINavigationController alloc]initWithRootViewController:navvews];

     navn.tabBarItem.image=[UIImage imageNamed:@"news.png"];
    
    UINavigationController *nave=[[UINavigationController alloc]initWithRootViewController:navevents];
    nave.tabBarItem.image=[UIImage imageNamed:@"clock.png"];

    UINavigationController *nava=[[UINavigationController alloc]initWithRootViewController:navassos];
    nava.tabBarItem.image=[UIImage imageNamed:@"assos.png"];
    nava.tabBarItem.title=@"Assos";
    UINavigationController *navb=[[UINavigationController alloc]initWithRootViewController:navbonplan];
    navb.tabBarItem.image=[UIImage imageNamed:@"map.png"];

    tab.viewControllers=[NSArray arrayWithObjects:navn,nave,nava,navb, nil];

    [self.window addSubview:tab.view];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
