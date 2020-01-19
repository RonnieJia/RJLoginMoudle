

#ifndef RJHTTPUrl_h
#define RJHTTPUrl_h

#define kDomain @"https://app.kjlsc.com/"
#define kBaseUrl [NSString stringWithFormat:@"%@back.php/api/",kDomain]






#if DEBUG
#define RJHTTPLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define RJHTTPLog(args...)    // do nothing.
#endif

#endif /* RJHTTPUrl_h */
