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

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return newText.length <= 255;
}

@end
