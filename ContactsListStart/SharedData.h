//
//  SharedData.h
//  ContactsListStart
//
//  Created by User on 10/22/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

//Singleton object for data passing

#import <Foundation/Foundation.h>
@class Contact;
@class Call;

@interface SharedData : NSObject

@property (nonatomic, readonly) NSArray *recentCalls;
@property (nonatomic, readonly) NSArray *listOfContacts;

+ (instancetype)sharedData;

- (void)addContact:(Contact *)contact;
- (void)addCall:(Call *)call;
- (BOOL)saveContacts;
- (BOOL)saveCalls;

@end
