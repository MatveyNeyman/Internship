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

@interface CreateViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UIImageView *photo;

@property (strong, nonatomic) IBOutlet UIButton *createButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *addPhotoButton;

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

//Opening photo gallery to pick the image up
- (IBAction)addPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

//Setting choosen picture for contact's photo and dismissing the button
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *choosedImage = info[UIImagePickerControllerOriginalImage];
    self.photo.image = choosedImage;
    [self dismissViewControllerAnimated:YES completion:nil];
    self.addPhotoButton.hidden = YES;
}

- (IBAction)create:(id)sender {
    
    //Safety check
    if (!self.contacts) {
        self.contacts = [NSMutableArray array];
    }

    //Checking for empty both name and surname fields and showing an alert message
    if ((self.firstName.text.length == 0) && (self.lastName.text.length == 0)) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil
                                                      message:@"Input first or last name"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    //Creating new contact object initialized by the text fields and adding it to the array
    Contact *newContact = [[Contact alloc] initWithFirstName:self.firstName.text
                                                    lastName:self.lastName.text
                                                       phone:self.phone.text
                                                       email:self.email.text
                                                     address:self.address.text
                                                       photo:self.photo.image];
    [self.contacts addObject:newContact];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
