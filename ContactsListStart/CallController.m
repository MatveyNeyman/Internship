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
    
    NSLog(@"Recent calls in SharedData %@", [SharedData sharedData].recentCalls);
}

@end
