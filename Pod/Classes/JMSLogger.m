//
//  JMSLogger.m
//  Pods
//
//  Created by Jose Manuel Sánchez Peñarroja on 29/08/14.
//
//

#import "JMSLogger.h"

#import <Realm/Realm.h>

#import "JMSLogMessage.h"

@implementation JMSLogger

- (void) logMessage:(DDLogMessage *)logMessage {
	
	RLMRealm *realm = [RLMRealm defaultRealm];
	
	JMSLogMessage *message = [[JMSLogMessage alloc] init];
	
	if ([message populateWithMessage:logMessage]) {
		[realm beginWriteTransaction];
		[realm addObject:message];
		[realm commitWriteTransaction];
	}
}

+ (NSArray *) arrayWithRLMArray:(RLMArray *) rlmArray {
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:rlmArray.count];
	
	for (JMSLogMessage *message in rlmArray) {
		[array addObject:message];
	}
	
	return array;
}

+ (NSArray *) arrayWithRLMResults: (RLMResults *) rlmResults {
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:rlmResults.count];
	
	for (JMSLogMessage *message in rlmResults) {
		[array addObject:message];
	}
	
	return array;
}

- (void) clearAllLogMessages {
	RLMRealm *realm = [RLMRealm defaultRealm];
	[realm beginWriteTransaction];
	RLMResults *messages = [JMSLogMessage objectsWithPredicate:nil];
	[realm deleteObjects:messages];
	[realm commitWriteTransaction];
}

- (NSArray *) logMessagesWithLevel:(NSInteger) logLevel {
	RLMResults *objects = [JMSLogMessage objectsWhere:@"logLevel >= %d",logLevel];
	objects = [objects sortedResultsUsingProperty:@"date" ascending:NO];
	return [JMSLogger arrayWithRLMResults:objects];
}

- (NSArray *) logMessagesWithLevel:(NSInteger) logLevel context:(NSInteger)context {
	RLMResults *objects = [JMSLogMessage objectsWhere:@"logLevel >= %d AND context=%d",logLevel,context];
	objects = [objects sortedResultsUsingProperty:@"date" ascending:NO];
	return [JMSLogger arrayWithRLMResults:objects];
}

/// Get the last *limit* log messages with logLevel or less and matching context
- (NSArray *) logMessagesWithLevel:(NSInteger) logLevel limit:(NSInteger)limit context:(NSInteger)context {
	RLMResults *objects = [JMSLogMessage objectsWhere:@"logLevel >= %d AND context=%d",logLevel,context];
	objects = [objects sortedResultsUsingProperty:@"date" ascending:NO];
	NSArray *results = [JMSLogger arrayWithRLMResults:objects];
	if (results.count>limit) {
		return [results subarrayWithRange:NSMakeRange(0, limit)];
	}
	
	return results;
}

@end
