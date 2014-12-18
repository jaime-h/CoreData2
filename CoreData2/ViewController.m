//
//  ViewController.m
//  CoreData2
//
//  Created by Jaime Hernandez on 12/17/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveData:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    [newContact setValue:_name.text forKey:@"name"];
    [newContact setValue:self.address.text forKey:@"address"];
    [newContact setValue:self.phone.text forKey:@"phone"];
    
    _name.text = @"";
    self.address.text = @"";
    self.phone.text   = @"";
    
    NSError *error;
    [context save:&error];
    
    self.status.text = @"Contact Saved";
    
    
}

-(IBAction)findContact:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:context];
    
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:entityDesc];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", self.name.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0)
    {
        self.status.text = @"No matches";
    }
    else
    {
        matches = objects[0];
        self.address.text = [matches valueForKey:@"address"];
        self.phone.text   = [matches valueForKey:@"phone"];
        
        self.status.text  = [NSString stringWithFormat:@"%lu matches found", (unsigned long) [objects count]];
    }
}



@end
