//
//  FirstViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "ContactsViewController.h"
#import "CreateViewController.h"
#import "Contact.h"
#import "RecentsViewController.h"
#import "SharedData.h"
#import "CustomCell.h"

@interface ContactsViewController () //<UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *UITableView;
@property (nonatomic) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (void)awakeFromNib {
    //Initializing SharedData singleton and array with contacts
    self.contacts = (NSMutableArray *)[SharedData sharedData].listOfContacts;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Updating data in SharedData singleton after new contact is created
    [SharedData sharedData].listOfContacts = self.contacts;
    
    //Updatind table view sending message to the tableView property of UITableViewController superclass
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"tableView:numberOfRowsInSection contacts content %@", self.contacts);
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellId" forIndexPath:indexPath];
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellId" forIndexPath:indexPath];
    cell.contact = self.contacts[indexPath.row];
    cell.textLabel.text = [self.contacts[indexPath.row] description];
    //NSLog(@"tableView:cellForRowAtIndexPath contacts content %@", self.contacts);
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CreateViewController *crvc = segue.destinationViewController;
    crvc.contacts = self.contacts;
    //NSLog(@"Prepare for segue in ContactsViewController rcvc.contacts %@", self.contacts);
}

@end

    //NSLog(@"ContactsViewController awakedFromNib");
/*
 NSData *mock;
 Contact *newContact = [[Contact alloc] initWithFirstName:@"TestFirst"
 lastName:@"TestLast"
 phone:@"00000"
 email:@"abcd@abc.com"
 address:@"Pacific Ocean"
 photo:mock];
 [self.contacts addObject:newContact];
 */
//[self.contacts addObject:@"2"];
//self.contacts = @[@"1", @"2", @"3", @"4"];
//NSLog(@"awakeFromNib contacts content %@", self.contacts);

    //RecentsViewController *rcvc = segue.destinationViewController;
    //rcvc.recentContacts = self.contacts;
    //NSLog(@"Prepare for segue in ContactsViewController crvc2.contacts %@", crvc.contacts);