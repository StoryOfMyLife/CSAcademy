//
//  YDDownloadRequesOperation.h
//  YDNetwork
//
//  Created by liuty on 14-8-11.
//  Copyright (c) 2014年 _liuty_. All rights reserved.
//

#import "AFDownloadRequestOperation.h"

@interface YDDownloadRequestOperation : AFDownloadRequestOperation

typedef void (^ProgressBlock)(long long totalBytesRead, long long totalBytesExpectedToRead);
typedef void (^SuccessBlock)(YDDownloadRequestOperation *operation, id response);
typedef void (^FailureBlock)(YDDownloadRequestOperation *operation, NSError *error);

//------------------------------------------------------------------------------
/**
 *  下载进度block
 */
@property (nonatomic, strong) ProgressBlock progressBlock;

//------------------------------------------------------------------------------
/**
 *  下载成功的block
 */
@property (nonatomic, strong) SuccessBlock  successBlock;

//------------------------------------------------------------------------------
/**
 *  下载失败的block
 */
@property (nonatomic, strong) FailureBlock  failureBlock;

//------------------------------------------------------------------------------
/**
 *  初始化方法
 *
 *  @param urlRequest   目标请求地址
 *  @param targetPath   目标存储路径
 *  @param shouldResume 是否可以断点下载
 *
 *  @return operation
 */
- (instancetype)initWithRequest:(NSURLRequest *)urlRequest targetPath:(NSString *)targetPath shouldResume:(BOOL)shouldResume;

@end
