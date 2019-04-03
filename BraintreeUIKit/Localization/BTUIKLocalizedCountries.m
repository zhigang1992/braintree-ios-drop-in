#import "BTUIKLocalizedCountries.h"

@implementation BTUIKLocalizedCountries

+ (NSBundle *)localizationBundle {
    static NSString * bundleName = @"Braintree-UIKit-Localization";
    if ([[NSLocale preferredLanguages] count] > 0) {
        NSString *language = [[NSLocale preferredLanguages] firstObject];
        // Ignore region portion of local ID
        language = [[[[language componentsSeparatedByString:@"_"] firstObject] componentsSeparatedByString:@"-"] firstObject];
    }

    NSString *localizationBundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    if (!localizationBundlePath) {
        localizationBundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:bundleName ofType:@"bundle"];
    }

    return localizationBundlePath ? [NSBundle bundleWithPath:localizationBundlePath] : [NSBundle mainBundle];
}

+ (NSArray<BTUIKCountry *> *)localizedCountriesDictionary {
    NSMutableArray *mutableCountriesArray = [NSMutableArray arrayWithCapacity:[BTUIKCountry allSupportedCountryCodes].count];
    for (NSString *countryCode in [BTUIKCountry allSupportedCountryCodes]) {
        BTUIKCountry *country = [BTUIKCountry new];
        country.code = countryCode;
        country.name = NSLocalizedStringWithDefaultValue(countryCode, @"BTUICountries", [self localizationBundle], @"Default Value", nil);
        [mutableCountriesArray addObject:country];
    }

    [mutableCountriesArray sortUsingComparator:^NSComparisonResult(BTUIKCountry * _Nonnull country1, BTUIKCountry * _Nonnull country2) {
        return [country1.name localizedCaseInsensitiveCompare:country2.name];
    }];

    return [mutableCountriesArray copy];
}

@end
