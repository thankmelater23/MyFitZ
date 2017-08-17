//
//  DKChainableAnimationKit.swift
//  DKChainableAnimationKit
//
//  Created by Draveness on 15/5/13.
//  Copyright (c) 2015年 Draveness. All rights reserved.
//

import UIKit

<<<<<<< HEAD
open class DKChainableAnimationKit {

    weak var view: UIView!

    typealias AnimationCalculationAction = (UIView) -> Void
    typealias AnimationCompletionAction = (UIView) -> Void
=======
public class DKChainableAnimationKit {

    weak var view: UIView!

    typealias AnimationCalculationAction = UIView -> Void
    typealias AnimationCompletionAction = UIView -> Void
>>>>>>> MyFitZOld/master

    internal var animationCalculationActions: [[AnimationCalculationAction]]!
    internal var animationCompletionActions: [[AnimationCompletionAction]]!
    internal var animationGroups: NSMutableArray!
    internal var animations: [[DKKeyFrameAnimation]]!
<<<<<<< HEAD
    open var animationCompletion: (() -> Void)?
=======
    public var animationCompletion: (Void -> Void)?
>>>>>>> MyFitZOld/master

    // MARK: - Initialize

    init() {
        self.setup()
    }

<<<<<<< HEAD
    fileprivate func setup() {
=======
    private func setup() {
>>>>>>> MyFitZOld/master
        self.animations = [[]]
        self.animationGroups = [self.basicAnimationGroup()]
        self.animationCompletionActions = [[]]
        self.animationCalculationActions = [[]]
    }

<<<<<<< HEAD
    fileprivate func clear() {
=======
    private func clear() {
>>>>>>> MyFitZOld/master
        self.animations.removeAll()
        self.animationGroups.removeAllObjects()
        self.animationCompletionActions.removeAll()
        self.animationCalculationActions.removeAll()
        self.animations.append([])
        self.animationCompletionActions.append([AnimationCalculationAction]())
        self.animationCalculationActions.append([AnimationCompletionAction]())
<<<<<<< HEAD
        self.animationGroups.add(self.basicAnimationGroup())
=======
        self.animationGroups.addObject(self.basicAnimationGroup())
>>>>>>> MyFitZOld/master
    }

    // MARK: - Animation Time

<<<<<<< HEAD
    open func delay(_ delay: TimeInterval) -> DKChainableAnimationKit {
        var delay = delay
        for group in self.animationGroups {
            let duration = (group as AnyObject).duration as TimeInterval
=======
    public func delay(delay: NSTimeInterval) -> DKChainableAnimationKit {
        var delay = delay
        for group in self.animationGroups {
            let duration = group.duration as NSTimeInterval
>>>>>>> MyFitZOld/master
            delay += duration
        }
        if let group = self.animationGroups.lastObject as? CAAnimationGroup {
            group.beginTime = CACurrentMediaTime() + delay
        }
        return self
    }

<<<<<<< HEAD
    open func delay(_ time: CGFloat) -> DKChainableAnimationKit {
        return delay(TimeInterval(time))
    }

    open var seconds: DKChainableAnimationKit {
=======
    public func delay(time: CGFloat) -> DKChainableAnimationKit {
        return delay(NSTimeInterval(time))
    }

    public var seconds: DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        get {
            return self
        }
    }

<<<<<<< HEAD
    open func wait(_ delay: TimeInterval) -> DKChainableAnimationKit {
        return self.delay(delay)
    }

    @discardableResult open func animate(_ duration: TimeInterval) -> DKChainableAnimationKit {
=======
    public func wait(delay: NSTimeInterval) -> DKChainableAnimationKit {
        return self.delay(delay)
    }

    public func animate(duration: NSTimeInterval) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        if let group = self.animationGroups.lastObject as? CAAnimationGroup {
            group.duration = duration
            self.animateChain()
        }
        return self
    }

<<<<<<< HEAD
    @discardableResult open func animate(_ duration: CGFloat) -> DKChainableAnimationKit {
        return animate(TimeInterval(duration))
=======
    public func animate(duration: CGFloat) -> DKChainableAnimationKit {
        return animate(NSTimeInterval(duration))
>>>>>>> MyFitZOld/master
    }

//    public func animateWithRepeat(duration: NSTimeInterval) -> DKChainableAnimationKit {
//        if let group = self.animationGroups.lastObject as? CAAnimationGroup {
//            group.duration = duration
//            saveAnimations()
//            animationCompletion = {
//                self.restoreAnimations()
//                self.animateChain()
//            }
//            self.animateChain()
//        }
//        return self
//    }
//
//    internal var tempAnimationCalculationActions: [[AnimationCalculationAction]]!
//    internal var tempAnimationCompletionActions: [[AnimationCompletionAction]]!
//    internal var tempAnimationGroups: NSMutableArray!
//    internal var tempAnimations: [[DKKeyFrameAnimation]]!
//
//    internal func saveAnimations() {
//        self.tempAnimationCalculationActions = self.animationCalculationActions
//        self.tempAnimationCompletionActions = self.animationCompletionActions
//        self.tempAnimationGroups = self.animationGroups.mutableCopy() as! NSMutableArray
//        self.tempAnimations = self.animations
//    }
//
//    internal func restoreAnimations() {
//        self.animationCalculationActions = self.tempAnimationCalculationActions
//        self.animationCompletionActions = self.tempAnimationCompletionActions
//        self.animationGroups = self.tempAnimationGroups.mutableCopy() as! NSMutableArray
//        self.animations = self.tempAnimations
//    }

<<<<<<< HEAD
    open func thenAfter(_ after: TimeInterval) -> DKChainableAnimationKit {
        if let group = self.animationGroups.lastObject as? CAAnimationGroup {
            group.duration = after
            let newGroup = self.basicAnimationGroup()
            self.animationGroups.add(newGroup)
=======
    public func thenAfter(after: NSTimeInterval) -> DKChainableAnimationKit {
        if let group = self.animationGroups.lastObject as? CAAnimationGroup {
            group.duration = after
            let newGroup = self.basicAnimationGroup()
            self.animationGroups.addObject(newGroup)
>>>>>>> MyFitZOld/master
            self.animations.append([])
            self.animationCalculationActions.append([])
            self.animationCompletionActions.append([])
        }
        return self
    }

<<<<<<< HEAD
    open func thenAfter(_ after: CGFloat) -> DKChainableAnimationKit {
        return thenAfter(TimeInterval(after))
    }

    @discardableResult open func animateWithCompletion(_ duration: TimeInterval, _ completion: @escaping () -> Void) -> DKChainableAnimationKit {
=======
    public func thenAfter(after: CGFloat) -> DKChainableAnimationKit {
        return thenAfter(NSTimeInterval(after))
    }

    public func animateWithCompletion(duration: NSTimeInterval, _ completion: Void -> Void) -> DKChainableAnimationKit {
>>>>>>> MyFitZOld/master
        if let group = self.animationGroups.lastObject as? CAAnimationGroup {
            group.duration = duration
            self.animationCompletion = completion
            self.animateChain()
        }
        return self
    }

<<<<<<< HEAD
    @discardableResult open func animateWithCompletion(_ duration: CGFloat, _ completion: @escaping () -> Void) -> DKChainableAnimationKit {
        return animateWithCompletion(TimeInterval(duration), completion)
    }

    internal func degreesToRadians(_ degree: Double) -> Double {
        return (degree / 180.0) * M_PI
    }

    fileprivate func animateChain() {
        self.sanityCheck()
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.view?.layer.removeAnimation(forKey: "AnimationChain")
=======
    public func animateWithCompletion(duration: CGFloat, _ completion: Void -> Void) -> DKChainableAnimationKit {
        return animateWithCompletion(NSTimeInterval(duration), completion)
    }

    internal func degreesToRadians(degree: Double) -> Double {
        return (degree / 180.0) * M_PI
    }

    private func animateChain() {
        self.sanityCheck()
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.view?.layer.removeAnimationForKey("AnimationChain")
>>>>>>> MyFitZOld/master
            self.chainLinkDidFinishAnimating()
        }
        self.animateChainLink()
        CATransaction.commit()

        self.executeCompletionActions()
    }

<<<<<<< HEAD
    fileprivate func animateChainLink() {
=======
    private func animateChainLink() {
>>>>>>> MyFitZOld/master
        self.makeAnchor(0.5, 0.5)
        if let animationCluster = self.animationCalculationActions.first, let _ = self.view {
            for action in animationCluster {
                action(self.view)
            }
        }
        if let group: CAAnimationGroup = self.animationGroups.firstObject as? CAAnimationGroup,
<<<<<<< HEAD
            let animationCluster: [DKKeyFrameAnimation] = self.animations.first {
=======
            animationCluster: [DKKeyFrameAnimation] = self.animations.first {
>>>>>>> MyFitZOld/master
            for animation in animationCluster {
                animation.duration = group.duration
                animation.calculte()
            }
            group.animations = animationCluster
<<<<<<< HEAD
            self.view?.layer.add(group, forKey: "AnimationChain")
        }
    }

    fileprivate func executeCompletionActions() {
        if let group = self.animationGroups.firstObject as? CAAnimationGroup {
            let delay = max(group.beginTime - CACurrentMediaTime(), 0.0)
            let delayTime = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                if let
                    actionCluster: [AnimationCompletionAction] = self.animationCompletionActions.first,
                    let view = self.view {
=======
            self.view?.layer.addAnimation(group, forKey: "AnimationChain")
        }
    }

    private func executeCompletionActions() {
        if let group = self.animationGroups.firstObject as? CAAnimationGroup {
            let delay = max(group.beginTime - CACurrentMediaTime(), 0.0)
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                if let
                    actionCluster: [AnimationCompletionAction] = self.animationCompletionActions.first,
                    view = self.view {
>>>>>>> MyFitZOld/master
                        for action in actionCluster {
                            action(view)
                        }
                }
            }
        }
    }

<<<<<<< HEAD
    fileprivate func chainLinkDidFinishAnimating() {
        self.animationCompletionActions.remove(at: 0)
        self.animationCalculationActions.remove(at: 0)
        self.animations.remove(at: 0)
        self.animationGroups.removeObject(at: 0)
=======
    private func chainLinkDidFinishAnimating() {
        self.animationCompletionActions.removeAtIndex(0)
        self.animationCalculationActions.removeAtIndex(0)
        self.animations.removeAtIndex(0)
        self.animationGroups.removeObjectAtIndex(0)
>>>>>>> MyFitZOld/master

        if self.animationGroups.count == 0 {
            self.clear()
            if let completion = self.animationCompletion {
                self.animationCompletion = nil
                completion()
            }
        } else {
            self.animateChain()
        }
    }

<<<<<<< HEAD
    fileprivate func sanityCheck() {
=======
    private func sanityCheck() {
>>>>>>> MyFitZOld/master
        assert(self.animations.count == self.animationGroups.count, "FATAL ERROR: ANIMATION GROUPS AND ANIMATIONS ARE OUT OF SYNC");
        assert(self.animationCalculationActions.count == self.animationCompletionActions.count, "FATAL ERROR: ANIMATION CALCULATION OBJECTS AND ANIMATION COMPLETION OBJECTS ARE OUT OF SYNC");
        assert(self.animations.count == self.animationCompletionActions.count, "FATAL ERROR: ANIMATIONS AND ANIMATION COMPLETION OBJECTS ARE OUT OF SYNC");
    }

    // MARK: - Animation Action

<<<<<<< HEAD
    internal func addAnimationKeyframeCalculation(_ functionBlock: @escaping DKKeyframeAnimationFunctionBlock) {
=======
    internal func addAnimationKeyframeCalculation(functionBlock: DKKeyframeAnimationFunctionBlock) {
>>>>>>> MyFitZOld/master
        self.addAnimationCalculationAction { (view: UIView) -> Void in
            let animationCluster = self.animations.first
            if let animation = animationCluster?.last {
                animation.functionBlock = functionBlock
            }
        }
    }

<<<<<<< HEAD
    internal func addAnimationCalculationAction(_ action: @escaping AnimationCalculationAction) {
=======
    internal func addAnimationCalculationAction(action: AnimationCalculationAction) {
>>>>>>> MyFitZOld/master
        if var actions = self.animationCalculationActions.last as [AnimationCalculationAction]? {
            actions.append(action)
            self.animationCalculationActions.removeLast()
            self.animationCalculationActions.append(actions)
        }
    }

<<<<<<< HEAD
    internal func addAnimationCompletionAction(_ action: @escaping AnimationCompletionAction) {
=======
    internal func addAnimationCompletionAction(action: AnimationCompletionAction) {
>>>>>>> MyFitZOld/master
        if var actions = self.animationCompletionActions.last as [AnimationCompletionAction]? {
            actions.append(action)
            self.animationCompletionActions.removeLast()
            self.animationCompletionActions.append(actions)
        }
    }

<<<<<<< HEAD
    internal func addAnimationFromCalculationBlock(_ animation: DKKeyFrameAnimation) {
        if var animationCluster = self.animations.first {
            animationCluster.append(animation)
            self.animations.remove(at: 0)
            self.animations.insert(animationCluster, at: 0)
=======
    internal func addAnimationFromCalculationBlock(animation: DKKeyFrameAnimation) {
        if var animationCluster = self.animations.first {
            animationCluster.append(animation)
            self.animations.removeAtIndex(0)
            self.animations.insert(animationCluster, atIndex: 0)
>>>>>>> MyFitZOld/master
        }
    }

    // MARK: - Basic Animation Helper

    internal func basicAnimationGroup() -> CAAnimationGroup {
        return CAAnimationGroup()
    }
    
<<<<<<< HEAD
    internal func basicAnimationForKeyPath(_ keyPath: String) -> DKKeyFrameAnimation {
=======
    internal func basicAnimationForKeyPath(keyPath: String) -> DKKeyFrameAnimation {
>>>>>>> MyFitZOld/master
        let animation = DKKeyFrameAnimation(keyPath: keyPath)
        animation.repeatCount = 0
        animation.autoreverses = false
        return animation
    }

<<<<<<< HEAD
    internal func newPositionFrom(newOrigin: CGPoint) -> CGPoint {
=======
    internal func newPositionFrom(newOrigin newOrigin: CGPoint) -> CGPoint {
>>>>>>> MyFitZOld/master
        let anchor = self.view.layer.anchorPoint
        let size = self.view.bounds.size
        let newPosition = CGPoint(x: newOrigin.x + anchor.x * size.width, y: newOrigin.y + anchor.y * size.height)
        return newPosition
    }

<<<<<<< HEAD
    internal func newPositionFrom(newCenter: CGPoint) -> CGPoint {
=======
    internal func newPositionFrom(newCenter newCenter: CGPoint) -> CGPoint {
>>>>>>> MyFitZOld/master
        let anchor = self.view.layer.anchorPoint
        let size = self.view.bounds.size
        let newPosition = CGPoint(x: newCenter.x + (anchor.x - 0.5) * size.width, y: newCenter.y + (anchor.y - 0.5) * size.height)
        return newPosition
    }

}
