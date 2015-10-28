//
//  ShowItemViewController.m
//  ContactsListStart
//
//  Created by User on 10/28/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "ShowItemViewController.h"

@interface ShowItemViewController ()

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation ShowItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Initializing properties
    self.firstName.text = self.contact.firstName;
    self.lastName.text = self.contact.lastName;
    self.phone.text = self.contact.phone;
    self.email.text = self.contact.email;
    self.address.text = self.contact.address;
    self.photo.image = self.contact.photo;
}

@end
