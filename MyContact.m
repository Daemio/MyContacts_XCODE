//
//  MyContact.m
//  MyContacts
//
//  Created by Sergey on 8/3/15.
//  Copyright (c) 2015 Trefa. All rights reserved.
//

#import "MyContact.h"


@implementation MyContact

@dynamic name;
@dynamic surname;
@dynamic phone;

-(NSString *)getFullName{
    return [NSString stringWithFormat:@"%@ %@",self.name,self.surname];
}

@end
