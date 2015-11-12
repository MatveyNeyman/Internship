//
//  Contact.m
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import "Contact.h"

@interface Contact () <NSCoding>

@end

@implementation Contact

- (instancetype)init {
    return [self initWithFirstName:(NSString *)@""
                          lastName:(NSString *)@""
                             phone:(NSString *)@""
                             email:(NSString *)@""
                           address:(NSString *)@""
                             photo:(UIImage *)nil];
}

//Designated initializer
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            phone:(NSString *)phone
                            email:(NSString *)email
                          address:(NSString *)address
                            photo:(UIImage *)photo {
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

//Overriding NSObject's description method
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.photo forKey:@"photo"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _firstName = [aDecoder decodeObjectForKey:@"firstName"];
        _lastName = [aDecoder decodeObjectForKey:@"lastName"];
        _phone = [aDecoder decodeObjectForKey:@"phone"];
        _email = [aDecoder decodeObjectForKey:@"email"];
        _address = [aDecoder decodeObjectForKey:@"address"];
        _photo = [aDecoder decodeObjectForKey:@"photo"];
    }
    return self;
}

@end
