//
//  FirstViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "ContactsViewController.h"
#import "CreateViewController.h"

@interface ContactsViewController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *UITableView;
//@property (nonatomic) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (void)awakeFromNib {
    //NSLog(@"ContactsViewController awakedFromNib");
    self.contacts = [NSMutableArray array];
    [self.contacts addObject:@"1"];
    //[self.contacts addObject:@"2"];
    //self.contacts = @[@"1", @"2", @"3", @"4"];
    NSLog(@"awakeFromNib contacts content %@", self.contacts);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"ContactsViewController viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"ContactsViewController viewWillAppear self.contacts %@", self.contacts);
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"tableView:numberOfRowsInSection contacts content %@", self.contacts);
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellId" forIndexPath:indexPath];
    cell.textLabel.text = self.contacts[indexPath.row];
    NSLog(@"tableView:cellForRowAtIndexPath contacts content %@", self.contacts);
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    /*
    CreateViewController *crvc1 = [[CreateViewController alloc]initWithNibName:@"CreateViewController" bundle:nil];
    crvc1.delegate = self;
    [[self navigationController] pushViewController:crvc1 animated:YES];
    */
    
    CreateViewController *crvc2 = segue.destinationViewController;
    crvc2.contacts = self.contacts;
    
    NSLog(@"Prepare for segue in ContactsViewController self.contacts %@", self.contacts);
    NSLog(@"Prepare for segue in ContactsViewController crvc2.contacts %@", crvc2.contacts);
    
}
/*
- (void)addItemViewController:(CreateViewController *)controller didFinishEnteringItem:(NSString *)item
{
    NSLog(@"This was returned from ViewControllerB %@",item);
}
*/
@end
