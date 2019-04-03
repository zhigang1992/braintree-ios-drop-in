#import "BTUIKCountryCodeFormField.h"
#import "BTUIKLocalizedString.h"
#import "BTUIKLocalizedCountries.h"

@interface BTUIKCountryCodeFormField () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIPickerView *countryPickerView;
@property (strong, nonatomic) NSArray<BTUIKCountry *> *countries;
@property (strong, nonatomic) NSString *selectedCountryCode;

@end

@implementation BTUIKCountryCodeFormField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textField.accessibilityLabel = BTUIKLocalizedString(COUNTRY_CODE_LABEL);
        self.formLabel.text = BTUIKLocalizedString(COUNTRY_CODE_LABEL);
        self.textField.placeholder = BTUIKLocalizedString(COUNTRY_CODE_PLACEHOLDER);

        // TODO: Investigate at making the picker a seperate class
        self.countryPickerView = [UIPickerView new];
        self.countryPickerView.dataSource = self;
        self.countryPickerView.delegate = self;
        self.textField.inputView = self.countryPickerView;

        self.countries = [BTUIKLocalizedCountries localizedCountriesDictionary];
    }
    
    return self;
}

- (NSString *)countryCode {
    return self.selectedCountryCode;
}

- (BOOL)valid {
    return YES;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(__unused UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(__unused UIPickerView *)pickerView numberOfRowsInComponent:(__unused NSInteger)component {
    return self.countries.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(__unused UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(__unused NSInteger)component {
    return self.countries[row].name;
}

- (void)pickerView:(__unused UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(__unused NSInteger)component {
    self.textField.text = self.countries[row].name;
    self.selectedCountryCode = self.countries[row].name;
}

@end
