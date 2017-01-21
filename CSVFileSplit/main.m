//
//  main.m
//  CSVFileSplit
//
//  Created by Morgan Davison on 1/21/17.
//  Copyright © 2017 Morgan Davison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSVFSFile.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create an instance of CSVFSFile
        CSVFSFile *csvfsFile = [[CSVFSFile alloc] init];
        
        // File to read from
        char filepathInput[1000];
        printf("Enter the absolute file path: ");
        // /Users/morgan/Code/osx/CSVFileSplit/test.csv
        scanf("%s", filepathInput);
        csvfsFile.sourceFile = [NSString stringWithUTF8String:filepathInput];
        
        // Directory to put new files
        char newDirectoryInput[1000];
        printf("Enter the directory for the new files (no trailing slash): ");
        scanf("%s", newDirectoryInput);
        csvfsFile.destFile = [NSString stringWithUTF8String:newDirectoryInput];
        
        // Max lines per file
        int maxLinesPerFile = 2;
        

        // Create string to hold data
        NSString *contents = @"";
        
        // Keep track of number of lines and files
        int lineCount = 0;
        int fileCount = 0;
        
        
        // Read the file from path provided by user
        NSString *fh = [NSString stringWithContentsOfFile: csvfsFile.sourceFile encoding:NSUTF8StringEncoding error:NULL];
        for (NSString *line in [fh componentsSeparatedByString:@"\n"]) {
            lineCount++;
            contents = [contents stringByAppendingString:line];
            
            if (lineCount >= maxLinesPerFile) {
                fileCount++;
                
                // Write to file
                [csvfsFile writeContents:contents ToFile:fileCount];

                // Clear out contents
                contents = @"";
                
                // Restart the count
                lineCount = 0;
            }
        }
        
        // Write any remaining contents to file
        fileCount++;
        [csvfsFile writeContents:contents ToFile:fileCount];
    }
    return 0;
}
