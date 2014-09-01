//
//  JMSLogMessage.m
//  Pods
//
//  Created by Jose Manuel Sánchez Peñarroja on 29/08/14.
//
//

#import "JMSLogMessage.h"

#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation JMSLogMessage

- (BOOL) populateWithMessage:(DDLogMessage *) message {
	self.logLevel = message->logLevel;
	self.context = message->logContext;
	self.message = message->logMsg;
	self.date = message->timestamp;
	
	return YES;
}

- (NSString *) summary {
	return self.message;
}

- (NSString *) text {
	return self.message;
}

@end
