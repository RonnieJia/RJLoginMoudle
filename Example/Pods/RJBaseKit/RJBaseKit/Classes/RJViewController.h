//
//  RJViewController.h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RJBackType) {
    RJBackTypeBackW,// < 白色
    RJBackTypeBackB,// < 黑
    RJBackTypeArrowW,// →  白色
    RJBackTypeArrowB,// →  黑色
};

@interface RJViewController : UIViewController


- (void)rj_SetBackButton:(RJBackType)type;
/// 返回按钮
- (void)rj_SetBackButton;

/// 添加键盘的通知
- (void)rj_addKeyboardNotification;

/// 弹出键盘
/// @param keyboardHeight 键盘高度
- (void)rj_keyboardWasShow:(CGFloat)keyboardHeight;

/// 收起键盘
/// @param noti 通知
- (void)rj_keyboardWillBeHidden:(NSNotification *)noti;


/// 取消scrollView安全间距
- (void)rj_setScrollViewAdjustsInsets:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
