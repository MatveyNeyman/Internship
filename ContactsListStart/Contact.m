//
//  Contact.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "Contact.h"

@interface Contact ()

@property (strong, nonatomic) NSString *firstName, *lastName, *phone, *email, *address;
@property (strong, nonatomic) NSData *photo;

@end


@implementation Contact

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            phone:(NSString *)phone
                            email:(NSString *)email
                          address:(NSString *)address
                            photo:(NSData *)photo;
{
    
    self = [super init];
    
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phone = phone;
        self.email = email;
        self.address = address;
        self.photo = photo;
    }
    return self;
}

@end
