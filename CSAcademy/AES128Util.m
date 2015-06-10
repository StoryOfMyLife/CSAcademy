//
//  AES128Util.m
//  ASE128Demo
//
//  Created by zhenghaishu on 11/11/13.
//  Copyright (c) 2013 Youku.com inc. All rights reserved.
//

#import "AES128Util.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation AES128Util

#define gIv @"0000000000000000"

//static char keyPtr[] = {-119, 13, 126, 78, 108, -103, 22, 78, -65, 13, -89, -127, 73, -32, -16, -86};

+(NSString *)AES128Encrypt:(NSString *)plainText key:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    Byte *ivBytes[16] = {0};

    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCKeySizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySizeAES256,
                                          ivBytes,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        Byte *bytes = (Byte *)[resultData bytes];
        
        //下面是Byte 转换为16进制。
        NSString *hexStr=@"";
        for(int i=0;i<[resultData length];i++)
        {
            NSString *newHexStr = [NSString stringWithFormat:@"%X",bytes[i] & 0xFF];///16进制数
            
            if([newHexStr length]==1)
                
                hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
            
            else
                
                hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        }
        
        return hexStr;
    }
    free(buffer);
    return nil;
}


+(NSString *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    Byte *ivBytes[16] = {0};

    NSString *hexString=[[encryptText uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([hexString length] % 2 != 0) {
        return nil;
    }
    Byte tempbyt[1] = {0};
    NSMutableData* bytes=[NSMutableData data];
    for(int i = 0; i < [hexString length]; i++)
    {
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            return nil;
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char2 >= 'A' && hex_char2 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        else
            return nil;
        
        tempbyt[0] = int_ch1+int_ch2;  ///将转化后的数放入Byte数组里
        [bytes appendBytes:tempbyt length:1];
    }
    
    NSData *data = bytes;
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySizeAES256,
                                          ivBytes,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        NSString *result = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        
        return result;
    }
    free(buffer);
    return nil;
}

@end
