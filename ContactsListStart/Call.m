//
//  Call.m
//  ContactsListStart
//
//  Created by User on 10/23/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "Call.h"

@interface Call ()

@property (strong, nonatomic) NSDate *time;
@property (nonatomic) Contact *contact;

@end

@implementation Call


- (instancetype)initWithContact:(Contact *)contact {
    self = [super init];
    if (self) {
        self.contact = contact;
        self.time = [NSDate date];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.contact, self.time];
}

@end
