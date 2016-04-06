//
//  Animations.swift
//  BabyBox-
//
//  Created by wp on 16/4/6.
//  Copyright © 2016年 wp. All rights reserved.
//
//                         类目
//OC: 类名 + （类目名）
//extension来声明 类名{}
import Foundation
import UIKit

extension UIView{
    
    func jamp(){
        var scale:CGFloat = 1
        
        UIView .animateWithDuration(0.2, animations: {
            scale = scale == 1 ? 2 : 1
            self.transform = CGAffineTransformMakeScale(scale, scale);
            }) { (_) in
                scale = scale == 1 ? 2 : 1;
                self.transform = CGAffineTransformMakeScale(scale, scale);
        }
        
    }
    
}