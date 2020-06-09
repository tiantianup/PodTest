/**************1.注释说明**************************************************/
//  模块:  缓存管理
//  类名:  ZMNCacheManager
//  应用名: 青葱时代
//  主要属性和方法:
//  功能: 缓存文件创建,存储

//
//  Created by 啄木鸟 on 16/11/1.
//  Copyright © 2016年 啄木鸟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMNCacheManager : NSObject

//存用户信息
+(void)saveUserInformation:(NSDictionary*)dic inPath:(NSArray*)filePaths;
//取用户信息
+(NSDictionary *)getUserInformationFromPath:(NSArray*)filePaths;
//清空用户信息
+(void)cleanUserInformationInPath:(NSArray*)filePaths;


//存数据
+(void)saveData:(NSData*)data inPath:(NSArray*)filePaths;

// 取数据
+(NSData *)getDatasFromPath:(NSArray*)filePaths;

//存数据
+(void)saveContent:(NSDictionary*)dic inPath:(NSArray*)filePaths;

// 取数据
+(NSDictionary *)getDataFromPath:(NSArray*)filePaths;
//王亚楠
//百科编辑存放
+ (void)saveEditContent:(NSString *)editContent inPath:(NSArray*)filePaths;
// 百科编辑取出数据
+(NSString *)getEditDataFromPath:(NSArray*)filePaths;

//清除缓存
+(void)cleanCacheInPath:(NSArray*)filePaths;

//清空cache下所有文件
+(void)cleanAllCache;

//存小说
+ (void)saveString:(NSString*)string inPath:(NSArray*)filePaths;
//获取小说内容
+ (NSString *)getStringInPath:(NSArray*)filePaths;
//清除小说
+(void)cleanNovelCacheInPath:(NSArray*)filePaths;
//获取文件路径
+ (NSString*)getNovlePath:(NSArray*)filePaths;
@end
