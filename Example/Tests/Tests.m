//
//  JMSLoggerTests.m
//  JMSLoggerTests
//
//  Created by José Manuel Sánchez on 08/29/2014.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

#import <JMSLogger/JMSLogger.h>
#import <JMSLogger/JMSLogMessage.h>

static const int ddLogLevel = LOG_LEVEL_ERROR;

SpecBegin(InitialSpecs)

describe(@"JMSLogger", ^{
	
	static JMSLogger *logger = nil;
	
	beforeAll(^{
		logger = [JMSLogger new];
		[DDLog addLogger:logger withLogLevel:LOG_LEVEL_ALL];
	});
	
	beforeEach(^{
		[logger clearAllLogMessages];
	});

    it(@"can log and read back simple messages", ^{
		NSString *errorMessage1 = @"Error 1";
		DDLogError(errorMessage1);
		
		NSString *errorMessage2 = @"Error 2";
		DDLogError(errorMessage2);
		
		[DDLog flushLog];

		NSArray *messages = [logger logMessagesWithLevel:LOG_LEVEL_ALL];
		expect(messages.count).to.equal(2);
		
		JMSLogMessage *logMessage = messages.firstObject;
		expect(logMessage).to.beKindOf([JMSLogMessage class]);
		
		expect(logMessage.message).to.equal(errorMessage2);

		logMessage = messages[1];
		expect(logMessage).to.beKindOf([JMSLogMessage class]);
		
		expect(logMessage.message).to.equal(errorMessage1);
    });
});

SpecEnd
