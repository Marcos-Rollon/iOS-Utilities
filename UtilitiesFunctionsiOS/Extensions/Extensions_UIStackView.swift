//
//  Extensions_UIStackView.swift
//
//  Created by Marcos Rollón Rivas on 17/5/19.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import Foundation
import UIKit

public extension UIStackView {
    
    /// SwifterSwift: Initialize an UIStackView with an array of UIView and common parameters.
    ///
    ///     let stackView = UIStackView(arrangedSubviews: [UIView(), UIView()], axis: .vertical)
    ///
    /// - Parameters:
    ///   - arrangedSubviews: The UIViews to add to the stack.
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.(default: 0.0)
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis. (default: .fill)
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.(default: .fill)
    convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {
        
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    /// SwifterSwift: Adds array of views to the end of the arrangedSubviews array.
    ///
    /// - Parameter views: views array.
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
    /// SwifterSwift: Removes all views in stack’s array of arranged subviews.
    func removeArrangedSubviews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
        }
    }
    
}
