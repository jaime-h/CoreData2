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

    //old way without the core data classes
    //NSManagedObject *newContact;
    //newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    
    // Saving context with the managed classes
    Contacts *contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    
    contact.name    = self.name.text;
    contact.address = self.address.text;
    contact.phone   = self.phone.text;
    /*
    [newContact setValue:self.name.text    forKey:@"name"];
    [newContact setValue:self.address.text forKey:@"address"];
    [newContact setValue:self.phone.text   forKey:@"phone"];
    */
    self.name.text    = @"";
    self.address.text = @"";
    self.phone.text   = @"";
    
    // also do not really need to do anything here to save as the context should save automatically
    // check when it goes to the background - is a weak reference really needed for it to auto save?
    
    NSError *error;
    [context save:&error]; // Need to do something incase there is an error... . .
    
    self.status.text = @"Contact Saved";
    
    
}

-(IBAction)findContact:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:context];
    
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:entityDesc];
    
    /* 
     
    Need to see if I can find options for the predicate search that will allow me to 
    search in the middle and the end of a string
     
    */
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", self.name.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    // This returns an array - however, this will only display the first hit i.e., index [0]
    
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
