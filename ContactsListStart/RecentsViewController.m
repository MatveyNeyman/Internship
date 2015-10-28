//
//  SecondViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "RecentsViewController.h"
#import "SharedData.h"
#import "ShowItemViewController.h"
#import "Call.h"

@interface RecentsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *UITableView;
@property (nonatomic) NSMutableArray *recentContacts;
@property (nonatomic) ShowItemViewController *showItemViewController;

@end

@implementation RecentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    //SharedData object provides passing the contact to the Recents tab
    self.recentContacts = [SharedData sharedData].recentCalls;
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.recentContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecentCellId" forIndexPath:indexPath];
    cell.textLabel.text = [self.recentContacts[indexPath.row] description];
    return cell;
}

//This method is called before decided which contact object to show
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.showItemViewController = segue.destinationViewController;
}

//This method is called after prepareForSegue:sender for passing choosed contact
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Call *selectedCall = [self.recentContacts objectAtIndex:indexPath.row];
    self.showItemViewController.contact = selectedCall.contact;
}

@end
