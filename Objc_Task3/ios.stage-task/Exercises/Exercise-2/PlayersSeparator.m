#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger count = [ratingArray count];
    NSInteger result = 0;
    NSMutableArray<NSNumber *> *ratingArrayNew = [[NSMutableArray alloc] initWithArray:ratingArray];
    NSInteger tmp[count];
    
    [ratingArrayNew sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    
    for (int i = 0; i < count; i++){
        for (int j = 0; j < count; j++)
        if (ratingArray[i].intValue == ratingArrayNew[j].intValue)
            tmp[i] = j;
    }
    for (int i = 0; i < count; i++) {
        for(int j = i + 1; j < count; j++) {
            for (int k = j + 1; k < count; k++) {
                if (tmp[i] < tmp[j]) {
                    if(tmp[j] < tmp[k])
                        if (tmp[i] < tmp[k])
                            result++;
                }
                else {
                    if (tmp[j] > tmp[k])
                        if (tmp[j] > tmp[k])
                            if (tmp[i] > tmp[k])
                                result++;
                }
            }
        }
    }
    return result;
}
@end
