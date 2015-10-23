//
//  SecondViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "RecentsViewController.h"
#import "SharedData.h"

@interface RecentsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *UITableView;

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
    self.recentContacts = [SharedData sharedData].recentCalls;
    //NSLog(@"RecentsViewController viewWillAppear self.contacts %@", self.recentContacts);
    [super viewWillAppear:animated];
    //[UINavigationController]
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"tableView:numberOfRowsInSection contacts content %@", self.recentContacts);
    return [self.recentContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecentCellId" forIndexPath:indexPath];
    cell.textLabel.text = [self.recentContacts[indexPath.row] description];
    //NSLog(@"tableView:cellForRowAtIndexPath contacts content %@", self.recentContacts);
    return cell;
}

@end
