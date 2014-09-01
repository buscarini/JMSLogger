//
//  JMSLogMessage.h
//  Pods
//
//  Created by Jose Manuel Sánchez Peñarroja on 29/08/14.
//
//

#import <Foundation/Foundation.h>

@protocol JMSLogMessageProtocol <NSObject>

@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) NSString *text;
@property (nonatomic, assign) NSInteger logLevel;
@property (nonatomic, assign) NSInteger context;

@end
