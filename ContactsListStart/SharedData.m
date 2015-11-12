//
//  SharedData.m
//  ContactsListStart
//
//  Created by User on 10/22/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "SharedData.h"
#import "Contact.h"
#import "Call.h"

@interface SharedData ()

@property (nonatomic) NSMutableArray *privateRecentCalls;
@property (nonatomic) NSMutableArray *privateListOfContacts;

@end

@implementation SharedData

+ (instancetype)sharedData {
    static SharedData *sharedData;
    
    if (!sharedData) {
        sharedData = [[self alloc] init];
    }
    return sharedData;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _privateListOfContacts = [NSKeyedUnarchiver unarchiveObjectWithFile:[self contactsPath]];
        if (!_privateListOfContacts) {
            _privateListOfContacts = [NSMutableArray array];
        }
        _privateRecentCalls = [NSKeyedUnarchiver unarchiveObjectWithFile:[self callsPath]];
        if (!_privateRecentCalls) {
            _privateRecentCalls = [NSMutableArray array];
        }
    }
    return self;
}

- (NSArray *)listOfContacts {
    return self.privateListOfContacts;
}

- (NSArray *)recentCalls {
    return self.privateRecentCalls;
}

- (void)addContact:(Contact *)contact {
    [self.privateListOfContacts addObject:contact];
}

- (void)addCall:(Call *)call {
    [self.privateRecentCalls addObject:call];
}

- (NSString *)contactsPath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"contacts.archive"];
}
- (BOOL)saveContacts {
    NSString *path = [self contactsPath];
    return [NSKeyedArchiver archiveRootObject:self.privateListOfContacts toFile:path];
}

- (NSString *)callsPath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"calls.archive"];
}
- (BOOL)saveCalls {
    NSString *path = [self callsPath];
    return [NSKeyedArchiver archiveRootObject:self.privateRecentCalls toFile:path];
}

@end
