//
//  createContactViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "CreateViewController.h"
#import "ContactsViewController.h"

@interface CreateViewController ()



@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *address;

@property (strong, nonatomic) IBOutlet UIButton *createButton;

//@property (nonatomic) NSMutableArray *contacts;

//@property (nonatomic) ContactsViewController *cvc;

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)create:(id)sender {

    //NSLog(@"Clicked");
    if (!self.contacts) {
        self.contacts = [NSMutableArray array];
        NSLog(@"Array created in CreateViewController");
    }
    [self.contacts addObject:self.firstName.text];
    NSLog(@"CreateContactViewController: contacts content %@", self.contacts);
    
//    NSString *itemToPassBack = @"Pass this value back to ContactsViewController";
//    [self.delegate addItemViewController:self didFinishEnteringItem:itemToPassBack];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ContactsViewController *covc = segue.destinationViewController;
    covc.contacts = self.contacts;
    NSLog(@"Prapare for segue in CreateViewController%@", covc.contacts);
}
*/
@end

