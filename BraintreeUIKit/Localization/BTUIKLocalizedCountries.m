#import "BTUIKLocalizedCountries.h"

@implementation BTUIKLocalizedCountries

+ (NSArray *)localizedCountriesArray {
    return NSLocalizedStringWithDefaultValue(@"CARD_DETAILS_LABEL", [self localizationTable], [self localizationBundle], @"Card number is required", @"CARD_DETAILS_LABEL");
}

@end
