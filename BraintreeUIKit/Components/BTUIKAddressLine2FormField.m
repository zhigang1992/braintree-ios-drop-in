#import "BTUIKAddressLine2FormField.h"
#import "BTUIKLocalizedString.h"

@implementation BTUIKAddressLine2FormField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textField.accessibilityLabel = BTUIKLocalizedString(ADDRESS_LINE2_LABEL);
        self.formLabel.text = BTUIKLocalizedString(ADDRESS_LINE2_LABEL);
        
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.textField.returnKeyType = UIReturnKeyNext;
    }
    
    return self;
}

- (NSString *)addressLine2 {
    return self.textField.text;
}

- (BOOL)valid {
    if (self.isRequired) {
        return [self.addressLine2 stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet].length > 0;
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
