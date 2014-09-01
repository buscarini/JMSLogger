//
//  JMSLogMessage.h
//  Pods
//
//  Created by Jose Manuel Sánchez Peñarroja on 29/08/14.
//
//

#import <Realm/Realm.h>

#import "JMSLogMessageProtocol.h"

@class DDLogMessage;

@interface JMSLogMessage : RLMObject <JMSLogMessageProtocol>

@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) NSString *text;

@property (nonatomic, assign) NSInteger logLevel;
@property (nonatomic, assign) NSInteger context;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSDate *date;

- (BOOL) populateWithMessage:(DDLogMessage *) message;

@end
