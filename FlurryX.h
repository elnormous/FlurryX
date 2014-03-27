//
//  FlurryX.h
//
//  Created by Elviss Strazdins (based on FlurryAnalticsX by Dmitry Matyukhin)
//

#ifndef FLURRY_X_H
#define FLURRY_X_H

#include <cocos2d.h>

class FlurryX
{
public:
	
	enum Gender
	{
		UNKNOWN = -1,
		FEMALE = 0,
		MALE = 1,
	};
	
    /*
     optional sdk settings that should be called before start session
     */
    static void setAppVersion(const char* version);		// override the app version
    static const char* getFlurryAgentVersion();			// get the Flurry Agent version number
    static void setShowErrorInLogEnabled(bool value);	// default is NO
    static void setDebugLogEnabled(bool value);			// generate debug logs for Flurry support, default is NO
    static void setSessionContinueMillis(long millis); // default is 10 seconds
    static void setSecureTransportEnabled(bool value); // set data to be sent over SSL, default is NO
    
    /*
     start session, attempt to send saved sessions to server 
     */
    static void startSession(const char* apiKey);
    
    /*
     log events or errors after session has started
     */
    static void logEvent(const char* eventName);
    static void logEvent(const char* eventName, const char* paramName, const char* paramValue);
    static void logEvent(const char* eventName, cocos2d::__Dictionary* parameters);
    static void logError(const char* errorID, const char* message);
    
    /* 
     start or end timed events
     */
    static void logEvent(const char* eventName, bool timed);
    static void logEvent(const char* eventName, cocos2d::__Dictionary* parameters, bool timed);
	static void endTimedEvent(const char* eventName);
    static void endTimedEvent(const char* eventName, cocos2d::__Dictionary* parameters);	// non-nil parameters will update the parameters
    
    /*
     set user info
     */
    static void setUserID(const char* userID);	// user's id in your system
    static void setAge(int age);				// user's age in years
    static void setGender(Gender gender);	// user's gender
    
    /*
     set location information, iOS only
     */
    static void setLatitude(double latitude, double longitude, float horizontalAccuracy, float verticalAccuracy);
	
	/*
     set report location, Android only
     */
	static void setReportLocation(bool reportLocation);
    
    /*
     optional session settings that can be changed after start session
     */
    static void setSessionReportsOnCloseEnabled(bool sendSessionReportsOnClose);	// default is YES
    static void setSessionReportsOnPauseEnabled(bool setSessionReportsOnPauseEnabled);	// default is NO
    static void setEventLoggingEnabled(bool value);
	
	/*
	 Reset session, Android only
	 */
	static void reset();
};

#endif // FLURRY_X_H
