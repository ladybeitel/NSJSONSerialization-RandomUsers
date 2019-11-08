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
@property NSString *email;

// Create initializer  parameter name, of type, pointer, initName
- (instancetype) initWithEmail:(NSString *)email;

//dig thru the json dictionaries
- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

