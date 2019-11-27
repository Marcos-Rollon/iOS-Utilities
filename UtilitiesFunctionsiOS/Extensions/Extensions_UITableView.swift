//
//  Extensions_UITableView.swift
//
//  Created by Marcos Rollón Rivas on 16/08/2019.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    /// Adds the given view as background view to the table view, usefull when is empty. Should use the "restore" function to delete it.
    func setEmptyView(message : String){
        let emptyView = UIView()
        
        let messageLabel = NotesLabel(type: .subtitle, text: message, fontSize: 22, aligment: .center, maxLineNumber: 0)

        emptyView.addSubview(messageLabel)
        messageLabel.center(inView: emptyView)

        self.backgroundView = emptyView
    }
    
    /// Restores the background/empty view 
    func restore(){
        self.backgroundView = nil
    }
}
