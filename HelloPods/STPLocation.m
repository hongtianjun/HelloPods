//
//  STPLocation.m
//  Stuep
//
//  Created by hong7 on 2016/10/6.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import "STPLocation.h"
#import "STPRun.h"

#import "RLMRealm+Stuep.h"


@implementation STPLocation

+(NSArray *)indexedProperties {
    return @[@"createTime"];
}

+(NSDictionary *)defaultPropertyValues {
    return @{
             @"createTime":	[NSDate date],
             @"updateTime": [NSDate date],
             @"applicationState": @([[UIApplication sharedApplication] applicationState])
             };
}


@end

@implementation STPLocation(Stuep)

+(RLMResults *)allLocations {
    RLMResults * results = [STPLocation allObjectsInRealm:[RLMRealm stuepRealm]];
    if (results) {
        results = [results sortedResultsUsingProperty:@"createTime" ascending:NO];
    }
    return results;
}

+(void)addLocation:(CLLocation *)location {
    
    STPLocation * sloc = [STPLocation new];
    sloc.longtude = @(location.coordinate.longitude);
    sloc.latiude = @(location.coordinate.latitude);
    sloc.altitude = @(location.altitude);
    
    RLMRealm * realm = [RLMRealm stuepRealm];
    [realm transactionWithBlock:^{
        [STPLocation createInRealm:realm withValue:sloc];
    }];
}

@end
