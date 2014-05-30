//
//  RPUmengConfig.h
//  Pressure
//
//  Created by eason on 4/1/14.
//  Copyright (c) 2014 EasonCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kOnline_Background_Url_List @"rp_background_url_list"
#define kOnline_AppStore_Link       @"rp_appstore_link"
#define kOnline_Online_Host         @"rp_online_host"
#define kOnline_Online_XmppHost     @"rp_online_xmpphost"
#define kOnline_Qiniu_Host          @"rp_qiniu_host"
#define kOnline_Register_TooMuch    @"rp_register_toomuch"
#define kOnline_Register_UserName_Registered    @"rp_register_username_registered"
#define kOnline_Register_UserPassError    @"rp_login_userpasserror"
#define kOnline_RP_Female_Tags    @"rp_female_tags"
#define kOnline_RP_Male_Tags    @"rp_male_tags"
#define kOnline_RP_Evaluate_Tips    @"rp_evaluate_tips"
#define kOnline_RP_Ego_More_Tips    @"rp_ego_more_tips"
#define kOnline_Rp_Fr_Background_Url_List    @"rp_fr_background_url_list"
#define kOnline_rp_evaluate_get_image_from_networkd    @"rp_evaluate_get_image_from_network"



@interface RPUmengConfig : NSObject


+ (void)updateOnlineConfiguration;

+ (NSString *)onlineStringForKey:(NSString *)key;
+ (NSInteger)onlineIntegerForKey:(NSString *)key;
+ (BOOL)onlineBoolForKey:(NSString *)key;
+ (NSInteger)onlineIntegerForKey:(NSString *)key defaultValue:(NSInteger)value;
+ (NSString *)onlineStringForKey:(NSString *)key defaultString:(NSString *)string;


@end
