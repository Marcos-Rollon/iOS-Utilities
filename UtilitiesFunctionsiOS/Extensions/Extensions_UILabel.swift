//
//  Extensions UILabel.swift
//
//  Created by Marcos Rollón Rivas on 5/3/19.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import UIKit

extension String {
    /// Returns the height of this string for a given width and font
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}

extension UILabel {
    /// Makes the text outlined
    func makeOutline(strokeColor : UIColor){
        let strokeAttributes = [NSAttributedString.Key.strokeColor : strokeColor,
        NSAttributedString.Key.strokeWidth : -4.0] as [NSAttributedString.Key : Any]
        
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeAttributes)
    }
}
