//
//  AppDelegate.h
//  Day_7Assignment
//
//  Created by Student P_02 on 20/06/17.
//  Copyright © 2017 Felix ITs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIViewController *myViewController;
@property (strong, nonatomic) UITableView *myTableView;
@property NSArray *myArrayOfItems;
@property NSArray *imageArray;
@property UILabel *mylabel;
@property NSArray *myArrayOfPrices;
@property (strong, nonatomic)UINavigationController *navigationController;
@property(strong,nonatomic)UIImageView *myimageview;
@end

