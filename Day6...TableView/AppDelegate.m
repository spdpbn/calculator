//
//  AppDelegate.m
//  Day6...TableView
//
//  Created by Student P_07 on 19/06/17.
//  Copyright © 2017 Mandar. All rights reserved.
//

#import "AppDelegate.h"
#import "NextViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.myViewController=[[UIViewController alloc]init];
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=self.myViewController;
  self.myArrayOfStudents=@[@"Mandar",@"Shubham",@"Atish",@"Sanjay",@"Yogesh"];
    
    //self.imageArray=@[@"images.jpeg",@"2.png",@"3.png",@"download-1.jpg",@"download.jpg"];
    //self.myArrayOfFriends=@[@"Mahesh",@"Sagar",@"Pritam",@"Krishna",@"Atish"];
    
    //Allocate the TableView::
    self.myTableView=[[UITableView alloc]initWithFrame:self.window.frame style:UITableViewStyleGrouped];
    
    [self.myViewController.view addSubview:self.myTableView];
    
    //Call predefined method of delegate in this self controller , so we allocate self here ::
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
    }
    else
    {
        cell.accessibilityLabel=@"unchecked";
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    
   /* self.navigationController=[[UINavigationController alloc]init];
    NextViewController *nvc=[[NextViewController alloc]init];
    nvc.selectedStudent=cell.textLabel.text;
    
    self.window.rootViewController=self.navigationController;
    [self.navigationController pushViewController:nvc animated:YES];
    nvc.view.backgroundColor=[UIColor blueColor];
    self.mylabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    self.mylabel.text=cell.textLabel.text;
    [nvc.view addSubview:self.mylabel]; */
    
    
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
    if(self.myArrayOfStudents.count>0)
        return self.myArrayOfStudents.count;
    else
        return 0;
    }
    
    else
    {
        if(self.myArrayOfFriends.count>0)
            return self.myArrayOfFriends.count;
        else
            return 0;
    }
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
        cell.textLabel.text=[self.myArrayOfStudents objectAtIndex:indexPath.row];
        
        //Used for background color of cell::
        cell.contentView.backgroundColor=[UIColor colorWithRed:6 green:6 blue:0 alpha:0.8];
        cell.detailTextLabel.text=@"Student";
    }
    else
    {
        cell.textLabel.text=[self.myArrayOfFriends objectAtIndex:indexPath.row];
        //Used for background color of cell::
        cell.contentView.backgroundColor=[UIColor colorWithRed:6 green:0 blue:0 alpha:0.8];
        cell.detailTextLabel.text=@"Friend";

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
    nvc.selectedStudent=cell.textLabel.text;
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
