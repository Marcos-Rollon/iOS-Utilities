//
//  SimpleAlert.swift
//
//  Created by Marcos Rollón Rivas on 19/11/2019.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import UIKit

/// Collection of methods to create alerts with as little boilerplate as possible
struct SimpleAlert {
    // Dont allow init on this struct
    private init (){}
    /// Creates a simple alert to display a message, with just one button action that dismisses it
    static func create(title : String, content : String, buttonText : String = "OK") -> UIAlertController{
        let alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        return alert
    }
}
