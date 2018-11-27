//
//  CALayer+Transition.swift
//  CALayerTransitionDemo
//
//  Created by fashion on 2018/11/26.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

/// 动画类型
public enum TransitionAnimType : Int {
    /// 水波纹
    case rippleEffect = 0
    /// 吸走
    case suckEffect
    /// 翻开书本
    case pageCurl
    /// 正反翻转
    case oglFlip
    /// 正方体
    case cube
    /// push推开
    case reveal
    /// 合上书本
    case pageUnCurl
    /// 随机
    case random
}
/// 动画方向
public enum TransitionSubtypesFrom : Int{
    /// 从上
    case top = 0
    /// 从左
    case left
    /// 从下
    case botoom
    /// 从右
    case right
    /// 随机
    case random
}

/// 动画曲线
public enum TransitionCurve : Int {
    /// 默认
    case `default` = 0
    /// 缓进
    case easeIn
    /// 缓出
    case easeOut
    /// 缓进缓出
    case easeInEaseOut
    /// 线性
    case linear
    /// 随机
    case random
}

extension CALayer{
    
    
    /// 转场动画实例
    ///
    /// - Parameters:
    ///   - animatonType: 转场动画类型
    ///   - subType: 转动动画方向
    ///   - curve: 转动动画曲线
    ///   - duration: 转动动画曲线
    public func transitionWithAnimType(animatonType: TransitionAnimType, subType: TransitionSubtypesFrom, curve: TransitionCurve, duration: CGFloat) ->CATransition{
        
        let key = "transition"
        if self.animation(forKey: key) != nil {
            self.removeAnimation(forKey: key)
        }
        
        let transition : CATransition = CATransition.init()
        transition.duration = CFTimeInterval(duration)
        
        // 动画类型
        transition.type = CATransitionType(rawValue: animaTypeWithTransitionType(type: animatonType))
        
        // 动画方向
        transition.subtype = CATransitionSubtype(rawValue: animationSubType(subType: subType))
        
        /// 缓动函数
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: animationCurve(curve: curve)))

        transition.isRemovedOnCompletion = true
        self.add(transition, forKey: key)
        
        return transition
    }
    /// 返回动画方向
    private func animationSubType(subType: TransitionSubtypesFrom) -> String {
        let animSubTypeArray = [CATransitionSubtype.fromTop, CATransitionSubtype.fromLeft,CATransitionSubtype.fromBottom,  CATransitionSubtype.fromRight]
        return objFromArray(array: animSubTypeArray, index: subType.rawValue, isRandom: (TransitionSubtypesFrom.random == subType)) as! String
    }
    
    // 返回动画曲线
    private func animationCurve(curve : TransitionCurve) -> String{
        let animCurveArray = [CAMediaTimingFunctionName.default, CAMediaTimingFunctionName.easeIn, CAMediaTimingFunctionName.easeOut, CAMediaTimingFunctionName.easeInEaseOut, CAMediaTimingFunctionName.linear]
        return objFromArray(array: animCurveArray, index: curve.rawValue, isRandom: (TransitionCurve.random == curve)) as! String
    }
    
    private func animaTypeWithTransitionType(type: TransitionAnimType) -> String{
        let animArray = ["rippleEffect","suckEffect","pageCurl","oglFlip","cube","reveal","pageUnCurl"]
        
        return self.objFromArray(array: animArray, index: type.rawValue, isRandom: type == TransitionAnimType.random) as! String
    }
    
    // 统一从数据返回对象
    private func objFromArray(array : Array<Any>,index: Int, isRandom: Bool) -> AnyObject{
        let count = array.count
        let i : Int = isRandom ? Int(arc4random_uniform(UInt32(count))) : index
        return array[i] as AnyObject
    }
    
    
}
