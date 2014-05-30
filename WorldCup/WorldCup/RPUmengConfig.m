//
//  RPUmengConfig.m
//  Pressure
//
//  Created by eason on 4/1/14.
//  Copyright (c) 2014 EasonCompany. All rights reserved.
//

#import "RPUmengConfig.h"
#define kUMeng  1

#define kUpdateInterval  10
static RPUmengConfig *sharedInstance;

@interface RPUmengConfig ()
{
    
}

@property (nonatomic, retain) NSDate *lastUpdateTime;   // 记录上次更新时间，避免更新频繁
@end
@implementation RPUmengConfig



- (void)updateOnlineConfigurationIfNeeded {
    
    BOOL needUpdate = NO;
    NSDate *now = [NSDate date];
    if (!_lastUpdateTime) {
        needUpdate = YES;
    } else if ([now timeIntervalSinceDate:_lastUpdateTime] > kUpdateInterval) {
        needUpdate = YES;
    }
    
    if (needUpdate) {
#ifdef kUMeng
        [MobClick updateOnlineConfig];
#endif
        self.lastUpdateTime = now;
    }
}

+ (RPUmengConfig *)sharedInstance {
    
    if (sharedInstance) {
        return sharedInstance;
    }
    
    sharedInstance = [[RPUmengConfig alloc] init];
    return sharedInstance;
}

+ (void)updateOnlineConfiguration {
    
    RPUmengConfig *instance = [RPUmengConfig sharedInstance];
    [instance updateOnlineConfigurationIfNeeded];
}

+ (NSString *)onlineStringForKey:(NSString *)key {
    
    [self updateOnlineConfiguration];
#ifdef kUMeng
    return [MobClick getConfigParams:key];
#endif
    return nil;
}

+ (NSInteger)onlineIntegerForKey:(NSString *)key {
    
    [self updateOnlineConfiguration];
#ifdef kUMeng
    return [[MobClick getConfigParams:key] integerValue];
#endif
    return 0;
}

+ (NSString *)onlineStringForKey:(NSString *)key defaultString:(NSString *)defaultString {
    
    [self updateOnlineConfiguration];
    NSString *re = @"";
#ifdef kUMeng
    re = [MobClick getConfigParams:key];
#endif
    
    return re;
}

+ (NSInteger)onlineIntegerForKey:(NSString *)key defaultValue:(NSInteger)value {
    
    [self updateOnlineConfiguration];
    NSString *re = @"";
    
#ifdef kUMeng
    re = [MobClick getConfigParams:key];
#endif
    
    
    
    return [re integerValue];
}

+ (BOOL)onlineBoolForKey:(NSString *)key {
    
    [self updateOnlineConfiguration];
#ifdef kUMeng
    int re = [[MobClick getConfigParams:key] integerValue];
    return re==1;
#endif
    return NO;
}

@end
