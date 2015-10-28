//
//  SharedData.h
//  ContactsListStart
//
//  Created by User on 10/22/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

//Singleton object for data passing

#import <Foundation/Foundation.h>

@interface SharedData : NSObject

+ (SharedData *)sharedData;
@property (nonatomic) NSMutableArray *recentCalls;
@property (nonatomic) NSArray *listOfContacts;

@end
