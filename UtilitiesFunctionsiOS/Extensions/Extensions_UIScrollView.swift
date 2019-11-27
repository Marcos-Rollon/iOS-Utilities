//
//  Extensions_UIScrollView.swift
//  BelieveApp
//
//  Created by Marcos Rollón Rivas on 03/09/2019.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    /// Bool flag that shows if is the scroll is on top
    var isAtTop: Bool {
        return contentOffset.y <= verticalOffsetForTop
    }
    
    /// Bool flag that shows if the scroll is at bottom
    var isAtBottom: Bool {
        return contentOffset.y >= verticalOffsetForBottom
    }
    
    /// Returns the vertical offset from the top
    var verticalOffsetForTop: CGFloat {
        let topInset = contentInset.top
        return -topInset
    }
    
    /// Returns the vertical offset from the bottom
    var verticalOffsetForBottom: CGFloat {
        let scrollViewHeight = bounds.height
        let scrollContentSizeHeight = contentSize.height
        let bottomInset = contentInset.bottom
        let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
        return scrollViewBottomOffset
    }
    
}
