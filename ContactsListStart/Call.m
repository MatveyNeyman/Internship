//
//  Call.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "Call.h"
#import "SharedData.h"

@interface Call ()

@property (strong, nonatomic) IBOutlet UIButton *callButton;

@end

@implementation Call

- (IBAction)call:(id)sender {
    NSLog(@"Call button pressed in instance %@", self.textLabel.text);
    if (!self.calls) {
        self.calls = [NSMutableArray array];
        NSLog(@"Array created in CreateViewController");
    }
    [self.calls addObject:self.textLabel.text];
    [[SharedData sharedData].recentCalls addObject:self.textLabel.text];
    NSLog(@"Array in CreateViewController %@", self.calls);
    NSLog(@"Array in Shared Data %@", [SharedData sharedData].recentCalls);
}

@end
