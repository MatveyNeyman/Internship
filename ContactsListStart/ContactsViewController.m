//
//  FirstViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *UITableView;
//@property (nonatomic) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (void)awakeFromNib {
    NSLog(@"ContactsViewController awakedFromNib");
    self.contacts = [NSMutableArray array];
    //self.contacts = @[@"1", @"2", @"3", @"4"];
    //NSLog(@"contacts content %@", self.contacts);
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellId" forIndexPath:indexPath];
    cell.textLabel.text = self.contacts[indexPath.row];
    //NSLog(@"contacts content %@", self.contacts);
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //ContactsViewController *cvc = segue.destinationViewController;
    //cvc.contacts = self.contacts;
    NSLog(@"Prapare for segue");//, cvc.contacts);
}

@end
