#import "BTUIKFormField.h"

@interface BTUIKExtendedAddressFormField : BTUIKFormField

/// Extended Address
@property (nonatomic, strong, readonly) NSString *extendedAddress;

/// Is Extended Address input required
@property (nonatomic, assign) BOOL isRequired;

@end
