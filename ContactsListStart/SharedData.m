//
//  SharedData.m
//  ContactsListStart
//
//  Created by User on 10/22/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "SharedData.h"

static SharedData *sharedData;

@implementation SharedData

- (instancetype)init {
    self = [super init];
    self.recentCalls = [NSMutableArray array];
    return self;
}

+ (SharedData *)sharedData {
    if (!sharedData) {
        sharedData = [[SharedData alloc] init];
    }
    return sharedData;
}

@end
