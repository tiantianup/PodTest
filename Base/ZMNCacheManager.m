//
//  ZMNCacheManager.m
//  青葱时代
//
//  Created by 啄木鸟 on 16/11/1.
//  Copyright © 2016年 啄木鸟. All rights reserved.
//

#import "ZMNCacheManager.h"
@interface ZMNCacheManager ()
//基础路径
@property (nonatomic, copy) NSString *basePath;
//
@property (nonatomic, copy) NSString *novleBasePath;
//用户信息
@property (nonatomic, copy) NSString *userData;
//用户账号
@property (nonatomic, copy) NSString *account;
@end
@implementation ZMNCacheManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark --- 存入用户数据

+(void)saveUserInformation:(NSDictionary*)dic inPath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.userData stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                if (dic) {
                    NSData *data =  [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
                    if([data writeToFile:fileFinalPath atomically:YES]) {
                        MYLog(@"用户数据---创建第一个文件成功");
                    }
                }
                
                //                    NSData *arrData = [NSData dataWith]
                
            }
        }
    }

}

#pragma mark --- 取用户信息

+(NSDictionary *)getUserInformationFromPath:(NSArray*)filePaths{
    
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.userData stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSData *data = [NSData dataWithContentsOfFile:fileFinalPath];
    //    NSData *avatarData = [[NSData alloc]initWithBase64EncodedString:avatarStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    if (data) {
        NSDictionary* dic = [NSJSONSerialization
                             JSONObjectWithData:data
                             options:kNilOptions
                             error:nil];
        return  dic;
    }else return nil;
}


#pragma mark --- 清空用户信息

+(void)cleanUserInformationInPath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    if (filePaths.count > 0) {
        for (int i = 0; i < filePaths.count; i++) {
            if (i < filePaths.count - 1) {
                if (!fileFinalPath) {
                    fileFinalPath = filePaths[i];
                    fileFinalPath = [manager.userData stringByAppendingPathComponent:fileFinalPath];
                }else{
                    fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                }
            }else{
                NSError *error = nil;
                [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
                if (!error) {
                    fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                }
            }
        }
    }else{
        fileFinalPath = manager.userData;
    }
       NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:fileFinalPath error:&error];
    if (!error) {
        MYLog(@"图片文件删除成功");
    }
}

#pragma mark --- 存入data型数据
+(void)saveData:(NSData*)data inPath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            //创建文件夹
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                if (data) {
                    if([data writeToFile:fileFinalPath atomically:YES]) {
                    }
                }
            }
        }
    }

}

// 取数据
+(NSData *)getDatasFromPath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSData *data = [NSData dataWithContentsOfFile:fileFinalPath];
    //    NSData *avatarData = [[NSData alloc]initWithBase64EncodedString:avatarStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    if (data) {
        return  data;
    }else return nil;

}

#pragma mark --- 存入数据

+(void)saveContent:(NSDictionary*)dic inPath:(NSArray*)filePaths{
    
        ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
        //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
        NSString *fileFinalPath;
        for (int i = 0; i < filePaths.count; i++) {
            if (i < filePaths.count - 1) {
                if (!fileFinalPath) {
                    fileFinalPath = filePaths[i];
                    fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
                }else{
                    fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                }
            }else{
                NSError *error = nil;
                //创建文件夹
                [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
                if (!error) {
                    fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                    if (dic) {
                        NSData *data =  [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
                        if([data writeToFile:fileFinalPath atomically:YES]) {
                        }
                    }
                }
            }
        }
}

#pragma mark --- 取数据

+(NSDictionary *)getDataFromPath:(NSArray*)filePaths{
    
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSData *data = [NSData dataWithContentsOfFile:fileFinalPath];
//    NSData *avatarData = [[NSData alloc]initWithBase64EncodedString:avatarStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    if (data) {
        NSDictionary* dic = [NSJSONSerialization
                             JSONObjectWithData:data
                             options:kNilOptions
                             error:nil];
          return  dic;
    }else return nil;
}

#pragma mark --- 存入数据

+(void)saveEditContent:(NSString*)editContent inPath:(NSArray*)filePaths{
    
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            //创建文件夹
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                if (editContent) {
                    unsigned long encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                    BOOL flag = [editContent writeToFile:fileFinalPath atomically:YES encoding:encode error:&error];
                }
            }
        }
    }
}

#pragma mark --- 取数据

+ (NSString *)getEditDataFromPath:(NSArray*)filePaths{
    
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSError *error = nil;
    unsigned long encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *str = [NSString stringWithContentsOfFile:fileFinalPath encoding:encode error:&error];
    if (str) {
        return  str;
    }else return nil;
    
}



#pragma mark --- 清空cache下所有文件

+(void)cleanAllCache {
    
    NSError *error = nil;
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *novleCachePath = [NSString stringWithFormat:@"qcsd_novle_Cache"];
    novleCachePath = [documentsPath stringByAppendingPathComponent:novleCachePath];
    [[NSFileManager defaultManager] removeItemAtPath:novleCachePath error:&error];
    if (!error) {
        MYLog(@"小说删除成功");
    }
    
//    NSString *cachePath = [NSString stringWithFormat:@"qcsdCache"];
//    NSString *path = [documentsPath stringByAppendingPathComponent:cachePath];
//
//    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //获取版本号
    NSString *cachePath = [NSString stringWithFormat:@"qcsdCache"];
    NSString *path = [documentsPath stringByAppendingPathComponent:cachePath];
    path = [path stringByAppendingPathComponent:ApplicationCacheVersion];
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    for (NSString *str in files) {
        MYLog(@"%@",str);
        if (![str containsString:@"user"]) {
            [[NSFileManager defaultManager] removeItemAtPath:str error:&error];
            if (!error) {
                MYLog(@"文件删除成功");
            }
        }
    }

}

#pragma mark --- 清空文件夹

+(void)cleanCacheInPath:(NSArray*)filePaths{
    
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.basePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:fileFinalPath error:&error];
    if (!error) {
        MYLog(@"文件删除成功");
    }
}

//存小说内容
+ (void)saveString:(NSString*)string inPath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.novleBasePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            //创建文件夹
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
                if (string) {
                    unsigned long encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
                    BOOL flag = [string writeToFile:fileFinalPath atomically:YES encoding:encode error:&error];
                    if(flag) {
                        MYLog(@"小说存储成功");
                    }
                }
            }
        }
    }
    
}

//获取小锁文件路径
+ (NSString*)getNovlePath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.novleBasePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            //创建文件夹
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }else{
                MYLog(@"文件夹创建失败");
            }
        }
    }
    return fileFinalPath;
}
//获取小说内容
+ (NSString *)getStringInPath:(NSArray*)filePaths{
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.novleBasePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSError *error = nil;
    unsigned long encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *str = [NSString stringWithContentsOfFile:fileFinalPath encoding:encode error:&error];
    if (str) {
        return  str;
    }else return nil;
    
}


#pragma mark --- 清空文件夹

+(void)cleanNovelCacheInPath:(NSArray*)filePaths{
    
    ZMNCacheManager *manager = [[ZMNCacheManager alloc]init];
    //2.拼接两个路径xx/Documents/test/test01.txt; test02.txt
    NSString *fileFinalPath;
    for (int i = 0; i < filePaths.count; i++) {
        if (i < filePaths.count - 1) {
            if (!fileFinalPath) {
                fileFinalPath = filePaths[i];
                fileFinalPath = [manager.novleBasePath stringByAppendingPathComponent:fileFinalPath];
            }else{
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }else{
            NSError *error = nil;
            [[NSFileManager defaultManager] createDirectoryAtPath:fileFinalPath withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                fileFinalPath = [fileFinalPath stringByAppendingPathComponent:filePaths[i]];
            }
        }
    }
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:fileFinalPath error:&error];
    if (!error) {
        MYLog(@"文件删除成功");
    }
}


//document基础路径

-(NSString *)basePath{
    if (_basePath == nil) {
        //初始化/Documents/test/路径
        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //获取版本号
//        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *cachePath = [NSString stringWithFormat:@"qcsdCache"];
        NSString *path = [documentsPath stringByAppendingPathComponent:cachePath];
//        _basePath = [path stringByAppendingPathComponent:app_Version];
        _basePath = path;


    }return _basePath;
}

//document基础路径

-(NSString *)novleBasePath{
    if (_novleBasePath == nil) {
        //初始化/Documents/test/路径
        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *cachePath = [NSString stringWithFormat:@"qcsd_novle_Cache"];
        _novleBasePath = [documentsPath stringByAppendingPathComponent:cachePath];
        
    }return _novleBasePath;
}


-(NSString *)userData{
    if (_userData == nil) {
        //初始化/Documents/test/路径
        //          _account = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_qc_code"];
        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //获取版本号
        NSString *cachePath = [NSString stringWithFormat:@"qcsdCache"];
        NSString *path = [documentsPath stringByAppendingPathComponent:cachePath];
        _userData = [path stringByAppendingPathComponent:ApplicationCacheVersion];
        
    }return _userData;
}

@end
