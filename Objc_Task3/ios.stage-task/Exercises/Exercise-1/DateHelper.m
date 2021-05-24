#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if ((monthNumber > 13) || (monthNumber <= 0))
        return nil;
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSArray *monthNames = [dateFormatter standaloneMonthSymbols];
        NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
        return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    NSCalendar  *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger day = [gregorian component:NSCalendarUnitDay fromDate:dateFromString];
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *ruRULocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setLocale:ruRULocale];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSCalendar  *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger day = [gregorian component:NSCalendarUnitDay fromDate:date];
    if ((day < 0)||(day > 31))
        return nil;
    [dateFormatter setDateFormat:@"EEE"];
    NSString *result = [dateFormatter stringFromDate:date];
    return result;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3]];
//    [dateFormatter set]
    cal.firstWeekday = 2;
    NSDate *now = [NSDate date];
    NSDate *startOfTheWeek;
    NSDate *endOfWeek;
    NSTimeInterval interval;
    [cal rangeOfUnit:NSCalendarUnitWeekOfYear
           startDate:&startOfTheWeek
            interval:&interval
             forDate:now];
    endOfWeek = [startOfTheWeek dateByAddingTimeInterval:interval - 1];
    [cal rangeOfUnit:NSCalendarUnitDay
           startDate:&endOfWeek
            interval:NULL
             forDate:endOfWeek];
    return ([date compare:startOfTheWeek] == NSOrderedDescending) && ([date compare:endOfWeek] == NSOrderedAscending);
}

@end
