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
    
    //Instantiating new call object with the current contact property belongs to CustomCell superclass
    Call *call = [[Call alloc] initWithContact:self.contact];
    
    //Adding call to recentCalls array of SharedData singleton
    [[SharedData sharedData].recentCalls addObject:call];
    
    //NSLog(@"Recent calls in SharedData %@", [SharedData sharedData].recentCalls);
    
    NSString* phoneNumber = self.contact.phone;
    NSString *number = [NSString stringWithFormat:@"%@",phoneNumber];
    NSURL* callUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]];
    
    //Checking Call Function availability and show 'Simulating call...' message
    if([[UIApplication sharedApplication] canOpenURL:callUrl]) {
        [[UIApplication sharedApplication] openURL:callUrl];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Simulating call..."
                                                     message:@"The real call is only available on the phone"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
        [alert show];
    }
}

@end
