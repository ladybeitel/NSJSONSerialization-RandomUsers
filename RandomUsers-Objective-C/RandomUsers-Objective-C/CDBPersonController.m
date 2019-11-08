//
//  CDBPersonController.m
//  RandomUsers-Objective-C
//
//  Created by Ciara Beitel on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "CDBPersonController.h"
#import "CDBPerson.h"

// This allows for private properties to live in this file
// rather than be in the public facing .h file
@interface CDBPersonController ()

// declare the mutable array prop
@property NSMutableArray *internalPeople;

@end

@implementation CDBPersonController

// set the internal people array to the public array
- (NSArray *) people {
    return self.internalPeople;
}

// init the mutable array prop
- (instancetype)init
{
    self = [super init];
    if (self) {
        // property, make a mutable array, buy the space, init
        _internalPeople = [[NSMutableArray alloc] init];
    }
    return self;
}

// create a static constant for baseURL
static NSString *const baseURLString = @"https://randomuser.me/api/?format=json&results=20";

// create a function to search for people
- (void)searchForPeople:(void (^)(NSError *error))completion {
    // turn baseURLString into a URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    // make a data task w/ completion handler
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // check for an error with the network call
        if (error) {
            completion(error);
            return;
        }
        // can't have optionals, either nil or has value
        NSError *jsonError = nil;
        
        // turn the data task into a dictionary named json
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        // check for an error with the data
        if (jsonError) {
            completion(nil);
            return;
        }
        
        // check to make sure it's a dictionary
        // if our json is not of type NSDict log an error
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected.");
            completion([[NSError alloc] init]);
        }
        
        // coding keys on the fly
        NSArray *fetchedData = json[@"results"];
        // ^this sets up the next level down in the json data
        // give the results of the json dictionary a place to live in this file by creating a mutable array
        NSMutableArray *fetchedPeople = [[NSMutableArray alloc] init];
        
        // looping through json data, check each dict, if it matches our model object then create a person
        for (NSDictionary *personDictionary in fetchedData) {
            CDBPerson *person = [[CDBPerson alloc] initWithDictionary:personDictionary];
            // if a person has been created, append it to the array
            [fetchedPeople addObject:person];
        }
        
        // after appending all persons, set internal array to fetchedPeople array from looping
        self.internalPeople = fetchedPeople;
        completion(nil);
        
    }]; // don't forget ; and resume
    [dataTask resume];
}

@end
