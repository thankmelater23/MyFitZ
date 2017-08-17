//
//  DKChainableAnimationKit+Bezier.swift
//  DKChainableAnimationKit
//
//  Created by Draveness on 15/6/14.
//  Copyright (c) 2015年 Draveness. All rights reserved.
//

import UIKit

public extension DKChainableAnimationKit {

<<<<<<< HEAD
    public func moveOnPath(_ path: UIBezierPath) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let pathAnimation = self.basicAnimationForKeyPath("position")
            pathAnimation.path = path.cgPath
=======
    public func moveOnPath(path: UIBezierPath) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let pathAnimation = self.basicAnimationForKeyPath("position")
            pathAnimation.path = path.CGPath
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(pathAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            let endPoint = path.currentPoint
            view.layer.position = endPoint
        }
        return self
    }

<<<<<<< HEAD
    public func moveAndRotateOnPath(_ path: UIBezierPath) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let pathAnimation = self.basicAnimationForKeyPath("position")
            pathAnimation.path = path.cgPath
=======
    public func moveAndRotateOnPath(path: UIBezierPath) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let pathAnimation = self.basicAnimationForKeyPath("position")
            pathAnimation.path = path.CGPath
>>>>>>> MyFitZOld/master
            pathAnimation.rotationMode = kCAAnimationRotateAuto
            self.addAnimationFromCalculationBlock(pathAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            let endPoint = path.currentPoint
            view.layer.position = endPoint
        }
        return self
    }

<<<<<<< HEAD
    public func moveAndReverseRotateOnPath(_ path: UIBezierPath) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let pathAnimation = self.basicAnimationForKeyPath("position")
            pathAnimation.path = path.cgPath
=======
    public func moveAndReverseRotateOnPath(path: UIBezierPath) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let pathAnimation = self.basicAnimationForKeyPath("position")
            pathAnimation.path = path.CGPath
>>>>>>> MyFitZOld/master
            pathAnimation.rotationMode = kCAAnimationRotateAutoReverse
            self.addAnimationFromCalculationBlock(pathAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            let endPoint = path.currentPoint
            view.layer.position = endPoint
        }
        return self
    }
}
