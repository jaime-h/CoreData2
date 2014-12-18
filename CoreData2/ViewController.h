//
//  ViewController.h
//  CoreData2
//
//  Created by Jaime Hernandez on 12/17/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UILabel     *status;

- (IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;



@end

