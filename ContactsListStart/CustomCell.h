//
//  CustomCellTableViewCell.h
//  ContactsListStart
//
//  Created by User on 10/23/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

//We need this class to provide contact property to the UITableViewCell class. There also might be some code for cell's design.

#import <UIKit/UIKit.h>

@class Contact;

@interface CustomCell : UITableViewCell

@property (nonatomic) Contact *contact;

@end
