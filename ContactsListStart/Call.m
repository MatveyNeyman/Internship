//
//  Call.m
//  ContactsListStart
//
//  Created by User on 10/23/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "Call.h"

@interface Call () <NSCoding>

@property (nonatomic) NSString *stringTime;

@end

static NSDateFormatter *dateFormatter = nil;

@implementation Call

- (instancetype)init {
    return [self initWithContact:nil];
}

//Designated initializer
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

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.contact forKey:@"contact"];
    [aCoder encodeObject:self.stringTime forKey:@"time"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _contact = [aDecoder decodeObjectForKey:@"contact"];
        _stringTime = [aDecoder decodeObjectForKey:@"time"];
    }
    return self;
}

@end