#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [[NSMutableString alloc] init];
    NSMutableString *str1 = [NSMutableString stringWithString:string1];
    NSMutableString *str2 = [NSMutableString stringWithString:string2];
    NSRange range = NSMakeRange(0, 1);

        
        while ((str1.length != 0) && (str2.length != 0)) {
            
            char char1 = [str1 characterAtIndex:0];
            char char2 = [str2 characterAtIndex:0];
                    
            if (char1 <= char2) {
                [result appendFormat:@"%c", char1];
                [str1 deleteCharactersInRange:range];
            } else {
                [result appendFormat:@"%c", char2];
                [str2 deleteCharactersInRange:range];
            }
        }
        
        if (str1.length == 0) {
            [result appendString:str2];
        } else {
            [result appendString:str1];
        }
        
        return result;
}

@end
