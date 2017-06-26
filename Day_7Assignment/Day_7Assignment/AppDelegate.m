//
//  AppDelegate.m
//  Day_7Assignment
//
//  Created by Student P_02 on 20/06/17.
//  Copyright © 2017 Felix ITs. All rights reserved.
//

#import "AppDelegate.h"
#import "NextViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.myViewController=[[UIViewController alloc]init];
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=self.myViewController;
    self.myArrayOfItems=@[@"Desktop",@"Laptop  ",@"Tab",@"Mobile Phones",@"Pen Drives"];
    self.imageArray=@[@"download.jpeg",@"lap.jpg",@"tab.jpg",@"mobile.jpg",@"pendrive.jpg"];
    self.myArrayOfPrices=@[@"20000",@"40000",@"10000",@"5000",@"500"];
    //allocate tableview
    self.myTableView=[[UITableView alloc]initWithFrame:self.window.frame style:UITableViewStyleGrouped];
    
    [self.myViewController.view addSubview:self.myTableView];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    [self.window makeKeyAndVisible];
    return YES;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if ((cell.accessoryType==UITableViewCellAccessoryNone)) {
        cell.accessibilityLabel=@"checked";
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        self.navigationController=[[UINavigationController alloc]init];
        NextViewController *nvc=[[NextViewController alloc]init];
        nvc.selectedItems=cell.textLabel.text;
        
        self.window.rootViewController=self.navigationController;
        [self.navigationController pushViewController:nvc animated:YES];
        nvc.view.backgroundColor=[UIColor blueColor];
        self.mylabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 150, 100, 100)];
        self.mylabel.text=cell.textLabel.text;
        UIImage *image=[UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
                        
        self.myimageview=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
        self.myimageview.image=image;
        [nvc.view addSubview:self.myimageview];
        [nvc.view addSubview:self.mylabel];
        
    }
    else
    {
        cell.accessibilityLabel=@"unchecked";
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Gives the no of sections in table::
    //return 1;
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Gives no of rows to table View::
    if(section==0)
    {
        if(self.myArrayOfItems.count>0)
            return self.myArrayOfItems.count;
        else
            return 0;
    }
    
    return 0;
}

//Following method used for data::
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCellStyleDefault is style for cell::
    //There are 4 style of cell::
    //UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
    /*Add image to cell::
     UIImage *myImage=[UIImage imageNamed:@"images.jpeg"];
     /cell.imageView.image=myImage;*/
    
    
    //Add diff image to diff cell::
    UIImage *image=[UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    cell.imageView.image=image;
    
    //Following is loop::
    if(indexPath.section==0)
    {
        cell.textLabel.text=[self.myArrayOfItems objectAtIndex:indexPath.row];
        
        //Used for background color of cell::
        cell.contentView.backgroundColor=[UIColor colorWithRed:6 green:6 blue:0 alpha:0.8];
        
    }
    
    UISwitch *mySwitch=[[UISwitch alloc]init];
    [mySwitch addTarget:self action:@selector(pressMySwitch:) forControlEvents:UIControlEventValueChanged];
    mySwitch.accessibilityLabel=cell.textLabel.text;
    //  cell.accessoryView=mySwitch;
    
    // cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    self.navigationController=[[UINavigationController alloc]init];
    NextViewController *nvc=[[NextViewController alloc]init];
    nvc.selectedItems=cell.textLabel.text;
    self.window.rootViewController=self.navigationController;
    [self.navigationController pushViewController:nvc animated:YES];
    
    
}

-(void)pressMySwitch:(UISwitch *)sender
{
    NSLog(@"Using switch You selected %@",sender.accessibilityLabel);
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
