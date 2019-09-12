//
//  AutoLayoutViewController.swift
//  AutoLayout
//
//  Created by Alex Davis on 9/11/19.
//  Copyright © 2019 Alex Davis. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    let SubButton = UIButton(type: .custom)
    let textFieldFName = UITextField(frame: .zero)
    let textFieldLName = UITextField(frame: .zero)
    var imageView = UIImageView()
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldFName.borderStyle = .roundedRect
        textFieldFName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldFName)
        view.addConstraints(generateConstraintsTextFieldFName())
        
        textFieldLName.borderStyle = .roundedRect
        textFieldLName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldLName)
        view.addConstraints(generateConstraintsTextFieldLName())
        
        SubButton.setTitle("Submit", for: .normal)
        SubButton.setTitleColor(.black, for: .normal)
        SubButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SubButton)
        view.addConstraints(generateConstraintsSubButton())
        
        imageView.image = UIImage(named: "Sign-Up-Now-Icon.png")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20.0)
        
        trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20.0)
        
        topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: SubButton, attribute: .top, multiplier: 1.0, constant: 20.0)
        
        bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -20.0)
        
        leadingConstraint?.isActive = true
        trailingConstraint?.isActive = true
        topConstraint?.isActive = true
        bottomConstraint?.isActive = true
    }
    
    private func generateConstraintsTextFieldFName() -> [NSLayoutConstraint] {
       
        let constraintTop = NSLayoutConstraint(item: textFieldFName,  attribute: .top,  relatedBy: .equal,  toItem: topLayoutGuide, attribute: .top, multiplier: 1.0, constant: 28.0)
        
        let constraintX = NSLayoutConstraint(item: textFieldFName, attribute: .centerX, relatedBy: .equal,  toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        let constraintWidth = NSLayoutConstraint(item: textFieldFName, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
        
        return [constraintTop, constraintX, constraintWidth]
    }
    
    private func generateConstraintsTextFieldLName() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: textFieldLName, attribute: .top, relatedBy: .equal, toItem: textFieldFName, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let constraintLeading = NSLayoutConstraint(item: textFieldLName, attribute: .leading, relatedBy: .equal, toItem: textFieldFName, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let constraintTrailing = NSLayoutConstraint(item: textFieldLName, attribute: .trailing, relatedBy: .equal, toItem: textFieldFName, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        
        return [constraintTop, constraintLeading, constraintTrailing]
    }
    
    private func generateConstraintsSubButton() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: SubButton, attribute: .top, relatedBy: .equal, toItem: textFieldLName, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let constraintX = NSLayoutConstraint(item: SubButton, attribute: .centerX, relatedBy: .equal, toItem: textFieldLName, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        return [constraintTop, constraintX]
    }
}
