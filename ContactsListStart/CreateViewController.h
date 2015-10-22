//
//  createContactViewController.h
//  ContactsListStart
//
//  Created by User on 10/21/15.
//  Copyright (c) 2015 Harman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreateViewController;

//@protocol CreateViewControllerDelegate <NSObject>
//- (void)addItemViewController:(CreateViewController *)controller didFinishEnteringItem:(NSString *)item;
//@end

@interface CreateViewController : UIViewController

@property (nonatomic) NSMutableArray *contacts;
//@property (nonatomic, weak) id <CreateViewControllerDelegate> delegate;


@end
