//
//  Call.m
//  ContactsListStart
//
//  Created by User on 10/23/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "Call.h"

@interface Call ()

@property (nonatomic) NSString *stringTime;
@property (nonatomic) Contact *contact;

@end

static NSDateFormatter *dateFormatter = nil;

@implementation Call

- (instancetype)initWithContact:(Contact *)contact {
    self = [super init];
    if (self) {
        //Initializing call's contact property
        self.contact = contact;
        
        //Time formatting
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterNoStyle;
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.locale = [NSLocale currentLocale];
        NSDate *time = [NSDate date];
        
        //Initializing the time of call stringTime property
        self.stringTime = [dateFormatter stringFromDate:time];
        
    }
    return self;
}

//Overriding NSObject's description method
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.contact, self.stringTime];
}

@end