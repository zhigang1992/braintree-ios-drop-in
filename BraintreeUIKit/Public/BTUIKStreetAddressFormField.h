#import "BTUIKFormField.h"

@interface BTUIKStreetAddressFormField : BTUIKFormField

/// Street Address 
@property (nonatomic, strong, readonly) NSString *streetAddress;

/// Is Street Address input required
@property (nonatomic, assign) BOOL isRequired;

@end
