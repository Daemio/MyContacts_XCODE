//
//  MyContact.h
//  MyContacts
//
//  Created by Sergey on 8/3/15.
//  Copyright (c) 2015 Trefa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MyContact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSString * phone;

-(NSString *)getFullName;
@end
