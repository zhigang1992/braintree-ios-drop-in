#import "BTUIKFormField.h"

@interface BTUIKAddressLine1FormField : BTUIKFormField

/// Address line 1
@property (nonatomic, strong, readonly) NSString *addressLine1;

/// Is address line 1 input required
@property (nonatomic, assign) BOOL isRequired;

@end
