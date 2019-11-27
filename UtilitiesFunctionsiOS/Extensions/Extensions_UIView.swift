//
//  Extensions UIView.swift
//
//  Created by Marcos Rollón Rivas on 26/2/19.
//  Copyright © 2019 Marcos Rollón Rivas. All rights reserved.
//

import UIKit

extension UIView {
    /// Anchors view to the given constraints. Nil or 0 values are ignored
    func anchor(top: NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor?, bottom : NSLayoutYAxisAnchor? , right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft : CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Pins to bottom right of a view with the given padding
    func pinToBottomRight(of view : UIView, horizontalPadding : CGFloat = 0, verticalPadding : CGFloat = 0){
        view.addSubview(self)
        self.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: verticalPadding, paddingLeft: horizontalPadding, paddingBottom: verticalPadding, paddingRight: horizontalPadding, width: 0, height: 0)
    }
    
    /// Pins to top and both sides of a view with the given padding. Accepts bool flag to pin to safe area of the view
    func pinToTopAndSides(of view: UIView, horizontalPadding : CGFloat = 0, verticalPadding : CGFloat = 0, pinToSafeArea : Bool = false){
        view.addSubview(self)
        if pinToSafeArea{
            self.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: verticalPadding, paddingLeft: horizontalPadding, paddingBottom: verticalPadding, paddingRight: horizontalPadding, width: 0, height: 0)
        } else {
            self.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: verticalPadding, paddingLeft: horizontalPadding, paddingBottom: verticalPadding, paddingRight: horizontalPadding, width: 0, height: 0)
        }
        
    }
    
    /// Pins to top and left side of a view with the given padding. Accepts bool flag to pin to safe area of the view
    func pinToTopLeft(of view : UIView, sidesPadding : CGFloat = 0, verticalPadding : CGFloat = 0, pinToSafeArea : Bool = false){
        view.addSubview(self)
        if pinToSafeArea{
            self.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: verticalPadding, paddingLeft: sidesPadding, paddingBottom: verticalPadding, paddingRight: sidesPadding, width: 0, height: 0)
        }else {
            self.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: verticalPadding, paddingLeft: sidesPadding, paddingBottom: verticalPadding, paddingRight: sidesPadding, width: 0, height: 0)
        }
    }
    
    /// Pins to top and right side of a view with the given padding. Accepts bool flag to pin to safe area of the view
    func pinToTopRight(of view : UIView, sidesPadding : CGFloat = 0, verticalPadding : CGFloat = 0, pinToSafeArea : Bool = false){
        view.addSubview(self)
        if pinToSafeArea{
            self.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: verticalPadding, paddingLeft: sidesPadding, paddingBottom: verticalPadding, paddingRight: sidesPadding, width: 0, height: 0)
        }else {
            self.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: verticalPadding, paddingLeft: sidesPadding, paddingBottom: verticalPadding, paddingRight: sidesPadding, width: 0, height: 0)
        }
    }
    
    /// Pins top to the bottom of the last subview of a given view and sides to the parent view
    func appendAtEnd(of view : UIView, padding : CGFloat){
        if let lastSub = view.subviews.last{
            view.addSubview(self)
            self.anchor(top: lastSub.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: padding, paddingRight: padding, width: 0, height: 0)
        } else{
            self.pinToTopAndSides(of: view, horizontalPadding: padding, verticalPadding : padding)
        }
    }
    
    /// Fills the view into the given view. Accepts padding (defaults to 0). Has bool flag to respect safe area
    func fill ( theView view : UIView, horizontalPadding : CGFloat = 0, verticalPadding : CGFloat = 0, shouldRespectSafeArea : Bool = false){
        view.addSubview(self)
        if shouldRespectSafeArea{
            self.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: verticalPadding, paddingLeft: horizontalPadding, paddingBottom: verticalPadding, paddingRight: horizontalPadding, width: 0, height: 0)
        }else {
            self.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: verticalPadding, paddingLeft: horizontalPadding, paddingBottom: verticalPadding, paddingRight: horizontalPadding, width: 0, height: 0)
        }
    }
    
    /// Adds and center the view into the given view.
    func center ( inView view : UIView){
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    /// Adds and centers the X position of the view into the given view.
    func centerX ( inView view : UIView, padding : CGFloat = 0){
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding).isActive = true
    }
    
    /// Adds and centers the Y position of the view into the given view.
    func centerY ( inView view : UIView, padding : CGFloat = 0){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding).isActive = true
    }
    
    /// Sets the height of the view to an absolute value. Optionally accepts the priority
    func height(_ constant : CGFloat, priority : UILayoutPriority? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        let const = self.heightAnchor.constraint(equalToConstant: constant)
        if let priority = priority{
            const.priority = priority
        }
        const.isActive = true
    }
    
    /// Sets the height of the view to equal another layout dimension. Views should be on the same hierarchy
    func height (equalTo dimension : NSLayoutDimension, multiplier : CGFloat = 0, constant : CGFloat = 0 ){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: dimension, multiplier: 1.0, constant: constant).isActive = true
    }
    
    /// Sets the width of the view to an absolute value. Optionally accepts the priority
    func width(_ constant : CGFloat, priority : UILayoutPriority? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    /// Sets the width of the view to equal another layout dimension. Views should be on the same hierarchy
    func width (equalTo dimension : NSLayoutDimension, multiplier : CGFloat = 0, constant : CGFloat = 0 ){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: dimension, multiplier: 1.0, constant: constant).isActive = true
    }
    
    ///Animate the view with a shake effect and adds a border color
    static func shake(view: UIView, for duration: TimeInterval = 0.5, withTranslation translation: CGFloat = 10) {
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.3) {
            view.layer.borderColor = UIColor.googleRed().cgColor
            view.layer.borderWidth = 1
            view.transform = CGAffineTransform(translationX: translation, y: 0)
        }
        
        propertyAnimator.addAnimations({
            view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, delayFactor: 0.2)
        
        propertyAnimator.addCompletion { (_) in
            view.layer.borderWidth = 0
        }
        
        propertyAnimator.startAnimation()
    }
    
    /// Animates the "isHidden" property
    func isHiddenAnimated(value: Bool, duration: Double = 0.2) {
        UIView.animate(withDuration: duration) { [weak self] in self?.isHidden = value }
    }
    
    /// Creates an empty transparent view of a given height. Usefull for whitespacing
    static func createEmptyView(ofHeight height : CGFloat) -> UIView{
        let view = UIView()
        view.backgroundColor = .clear
        view.height(height)
        return view
    }
}
