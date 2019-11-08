//
//  CDBPersonDetailViewController.m
//  RandomUsers-Objective-C
//
//  Created by Ciara Beitel on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "CDBPersonDetailViewController.h"

@interface CDBPersonDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *emailAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@end

@implementation CDBPersonDetailViewController

- (void)setPerson:(CDBPerson *)person {
    if (person != _person) {
        _person = person;
        [self updateViews];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    self.title = self.person.name;
    self.phoneNumberLabel.text = self.person.phone;
    self.emailAddressLabel.text = self.person.email;
    NSURL *url = [NSURL URLWithString: self.person.profile];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.profileImageView.image = [UIImage imageWithData:data];
}

@end
