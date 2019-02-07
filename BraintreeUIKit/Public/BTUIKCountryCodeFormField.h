#import "BTUIKFormField.h"

@interface BTUIKCountryCodeFormField : BTUIKFormField

/// Country Code
@property (nonatomic, strong, readonly) NSString *countryCode;

/// Is Country Code input required
@property (nonatomic, assign) BOOL isRequired;

@end
