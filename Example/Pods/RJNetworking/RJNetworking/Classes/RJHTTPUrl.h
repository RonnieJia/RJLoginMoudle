

#ifndef RJHTTPUrl_h
#define RJHTTPUrl_h

#define kBASEURL @""


#if DEBUG
#define RJHTTPLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define RJHTTPLog(args...)    // do nothing.
#endif

#endif /* RJHTTPUrl_h */
