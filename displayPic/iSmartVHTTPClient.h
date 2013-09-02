//
//  iSmartVHTTPClient.h
//  iSmartV
//
//  Created by Yunjia Jiao on 13-8-21.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFNetworking.h"

@protocol iSmartVHttpClientDelegate;
@interface iSmartVHTTPClient : AFHTTPClient

@property(weak) id delegate;

+ (iSmartVHTTPClient *)sharediSmartVHTTPClient;
- (id)initWithBaseURL:(NSURL *)url;
- (void)update;

@end

@protocol iSmartVHttpClientDelegate
-(void)iSmartVHTTPClient:(iSmartVHTTPClient *)client didUpdateWithPatient:(id)newPatient;
-(void)iSmartVHTTPClient:(iSmartVHTTPClient *)client didUpdateWithReport:(id)newReport;
-(void)iSmartVHTTPClient:(iSmartVHTTPClient *)client didFailWithError:(NSError *)error;
@end

