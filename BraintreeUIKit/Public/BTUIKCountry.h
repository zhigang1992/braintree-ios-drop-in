#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTUIKCountry : NSObject

+ (NSArray<NSString *> *)allSupportedCountryCodes;

@property (copy, nonatomic) NSString *code;
@property (copy, nonatomic) NSString *name;

@end

NS_ASSUME_NONNULL_END
