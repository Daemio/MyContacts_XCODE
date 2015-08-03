//
//  EditController.h
//  MyContacts
//
//  Created by Sergey on 8/3/15.
//  Copyright (c) 2015 Trefa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyContact.h"
#import <CoreData/CoreData.h>

@interface EditController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *surnameField;
@property (strong, nonatomic) IBOutlet UITextField *phoneField;
@property (strong,nonatomic) MyContact *nContact;

- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;


@end

