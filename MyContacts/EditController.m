//
//  EditController.m
//  MyContacts
//
//  Created by Sergey on 8/3/15.
//  Copyright (c) 2015 Trefa. All rights reserved.
//

#import "EditController.h"

@interface EditController ()

@end

@implementation EditController{

}
@synthesize nContact;
@synthesize nameField;
@synthesize surnameField;
@synthesize phoneField;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.nContact){
        nameField.text = nContact.name;
        surnameField.text = nContact.surname;
        phoneField.text = nContact.phone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonTapped:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    if(!self.nContact){ //if we create new contact we create row in DB of entity
        NSEntityDescription *ent = [NSEntityDescription entityForName:@"MyContact" inManagedObjectContext:context];
        nContact = (MyContact *)[[NSManagedObject alloc] initWithEntity:ent insertIntoManagedObjectContext:context];
    }
    
    nContact.name = nameField.text;
    nContact.surname = surnameField.text;
    nContact.phone = phoneField.text;
    
    [context save:nil];
    
    [self dismissVC];
}



- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissVC];
}



@end
