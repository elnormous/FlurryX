//
//  FlurryX_ios.mm
//
//  Created by Elviss Strazdins (based on FlurryAnalticsX by Dmitry Matyukhin)
//

#include <string>
#import "FlurryX.h"
#import "Flurry.h"

static inline NSString* StringToNSString(const std::string& str)
{
    return [NSString stringWithCString: str.c_str() encoding: NSUTF8StringEncoding];
}

static NSDictionary* MapToNSDictionary(const std::map<std::string, std::string>& values)
{
    NSMutableDictionary* result = [NSMutableDictionary dictionary];

	for (auto value : values)
	{
		[result setObject: StringToNSString(value.first)
				   forKey: StringToNSString(value.second)];
	}

    return result;
}

void FlurryX::setAppVersion(const std::string& version)
{
    [Flurry setAppVersion:StringToNSString(version)];
}

std::string FlurryX::getFlurryAgentVersion()
{
    return [[Flurry getFlurryAgentVersion] cStringUsingEncoding:NSUTF8StringEncoding];
}

void FlurryX::setShowErrorInLogEnabled(bool value)
{
    [Flurry setShowErrorInLogEnabled:value];
}

void FlurryX::setDebugLogEnabled(bool value)
{
    [Flurry setDebugLogEnabled:value];
}

void FlurryX::setSessionContinueMillis(long millis)
{
	int seconds = (int)millis / 1000;
    [Flurry setSessionContinueSeconds:seconds];
}

void FlurryX::setSecureTransportEnabled(bool value)
{
	
}

/*
 start session, attempt to send saved sessions to server 
 */
void FlurryX::startSession(const std::string& apiKey)
{
    [Flurry startSession:StringToNSString(apiKey) ];
}

/*
 log events or errors after session has started
 */
void FlurryX::logEvent(const std::string& eventName)
{
    [Flurry logEvent:StringToNSString(eventName)];
}

void FlurryX::logEvent(const std::string& eventName, const std::string& paramName, const std::string& paramValue)
{
	std::map<std::string, std::string> params;
	params[paramName] = paramValue;
    
    FlurryX::logEvent(eventName, params);
}

void FlurryX::logEvent(const std::string& eventName, const std::map<std::string, std::string>& parameters)
{
    [Flurry logEvent:StringToNSString(eventName) withParameters:MapToNSDictionary(parameters)];
}

void FlurryX::logError(const std::string& errorID, const std::string& message)
{
    [Flurry logError:StringToNSString(errorID) message:StringToNSString(message) exception:nil];
}

/* 
 start or end timed events
 */
void FlurryX::logEvent(const std::string& eventName, bool timed)
{
    [Flurry logEvent:StringToNSString(eventName) timed:timed];
}

void FlurryX::logEvent(const std::string& eventName, const std::map<std::string, std::string>& parameters, bool timed)
{
	[Flurry logEvent:StringToNSString(eventName) withParameters:MapToNSDictionary(parameters) timed:timed];
}

void FlurryX::endTimedEvent(const std::string& eventName)
{
	[Flurry endTimedEvent:StringToNSString(eventName) withParameters:nil];
}

void FlurryX::endTimedEvent(const std::string& eventName, const std::map<std::string, std::string>& parameters)
{
    [Flurry endTimedEvent:StringToNSString(eventName) withParameters:MapToNSDictionary(parameters)];
}

/*
 set user info
 */
void FlurryX::setUserID(const std::string& userID)
{
    [Flurry setUserID:StringToNSString(userID)];
}

void FlurryX::setAge(int age)
{
    [Flurry setAge:age];
}

void FlurryX::setGender(Gender gender)
{
	NSString* genderString;
	
	switch (gender)
	{
		case FEMALE:
			genderString = @"f";
			break;
		case MALE:
			genderString = @"m";
			break;
		default:
			genderString = @"";
			break;
	}
	
    [Flurry setGender:genderString];
}

/*
 set location information
 */
void FlurryX::setLatitude(double latitude, double longitude, float horizontalAccuracy, float verticalAccuracy)
{
    [Flurry setLatitude:latitude longitude:longitude horizontalAccuracy:horizontalAccuracy verticalAccuracy:verticalAccuracy];
}

void FlurryX::setReportLocation(bool reportLocation)
{
	
}

/*
 optional session settings that can be changed after start session
 */
void FlurryX::setSessionReportsOnCloseEnabled(bool sendSessionReportsOnClose)
{
    [Flurry setSessionReportsOnCloseEnabled:sendSessionReportsOnClose];
}

void FlurryX::setSessionReportsOnPauseEnabled(bool setSessionReportsOnPauseEnabled)
{
    [Flurry setSessionReportsOnPauseEnabled:setSessionReportsOnPauseEnabled];
}

void FlurryX::setEventLoggingEnabled(bool value)
{
    [Flurry setEventLoggingEnabled:value];
}

void FlurryX::reset()
{
	
}
