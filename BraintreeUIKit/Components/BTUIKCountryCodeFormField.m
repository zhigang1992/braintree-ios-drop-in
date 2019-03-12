#import "BTUIKCountryCodeFormField.h"
#import "BTUIKLocalizedString.h"

@implementation BTUIKCountryCodeFormField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textField.accessibilityLabel = BTUIKLocalizedString(COUNTRY_CODE_LABEL);
        self.formLabel.text = BTUIKLocalizedString(COUNTRY_CODE_LABEL);
        self.textField.placeholder = BTUIKLocalizedString(COUNTRY_CODE_PLACEHOLDER);
        
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.textField.returnKeyType = UIReturnKeyNext;
    }
    
    return self;
}

- (NSString *)countryCode {
    return self.textField.text;
}

- (BOOL)valid {
    if (self.isRequired) {
        return [self.countryCode stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet].length > 0;
    }
    else {
        return YES;
    }
}

- (NSArray *)getAllCountryNames {
    // Gets a list of all alpha2 country codes
    NSArray *allCountryCodes = [NSLocale ISOCountryCodes];

    // Generate list of all country names. Language of the names will be based on user's locale.
    NSMutableArray *countries = [NSMutableArray arrayWithCapacity: [[NSLocale ISOCountryCodes] count]];
    for (NSString *countryCode in allCountryCodes) {
        NSString *identifier = [NSLocale localeIdentifierFromComponents: [NSDictionary dictionaryWithObject: countryCode forKey: NSLocaleCountryCode]]; // get country identifier, based on user's current language (NSLocaleCountryCode)
        NSString *countryName = [[NSLocale currentLocale] displayNameForKey: NSLocaleIdentifier value: identifier]; // convert identifier to name
        [countries addObject: countryName];
    }

    return countries;
}

// MARK: - TODO: Instead of a text field, make this a UIPickerView (scroll view with selection options).

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return newText.length <= 2;
}

@end
