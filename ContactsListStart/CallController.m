//
//  Call.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "CallController.h"
#import "SharedData.h"

@interface CallController ()

//@property (nonatomic) NSMutableArray *calls;
@property (strong, nonatomic) IBOutlet UIButton *callButton;
@property (nonatomic) NSDate *time;

@end

@implementation CallController

- (IBAction)call:(id)sender {
    //NSLog(@"Call button pressed in instance %@", self.textLabel.text);
    
    self.time = [NSDate date];
    [[SharedData sharedData].recentCalls addObject:self]; // .contact];
    
    NSLog(@"Recent calls in SharedData %@", [SharedData sharedData].recentCalls);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.contact, self.time];
}

@end

//if (!self.calls) {
//    self.calls = [NSMutableArray array];
//    NSLog(@"Array created in CreateViewController");
//}
//[self.calls addObject:self.textLabel.text];
//NSLog(@"Array in CreateViewController %@", self.calls);
