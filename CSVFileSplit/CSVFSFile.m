//
//  CSVFSFile.m
//  CSVFileSplit
//
//  Created by Morgan Davison on 1/21/17.
//  Copyright © 2017 Morgan Davison. All rights reserved.
//

#import "CSVFSFile.h"

@implementation CSVFSFile

// TODO: error checking on source file

//- (void)writeContentsToFile:(int)fileCount
- (void)writeContents:(NSString *)contents ToFile:(int)fileCount
{
    // Build up the new file path by taking the original file name and appending _ + number
    NSString *origFileName = [[self.sourceFile lastPathComponent] stringByDeletingPathExtension];
    NSString *newFileName = [origFileName stringByAppendingString:@"_"];
    
    NSString *fileNumber = [NSString stringWithFormat:@"%d",fileCount];
    newFileName = [newFileName stringByAppendingString:fileNumber];
    newFileName = [newFileName stringByAppendingString:@".csv"];
    
    NSString *newFilePath = [self.destFile stringByAppendingString:newFileName];
    
    // Create a new file
    [[NSFileManager defaultManager] createFileAtPath:newFilePath contents:nil attributes:nil];
    
    // Write to it
    [contents writeToFile:newFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"New file created at: %@", newFilePath);
}

@end
