//
//  CDBPerson.h
//  RandomUsers-Objective-C
//
//  Created by Ciara Beitel on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDBPerson : NSObject

// Create properties of type, pointer, propName
@property NSString *name;
@property NSString *phone;
@property NSString *email;
@property NSString *thumbnail;
@property NSString *profile;

// Create initializer  parameter name, of type, pointer, initName
- (instancetype) initWithName:(NSString *)name phone:(NSString *)phone email:(NSString *)email thumbnail:(NSString *)thumbnail profile:(NSString *)profile;

//dig thru the json dictionaries
- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

