//
//  _singleton.h
//  component
//
//  Created by fallen.ink on 4/12/16.
//  Copyright © 2016 OpenTeam. All rights reserved.
//
//  inspired by samurai

#import <Foundation/Foundation.h>

#pragma mark -

#undef  execute_once
#define execute_once( _block_ ) \
static dispatch_once_t once; \
dispatch_once( &once, _block_ );

#pragma mark -

#undef	singleton
#define singleton( __class ) \
property (nonatomic, readonly) __class * sharedInstance; \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef	def_singleton
#define def_singleton( __class ) \
dynamic sharedInstance; \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __strong id __singleton__ = nil; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#pragma mark - 

#undef  prop_singleton
#define prop_singleton( __type, __name ) \
property (nonatomic, strong) __type * __name;

#undef  def_prop_singleton
#define def_prop_singleton( __type, __name ) \
synthesize __name; \
- (__type *)__name { \
/* _##__name */if (!__name) { \
__name = [__type sharedInstance]; \
} \
\
return __name; \
}

#pragma mark -

@interface _Singleton : NSObject

+ (instancetype)sharedInstance;

@end
