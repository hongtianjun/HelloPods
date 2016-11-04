//
//  STPLocation.h
//  Stuep
//
//  Created by hong7 on 2016/10/6.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import <Realm/Realm.h>
#import <CoreLocation/CoreLocation.h>

@interface STPLocation : RLMObject

@property (nonnull,nonatomic,strong) NSDate * createTime;
@property (nonnull,nonatomic,strong) NSDate * updateTime;

@property (nonnull,nonatomic,strong) NSNumber<RLMDouble> * latiude;
@property (nonnull,nonatomic,strong) NSNumber<RLMDouble> * longtude;
@property (nonnull,nonatomic,strong) NSNumber<RLMDouble> * altitude;

@property (nonnull,nonatomic,strong) NSNumber<RLMInt> * applicationState;



@end

RLM_ARRAY_TYPE(STPLocation);


@interface STPLocation(Stuep)

+(RLMResults * _Nonnull)allLocations;

+(void)addLocation:(CLLocation * _Nonnull)location;

@end
