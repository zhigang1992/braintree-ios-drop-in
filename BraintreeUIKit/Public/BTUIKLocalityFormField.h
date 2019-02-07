#import "BTUIKFormField.h"

@interface BTUIKLocalityFormField : BTUIKFormField

/// Locality
@property (nonatomic, strong, readonly) NSString *locality;

/// Is Locality input required
@property (nonatomic, assign) BOOL isRequired;

@end
