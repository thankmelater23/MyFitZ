//
//  DKChainableAnimationKit+Extra.swift
//  DKChainableAnimationKit
//
//  Created by Draveness on 15/6/14.
//  Copyright (c) 2015年 Draveness. All rights reserved.
//

import Foundation

public extension DKChainableAnimationKit {

<<<<<<< HEAD
    public func makeOpacity(_ opacity: CGFloat) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let opacityAnimation = self.basicAnimationForKeyPath("opacity")
            opacityAnimation.fromValue = view.alpha as AnyObject!
            opacityAnimation.toValue = opacity as AnyObject!
=======
    public func makeOpacity(opacity: CGFloat) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let opacityAnimation = self.basicAnimationForKeyPath("opacity")
            opacityAnimation.fromValue = view.alpha
            opacityAnimation.toValue = opacity
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(opacityAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            view.alpha = opacity
        }
        return self
    }

<<<<<<< HEAD
    public func makeAlpha(_ alpha: CGFloat) -> DKChainableAnimationKit {
        return makeOpacity(alpha)
    }

    public func makeBackground(_ color: UIColor) -> DKChainableAnimationKit {
=======
    public func makeAlpha(alpha: CGFloat) -> DKChainableAnimationKit {
        return makeOpacity(alpha)
    }

    public func makeBackground(color: UIColor) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let backgroundColorAnimation = self.basicAnimationForKeyPath("backgroundColor")
            backgroundColorAnimation.fromValue = view.backgroundColor
            backgroundColorAnimation.toValue = color
            self.addAnimationFromCalculationBlock(backgroundColorAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            view.backgroundColor = color
        }
        return self
    }

<<<<<<< HEAD
    public func makeBorderColor(_ color: UIColor) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let borderColorAnimation = self.basicAnimationForKeyPath("borderColor")
            borderColorAnimation.fromValue = UIColor(cgColor: view.layer.borderColor!)
=======
    public func makeBorderColor(color: UIColor) -> DKChainableAnimationKit {
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let borderColorAnimation = self.basicAnimationForKeyPath("borderColor")
            borderColorAnimation.fromValue = UIColor(CGColor: view.layer.borderColor!)
>>>>>>> MyFitZOld/master
            borderColorAnimation.toValue = color
            self.addAnimationFromCalculationBlock(borderColorAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
<<<<<<< HEAD
            view.layer.borderColor = color.cgColor
=======
            view.layer.borderColor = color.CGColor
>>>>>>> MyFitZOld/master
        }
        return self
    }

<<<<<<< HEAD
    public func makeBorderWidth(_ width: CGFloat) -> DKChainableAnimationKit {
        let width = max(0, width)
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let borderColorAnimation = self.basicAnimationForKeyPath("borderWidth")
            borderColorAnimation.fromValue = view.layer.borderWidth as AnyObject!
            borderColorAnimation.toValue = width as AnyObject!
=======
    public func makeBorderWidth(width: CGFloat) -> DKChainableAnimationKit {
        let width = max(0, width)
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let borderColorAnimation = self.basicAnimationForKeyPath("borderWidth")
            borderColorAnimation.fromValue = view.layer.borderWidth
            borderColorAnimation.toValue = width
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(borderColorAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            view.layer.borderWidth = width
        }
        return self
    }

<<<<<<< HEAD
    public func makeCornerRadius(_ cornerRadius: CGFloat) -> DKChainableAnimationKit {
        let cornerRadius = max(0, cornerRadius)
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let cornerRadiusAnimation = self.basicAnimationForKeyPath("cornerRadius")
            cornerRadiusAnimation.fromValue = view.layer.cornerRadius as AnyObject!
            cornerRadiusAnimation.toValue = cornerRadius as AnyObject!
=======
    public func makeCornerRadius(cornerRadius: CGFloat) -> DKChainableAnimationKit {
        let cornerRadius = max(0, cornerRadius)
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let cornerRadiusAnimation = self.basicAnimationForKeyPath("cornerRadius")
            cornerRadiusAnimation.fromValue = view.layer.cornerRadius
            cornerRadiusAnimation.toValue = cornerRadius
>>>>>>> MyFitZOld/master
            self.addAnimationFromCalculationBlock(cornerRadiusAnimation)
        }

        self.addAnimationCompletionAction { (view: UIView) -> Void in
            view.layer.cornerRadius = cornerRadius
        }
        return self
    }
}

