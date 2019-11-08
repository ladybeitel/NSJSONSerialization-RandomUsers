//
//  CDBPeopleTableViewController.m
//  RandomUsers-Objective-C
//
//  Created by Ciara Beitel on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "CDBPeopleTableViewController.h"
#import "CDBPerson.h"
#import "CDBPersonDetailViewController.h"

@interface CDBPeopleTableViewController ()

@end

@implementation CDBPeopleTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _personController = [[CDBPersonController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.personController searchForPeople:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.personController.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    CDBPerson *person = self.personController.people[indexPath.row];
    cell.textLabel.text = person.name;
    NSURL *url = [NSURL URLWithString:person.thumbnail];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowPersonSegue"]) {
        CDBPersonDetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.person = self.personController.people[indexPath.row];
    }
}

@end
