//
//  createContactViewController.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "CreateViewController.h"
#import "ContactsViewController.h"
#import "Contact.h"

@interface CreateViewController ()

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *address;

@property (strong, nonatomic) IBOutlet UIButton *createButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;

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

    if (!self.contacts) {
        self.contacts = [NSMutableArray array];
        NSLog(@"Array created in CreateViewController");
    }

    //Checking for empty both name and surname fields and showing an alert message
    if ((self.firstName.text.length == 0) && (self.lastName.text.length == 0)) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil
                                                     message:@"Input first or last name"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    NSData *mock;
    Contact *newContact = [[Contact alloc] initWithFirstName:self.firstName.text
                                                    lastName:self.lastName.text
                                                       phone:self.phone.text
                                                       email:self.phone.text
                                                     address:self.address.text
                                                       photo:mock];
    [self.contacts addObject:newContact];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end

    //NSLog(@"CreateContactViewController: contacts content %@", self.contacts);
        //NSLog(@"Please input first or last name");
