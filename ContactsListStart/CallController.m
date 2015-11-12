//
//  Call.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "CallController.h"
#import "SharedData.h"
#import "Call.h"

@interface CallController ()

@property (strong, nonatomic) IBOutlet UIButton *callButton;

@end

@implementation CallController

- (IBAction)call:(id)sender {
    
    //Extracting phone number and preparing a call
    NSString* phoneNumber = self.contact.phone;
    NSString *number = [NSString stringWithFormat:@"%@", phoneNumber];
    NSURL* callUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]];
    
    //Checking Call Function availability and making a call or showing 'Simulating call...' message
    if([[UIApplication sharedApplication] canOpenURL:callUrl] && ![phoneNumber  isEqual: @""]) {
        [[UIApplication sharedApplication] openURL:callUrl];
    } else if (![phoneNumber  isEqual: @""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Simulating call..."
                                                     message:@"The real call is only available on the phone"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No number!"
                                                       message:@"This contact has no number to call"
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    
    if (![phoneNumber  isEqual: @""]) {
        //Instantiating new call object with the current contact property belongs to CustomCell superclass
        Call *newCall = [[Call alloc] initWithContact:self.contact];
        
        //Adding call to the storage
        [[SharedData sharedData] addCall:newCall];
    }
}

@end
