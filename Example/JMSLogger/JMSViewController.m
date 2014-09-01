//
//  JMSViewController.m
//  JMSLogger
//
//  Created by José Manuel Sánchez on 08/29/2014.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

#import "JMSViewController.h"

#import <CocoaLumberjack/CocoaLumberjack.h>
#import <JMSLogger/JMSLogger.h>
#import <JMSLogger/JMSLogMessage.h>

static const int ddLogLevel = LOG_LEVEL_ERROR;

@interface JMSViewController ()

@end

@implementation JMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	DDLogError(@"another error");
	
	JMSLogger *logger = [[JMSLogger alloc] init];
	
	NSMutableString *log = [NSMutableString string];
	for (JMSLogMessage *message in [logger logMessagesWithLevel:LOG_LEVEL_ALL]) {
		[log appendString:@"\n"];
		[log appendString:message.text];
	}
	
	self.textView.text = log;
	
}


@end
