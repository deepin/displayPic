//
//  iSmartVHTTPClient.m
//  iSmartV
//
//  Created by Yunjia Jiao on 13-8-21.
//  Copyright (c) 2013年 LargeV. All rights reserved.
//

#import "iSmartVHTTPClient.h"

@implementation iSmartVHTTPClient

+ (iSmartVHTTPClient *)sharediSmartVHTTPClient
{
    NSString *urlStr = @"http://172.19.18.184:8000/ReportIosServer/";
    
    static dispatch_once_t pred;
    static iSmartVHTTPClient *_sharediSmartVHTTPClient = nil;
    
    dispatch_once(&pred, ^{ _sharediSmartVHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:urlStr]]; });
    return _sharediSmartVHTTPClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)update
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    [parameters setObject:[NSString stringWithFormat:@"Wys",] forKey:@"name"];
    [self getPath:@"2013/07/22/ChenDeGao_10002_105842"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"Success update");
              if([self.delegate respondsToSelector:@selector(iSmartVHTTPClient:didUpdateWithReport:)])
                  [self.delegate iSmartVHTTPClient:self didUpdateWithReport:responseObject];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error update");
              if([self.delegate respondsToSelector:@selector(iSmartVHTTPClient:didFailWithError:)])
                  [self.delegate iSmartVHTTPClient:self didFailWithError:error];
          }];
}


@end
