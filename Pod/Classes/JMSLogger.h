//
//  JMSLogger.h
//  Pods
//
//  Created by Jose Manuel Sánchez Peñarroja on 29/08/14.
//
//

#import <CocoaLumberjack/CocoaLumberjack.h>

#import "JMSLogMessageProtocol.h"

@class DDLogMessage;

@interface JMSLogger : DDAbstractLogger

- (void) clearAllLogMessages;

- (NSArray *) logMessagesWithLevel:(NSInteger) logLevel;
- (NSArray *) logMessagesWithLevel:(NSInteger) logLevel context:(NSInteger)context;
/// Get the last *limit* log messages with logLevel or less and matching context
- (NSArray *) logMessagesWithLevel:(NSInteger) logLevel limit:(NSInteger)limit context:(NSInteger)context;

@end
