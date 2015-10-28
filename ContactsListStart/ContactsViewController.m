//
//  FirstViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "ContactsViewController.h"
#import "CreateViewController.h"
#import "SharedData.h"
#import "CustomCell.h"
#import "ShowItemViewController.h"

@interface ContactsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *UITableView;
@property (nonatomic) NSMutableArray *contacts;
@property (nonatomic) ShowItemViewController *showItemViewController;

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
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellId" forIndexPath:indexPath];
    cell.contact = self.contacts[indexPath.row];
    
    //Showing only first and last name within the cell
    cell.textLabel.text = [self.contacts[indexPath.row] description];
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CreateViewController *crvc = segue.destinationViewController;
    
    //Passing current array to the CreateViewController where a new object will be added
    crvc.contacts = self.contacts;
    self.showItemViewController = segue.destinationViewController;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Passing selected contact to the Recents view
    self.showItemViewController.contact = [self.contacts objectAtIndex:indexPath.row];
}

@end