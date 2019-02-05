#import "BTUIKFormField.h"

@interface BTUIKAddressLine2FormField : BTUIKFormField

/// Address line 2
@property (nonatomic, strong, readonly) NSString *addressLine2;

/// Is address line 2 input required
@property (nonatomic, assign) BOOL isRequired;

@end
