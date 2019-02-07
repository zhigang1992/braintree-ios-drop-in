#import "BTUIKLocalityFormField.h"
#import "BTUIKLocalizedString.h"

@implementation BTUIKLocalityFormField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textField.accessibilityLabel = BTUIKLocalizedString(LOCALITY_LABEL);
        self.formLabel.text = BTUIKLocalizedString(LOCALITY_LABEL);
        
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.textField.returnKeyType = UIReturnKeyNext;
    }
    
    return self;
}

- (NSString *)locality {
    return self.textField.text;
}

- (BOOL)valid {
    if (self.isRequired) {
        return [self.locality stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet].length > 0;
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
