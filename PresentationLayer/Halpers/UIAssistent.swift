//
//  UIAssistant.swift
//  iRegistratura2
//
//  Created by A on 13/11/2018.
//  Copyright © 2018 Electronical medicine. All rights reserved.
//

import Foundation
import UIKit

class UIAssistant {
    static func drawGradient(withBounds bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.bounds = bounds
        gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, true, 2.0)
        let context = UIGraphicsGetCurrentContext()
        gradientLayer.render(in: context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    static func drawGradient(forImage imageView: UIImageView, bounds: CGRect, colors: [CGColor]) {
        let gradientLayer = CAGradientLayer(layer: imageView.layer)
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        imageView.layer.insertSublayer(gradientLayer, at: 0)
    }

    /**
    Устанавливает тень UIView
    В некоторых случаях требуется layer.masksToBounds = false
    */
    static func setShadow(forLayer layer: CALayer, color: UIColor, radius: Double, opacity: Float = 0.5, verticalOffset: Int = 5, horizontalOffset: Int = 0) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: horizontalOffset, height: verticalOffset)// Смещение тени
        layer.shadowRadius = CGFloat(radius)
        layer.shadowOpacity = opacity
    }

    static func image(fromColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }

    static func cornerRadius(forView view: UIView, radius: Int, isClipsToBounds: Bool = false) {
        view.clipsToBounds = isClipsToBounds
        view.layer.cornerRadius = CGFloat(radius)
    }

    static func roundCorners(forLayer layer: CALayer, bounds: CGRect, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    static func animateTransition(from sourceView: UIView, to destinationView: UIView, duration: Double = 0.5, transitionOptions: UIView.AnimationOptions = .transitionCrossDissolve) {
        if sourceView.isHidden == false {
            UIView.transition(with: sourceView, duration: duration, options: transitionOptions, animations: {
                sourceView.isHidden = true
            })
        }

        if destinationView.isHidden {
            UIView.transition(with: destinationView, duration: duration, options: transitionOptions, animations: {
                destinationView.isHidden = false
            })
        }
    }

    static func switchState(
            views: [UIView],
            to targetView: UIView,
            duration: Double = 0.5,
            transitionOptions: UIView.AnimationOptions = .transitionCrossDissolve) {

        for view in views {
            if targetView != view && view.isHidden == false {
                UIView.transition(
                        with: view,
                        duration: duration,
                        options: transitionOptions,
                        animations: {
                            view.isHidden = true
                        })
            } else if targetView == view {
                UIView.transition(
                        with: targetView,
                        duration: duration,
                        options: transitionOptions,
                        animations: {
                            view.isHidden = false
                        })
            }
        }
    }
}
