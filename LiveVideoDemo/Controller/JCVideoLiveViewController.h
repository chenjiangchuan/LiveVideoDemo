//
//  JCVideoLiveViewController.h
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/9.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface JCVideoLiveViewController : UIViewController

/** liveURL */
@property (strong, nonatomic) NSString *liveURL;
/** imageURL */
@property (strong, nonatomic) NSString *imageURL;

@property(atomic, retain) id<IJKMediaPlayback> player;

@end
