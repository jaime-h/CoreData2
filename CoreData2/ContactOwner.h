//
//  ContactOwner.h
//  CoreData2
//
//  Created by Jaime Hernandez on 12/17/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contacts;

@interface ContactOwner : NSManagedObject

@property (nonatomic, retain) NSString * ownerName;
@property (nonatomic, retain) NSSet *owner;
@end

@interface ContactOwner (CoreDataGeneratedAccessors)

- (void)addOwnerObject:(Contacts *)value;
- (void)removeOwnerObject:(Contacts *)value;
- (void)addOwner:(NSSet *)values;
- (void)removeOwner:(NSSet *)values;

@end
