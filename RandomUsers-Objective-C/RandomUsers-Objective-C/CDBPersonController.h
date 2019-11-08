//
//  CDBPersonController.h
//  RandomUsers-Objective-C
//
//  Created by Ciara Beitel on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDBPersonController : NSObject

// create an array to hold your people
@property (nonatomic) NSArray *people;

// create a method
// return type, methodName, completion handler
- (void)searchForPeople:(void (^)(NSError *error))completion;

@end
