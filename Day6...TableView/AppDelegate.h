//
//  AppDelegate.h
//  Day6...TableView
//
//  Created by Student P_07 on 19/06/17.
//  Copyright © 2017 Mandar. All rights reserved.
//

#import <UIKit/UIKit.h>

//Declare two delegate here for TableView::
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *myViewController;
@property (strong, nonatomic) UITableView *myTableView;
@property NSArray *myArrayOfStudents;
@property NSArray *imageArray;
@property UILabel *mylabel;
@property NSArray *myArrayOfFriends;
@property (strong, nonatomic)UINavigationController *navigationController;


@end

