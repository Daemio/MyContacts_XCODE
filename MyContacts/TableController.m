//
//  TableController.m
//  MyContacts
//
//  Created by Sergey on 8/3/15.
//  Copyright (c) 2015 Trefa. All rights reserved.
//

#import "TableController.h"


@interface TableController ()

@end

@implementation TableController{
    NSManagedObjectContext *context;
    NSFetchedResultsController *frc;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    context=nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    frc = [self getFetchedResultsController];
    frc.delegate=self;
    [frc performFetch:nil];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSFetchRequest *)listFetchRequest{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"MyContact"];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    return request;
}

-(NSFetchedResultsController *)getFetchedResultsController{
    NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:[self listFetchRequest] managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    //NSLog(@"%lu",[[controller sections] count]);
    return controller;
}
#pragma mark - Table view data source

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[frc sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[[frc sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    // Configure the cell...
    MyContact *contact = [frc objectAtIndexPath:indexPath];
    cell.textLabel.text = [contact getFullName];
    cell.detailTextLabel.text = [contact phone];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *cur = [frc objectAtIndexPath:indexPath];
    [context deleteObject:cur];
    [context save:nil];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"editContact"]){
        UITableViewCell *cell = sender;
        NSIndexPath *index = [self.tableView indexPathForCell:cell];
        MyContact *contact = [frc objectAtIndexPath:index];
        EditController *destinationViewController = [segue destinationViewController];
        destinationViewController.nContact = contact;
    };
    if ([segue.identifier isEqual: @"addContact"]){
        EditController *destinationViewController = [segue destinationViewController];
        destinationViewController.nContact = nil;
    };
    
    
}


@end
