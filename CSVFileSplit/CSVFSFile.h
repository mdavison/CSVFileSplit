//
//  CSVFSFile.h
//  CSVFileSplit
//
//  Created by Morgan Davison on 1/21/17.
//  Copyright © 2017 Morgan Davison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSVFSFile : NSObject

@property (nonatomic) NSString *sourceFile;
@property (nonatomic) NSString *destFile;

- (void)writeContents:(NSString *)contents ToFile:(int)fileCount;

@end
