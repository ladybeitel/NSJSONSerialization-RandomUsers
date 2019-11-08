//
//  CDBPerson.m
//  RandomUsers-Objective-C
//
//  Created by Ciara Beitel on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "CDBPerson.h"

@implementation CDBPerson

// make a person with an email
- (instancetype) initWithEmail:(NSString *)email {
    if (self = [super init]) {
        _email = email;
    }
    return self;
}

// make a person with an email FROM the json dictionary
- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    // give me a string called email from the dictionary with the key 'email', make the value a string type
    NSString *email = dictionary[@"email"];
    // give me back a person that has been initalized with that email
    return [self initWithEmail:email];
}

@end
