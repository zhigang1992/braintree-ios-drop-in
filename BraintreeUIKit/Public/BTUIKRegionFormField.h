#import "BTUIKFormField.h"

@interface BTUIKRegionFormField : BTUIKFormField

/// Region
@property (nonatomic, strong, readonly) NSString *region;

/// Is Region input required
@property (nonatomic, assign) BOOL isRequired;

@end
