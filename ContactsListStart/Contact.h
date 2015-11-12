//
//  Contact.h
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Contact : NSObject

@property (nonatomic) NSString *firstName, *lastName, *phone, *email, *address;
@property (nonatomic) UIImage *photo;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            phone:(NSString *)phone
                            email:(NSString *)email
                          address:(NSString *)address
                            photo:(UIImage *)photo;

@end
