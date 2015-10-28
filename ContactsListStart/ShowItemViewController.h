//
//  ShowItemViewController.h
//  ContactsListStart
//
//  Created by User on 10/28/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ShowItemViewController : UIViewController

@property (nonatomic) NSArray *contacts;
@property (nonatomic) Contact *contact;

@end
