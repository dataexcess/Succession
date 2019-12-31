//
//  Extensions.swift
//  innate
//
//  Created by Joeri Bultheel on 19/08/2019.
//  Copyright © 2019 dataexcess. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pinBottomTopLeftRight(toParentView superView:UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal,
                                     toItem: superView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                                        toItem: superView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal,
                                      toItem: superView, attribute: .left, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal,
                                       toItem: superView, attribute: .right, multiplier: 1.0, constant: 0)
        superView.addConstraints([top, bottom, left, right])
    }
    
    func pinLeftRight(toParentView superView:UIView, withPadding padding:Int) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .greaterThanOrEqual,
                                      toItem: superView, attribute: .left, multiplier: 1.0, constant: CGFloat(padding))
        let right = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .greaterThanOrEqual,
                                       toItem: superView, attribute: .right, multiplier: 1.0, constant: CGFloat(padding))
        superView.addConstraints([left, right])
    }
    
    func pinTopBottom(toParentView superView:UIView, withPadding padding:Int) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .greaterThanOrEqual,
                                      toItem: superView, attribute: .top, multiplier: 1.0, constant: CGFloat(padding))
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual,
                                       toItem: superView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(padding))
        superView.addConstraints([top, bottom])
    }
    
    func equalWidthAndHeight(toParentView superView:UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal,
                                       toItem: superView, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal,
                                        toItem: superView, attribute: .height, multiplier: 1.0, constant: 0)
        superView.addConstraints([width, height])
    }
    
    func equalHeight(toParentView superView:UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal,
                                        toItem: superView, attribute: .height, multiplier: 1.0, constant: 0)
        superView.addConstraint(height)
    }
    
    func equalWidth(toParentView superView:UIView, withRatio ratio:CGFloat = 1.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal,
                                       toItem: superView, attribute: .width, multiplier: ratio, constant: 0)
        superView.addConstraint(width)
    }
    
    func alignCenter(toParentView superView:UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal,
                                       toItem: superView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal,
                                        toItem: superView, attribute: .centerY, multiplier: 1.0, constant: 0)
        superView.addConstraints([centerX, centerY])
    }
    
    func setHeightEqualToWidth() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let ratio = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .greaterThanOrEqual,
                                         toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
        self.addConstraints([ratio])
    }
    
    func setWidthEqualToHeight() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let ratio = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .greaterThanOrEqual,
                                       toItem: self, attribute: .height, multiplier: 1.0, constant: 0)
        self.addConstraints([ratio])
    }
    
    func pinBottom(toParentView superView:UIView, withPadding padding:Int) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                                       toItem: superView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(padding))
        superView.addConstraints([bottom])
    }
    
    func alignCenterX(toParentView superView:UIView) {
         self.translatesAutoresizingMaskIntoConstraints = false
         let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal,
                                        toItem: superView, attribute: .centerX, multiplier: 1.0, constant: 0)
         superView.addConstraints([centerX])
    }
    
    func alignCenterY(toParentView superView:UIView, withOffset offset: Int) {
         self.translatesAutoresizingMaskIntoConstraints = false
         let centerY = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal,
                                          toItem: superView, attribute: .centerY, multiplier: 1.0, constant: CGFloat(offset))
         superView.addConstraints([centerY])
    }
}

extension String {
    
    mutating func convertSpecialCharacters() -> String {
         
        let char_dictionary = ["\"" : "",
                               "&amp;" : "&",
                               "&lt;" : "<",
                               "&gt;" : ">",
                               "&quot;" : "\"",
                               "&apos;" : "'"]
        for (escaped_char, unescaped_char) in char_dictionary {
            self = self.replacingOccurrences(of: escaped_char, with: unescaped_char, options: NSString.CompareOptions.literal, range: nil)
        }
        return self
    }
}

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

extension UIScrollView {
    
    func scrollToPage(withIndex index:Int, animated:Bool) {
        let offset = CGPoint(x: bounds.width * CGFloat(index), y: 0)
        setContentOffset(offset, animated: animated)
    }
    
    var pageControlIndex:Int {
        get {
            return Int( floor((contentOffset.x - frame.size.width / 2) / frame.size.width) + 1)
        }
        set { }
    }
}
