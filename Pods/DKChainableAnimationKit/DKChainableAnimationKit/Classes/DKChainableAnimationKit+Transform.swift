//
//  DKChainableAnimationKit+Transform.swift
//  DKChainableAnimationKit
//
//  Created by Draveness on 15/5/23.
//  Copyright (c) 2015年 Draveness. All rights reserved.
//

import UIKit

extension DKChainableAnimationKit {

    public var transformIdentity: DKChainableAnimationKit {
        get {
            self.addAnimationCalculationAction { (view: UIView) -> Void in
                let transformAnimation = self.basicAnimationForKeyPath("transform")
                let transform = CATransform3DIdentity
<<<<<<< HEAD
                transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
                transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
                transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
                transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
                self.addAnimationFromCalculationBlock(transformAnimation)
            }
            self.addAnimationCompletionAction { (view: UIView) -> Void in
                let transform = CATransform3DIdentity
                view.layer.transform = transform
            }
            return self
        }
    }

<<<<<<< HEAD
    public func transformX(_ x: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformX(x: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, x, 0, 0)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, x, 0, 0)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func transformY(_ y: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformY(y: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, 0, y, 0)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, 0, y, 0)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func transformZ(_ z: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformZ(z: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, 0, 0, z)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, 0, 0, z)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func transformXY(_ x: CGFloat, _ y: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformXY(x: CGFloat, _ y: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, x, y, 0)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DTranslate(transform, x, y, 0)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func transformScale(_ scale: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformScale(scale: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DScale(transform, scale, scale, 1)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DScale(transform, scale, scale, 1)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func transformScaleX(_ scaleX: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformScaleX(scaleX: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DScale(transform, scaleX, 1, 1)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DScale(transform, scaleX, 1, 1)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func transformScaleY(_ scaleY: CGFloat) -> DKChainableAnimationKit {
=======
    public func transformScaleY(scaleY: CGFloat) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let transformAnimation = self.basicAnimationForKeyPath("transform")
            var transform = view.layer.transform
            transform = CATransform3DScale(transform, 1, scaleY, 1)
<<<<<<< HEAD
            transformAnimation.fromValue = NSValue(caTransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(caTransform3D: transform)
=======
            transformAnimation.fromValue = NSValue(CATransform3D: view.layer.transform)
            transformAnimation.toValue = NSValue(CATransform3D: transform)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(transformAnimation)
        }
        self.addAnimationCompletionAction { (view: UIView) -> Void in
            var transform = view.layer.transform
            transform = CATransform3DScale(transform, 1, scaleY, 1)
            view.layer.transform = transform
        }
        return self
    }

<<<<<<< HEAD
    public func rotate(_ angle: Double) -> DKChainableAnimationKit {
=======
    public func rotate(angle: Double) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let rotationAnimation = self.basicAnimationForKeyPath("transform.rotation")
            let transform = view.layer.transform
            let originalRotation = Double(atan2(transform.m12, transform.m11))
<<<<<<< HEAD
            rotationAnimation.fromValue = originalRotation as AnyObject!
            rotationAnimation.toValue = (originalRotation + self.degreesToRadians(angle)) as AnyObject!
=======
            rotationAnimation.fromValue = originalRotation
            rotationAnimation.toValue = originalRotation + self.degreesToRadians(angle)
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(rotationAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            let transform = view.layer.transform
            let originalRotation = Double(atan2(transform.m12, transform.m11))
            let zRotation = CATransform3DMakeRotation(CGFloat(self.degreesToRadians(angle) + originalRotation), 0.0, 0.0, 1.0)
            view.layer.transform = zRotation
        }
        return self
    }

}
