//
//  KDCircularActivityIndicator.swift
//  KDCircularActivityIndicator
//
//  Created by Kauna Mohammed on 03/12/2018.
//  Copyright © 2018 Kauna Mohammed. All rights reserved.
//

import UIKit

public final class KDCircularActivityIndicator: UIView {
    
    // MARK: - Key Names
    static let kAnimationGroupKey = "AnimationGroupKey"
    static let kRotateAnimationKey = "RotatingAnimationKey"
    static let kStrokeColorAnimationKey = "StrokeColorAnimationKey"
    
    // MARK: - Private
    private let shapeLayer = CAShapeLayer()
    
    // MARK: - Configuration
    /// Whether the indicator should hide when animation has stopped
    private var shouldHideWhenStop: Bool = true
    
    /// Whether the indicator should show when animation has stopped
    private  var shouldShowWhenStart: Bool = true
    
    // MARK: - Public
    
    /// Indicates whether the indicator is animating
    public var isAnimating: Bool = false
    
    public var shouldAutoReverseAnimation: Bool = true
    
    /// The width of the the indicator
    public var lineWidth: CGFloat = 5
    
    public var strokeToValue: CGFloat = 0.9
    
    /// Whether the indicator should hide when animation has stopped
    public var strokeStartDuration: TimeInterval = 1
    
    /// Whether the indicator should hide when animation has stopped
    public var strokeEndDuration: TimeInterval = 2
    
    
    /// how long the indicator should keep spinning
    public var spinDuration: TimeInterval = 10
    
    /// the colours to animate to
    public var colors: [UIColor] = [.gray]
    
    /// The dash pattern of the indicator
    public var lineDash: LineDash = .fourFourTwo
    
    /// the key times to animate to each color in the array
    private var strokeColorAnimationKeyTimes: Array<NSNumber> {
        let numberOfColors = colors.count
        if numberOfColors == 0 { return [] }
        if numberOfColors == 1 { return [0] }
        
        var keyTimes = [NSNumber]()
        
        let step: CGFloat = CGFloat(1 / (numberOfColors - 1))
        
        for i in 0..<numberOfColors {
            keyTimes.append(NSNumber(value: Float(step * CGFloat(i))))
        }
        return keyTimes
    }
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateShapeLayerPath()
        layer.addSublayer(shapeLayer)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        shapeLayer.frame = bounds
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = colors[0].cgColor
        
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineDashPattern = lineDash.dashPattern
        
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
    }
    
}

extension KDCircularActivityIndicator {
    // MARK: - Private methods
    
    /// draws the path and assigns it to the `shapeLayer`
    private func updateShapeLayerPath() {
        
        let shorterSide = min(bounds.size.width, bounds.size.height)
        let centerPoint = CGPoint(x: shorterSide / 2, y: shorterSide / 2)
        let radius = shorterSide / 2 - lineWidth / 2 - 3
        
        let circularPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
    }
}


extension KDCircularActivityIndicator {
    // MARK: - Public methods
    
    /// starts the animation
    public func startAnimating() {
        
        if isAnimating { return }
        if shouldShowWhenStart { isHidden = false }
        
        isAnimating = true
        
        shapeLayer.removeAllAnimations()
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.toValue = 0.5
        strokeStartAnimation.duration = strokeStartDuration
        strokeStartAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        strokeStartAnimation.beginTime = strokeEndDuration
        strokeStartAnimation.fillMode = .both
        strokeStartAnimation.isRemovedOnCompletion = false
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.toValue = strokeToValue
        strokeEndAnimation.duration = strokeEndDuration
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        strokeEndAnimation.beginTime = 0
        strokeEndAnimation.fillMode = .both
        strokeEndAnimation.isRemovedOnCompletion = false
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        rotationAnimation.duration = spinDuration
        rotationAnimation.beginTime = CACurrentMediaTime()
        rotationAnimation.fillMode = .both
        rotationAnimation.repeatCount = .greatestFiniteMagnitude
        rotationAnimation.isRemovedOnCompletion = false
        
        let strokeColorAnimation = CAKeyframeAnimation(keyPath: "strokeColor")
        strokeColorAnimation.duration = (strokeEndDuration + strokeStartDuration) * Double(colors.count)
        strokeColorAnimation.fillMode = .forwards
        strokeColorAnimation.keyTimes = strokeColorAnimationKeyTimes
        strokeColorAnimation.repeatCount = .greatestFiniteMagnitude
        strokeColorAnimation.isRemovedOnCompletion = false
        strokeColorAnimation.values = colors.map { $0.cgColor }
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeEndAnimation, strokeStartAnimation]
        animationGroup.autoreverses = shouldAutoReverseAnimation
        animationGroup.fillMode = .both
        animationGroup.isRemovedOnCompletion = false
        animationGroup.duration = strokeStartDuration + strokeEndDuration
        animationGroup.repeatCount = .greatestFiniteMagnitude
        
        shapeLayer.add(animationGroup, forKey: KDCircularActivityIndicator.kAnimationGroupKey)
        shapeLayer.add(rotationAnimation, forKey: KDCircularActivityIndicator.kRotateAnimationKey)
        shapeLayer.add(strokeColorAnimation, forKey: KDCircularActivityIndicator.kStrokeColorAnimationKey)
    }
    
    /// stops the animation
    public func stopAnimating() {
        if !isAnimating { return }
        if !shouldHideWhenStop { isHidden = true }
        isAnimating = false
        shapeLayer.removeAllAnimations()
        shapeLayer.removeFromSuperlayer()
        removeFromSuperview()
    }
}
