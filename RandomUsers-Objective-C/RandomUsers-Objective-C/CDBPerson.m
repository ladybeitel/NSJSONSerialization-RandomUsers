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
- (instancetype) initWithName:(NSString *)name phone:(NSString *)phone email:(NSString *)email thumbnail:(NSString *)thumbnail profile:(NSString *)profile {
    if (self = [super init]) {
        _name = name;
        _phone = phone;
        _email = email;
        _thumbnail = thumbnail;
        _profile = profile;
    }
    return self;
}

// make a person with an email FROM the json dictionary
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // give me a string called email from the dictionary with the key 'email', make the value a string type
    NSString *email = dictionary[@"email"];
    // give me back a person that has been initalized with that email
    
    NSDictionary *nameDictionary = dictionary[@"name"];
    NSString *firstName = nameDictionary[@"first"];
    NSString *lastName = nameDictionary[@"last"];
    NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    NSString *phone = dictionary[@"phone"];
    
    NSDictionary *imageDictionary = dictionary[@"picture"];
    NSString *thumbnail = imageDictionary[@"thumbnail"];
    NSString *profile = imageDictionary[@"large"];
    
    return [self initWithName:name phone:phone email:email thumbnail:thumbnail profile:profile];
}
    
@end
