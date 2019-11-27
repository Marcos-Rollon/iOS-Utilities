//
//  Extensions_UICollectionView.swift
//
//  Created by Marcos Rollón Rivas on 10/5/19.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    
    /// Adds a label to the collection view, usefull when is empty. Should use the "restore" function to delete it.
    func setEmptyMessage ( _ message : String){
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    /// Adds the given view as background view to the collection view, usefull when is empty. Should use the "restore" function to delete it.
    func setEmptyView ( view : UIView){
        self.backgroundView = view
    }
    
    /// Reset the background/empty view
    func restore (){
        self.backgroundView = nil
    }
}
