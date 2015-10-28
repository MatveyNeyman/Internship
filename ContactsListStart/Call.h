//
//  Call.h
//  ContactsListStart
//
//  Created by User on 10/23/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface Call : NSObject

@property (nonatomic) Contact *contact;

- (instancetype)initWithContact:(Contact *)contact;

@end
