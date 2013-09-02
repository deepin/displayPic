//
//  Report.h
//  iSmartV_1
//
//  Created by LV on 13-8-14.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Report : NSObject

@property (nonatomic, strong) NSString *reportID;

@property (nonatomic, strong) NSDate *checkTimeStr;
@property (nonatomic, strong) NSString *fielVersion;
@property (nonatomic, strong) NSString *patientID;


@end
