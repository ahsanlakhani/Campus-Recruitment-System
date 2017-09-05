//
//  UnderlinedTextField.swift
//  Flex Frame
//
//  Created by Furqan M Khan on 5/31/16.
//  Copyright © 2016 Furqan M Khan. All rights reserved.
//

import UIKit

@IBDesignable
class UnderlinedTextField: UITextField {
    
    @IBInspectable var width: CGFloat = 1.0
    @IBInspectable var color: UIColor = UIColor.whiteColor()
    @IBInspectable var placeholderColor: UIColor = UIColor.whiteColor()
    @IBInspectable var icon:UIImage?
    @IBInspectable var iconIndent:Int=0
    @IBInspectable var icony:CGFloat=0
    @IBInspectable var indentation:CGFloat=20
    
    override func drawRect(rect: CGRect) {
        let underline = CALayer()
        underline.borderColor = color.CGColor
        underline.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        underline.borderWidth = width
        self.layer.addSublayer(underline)
        self.layer.masksToBounds = true
        
        if(self.attributedPlaceholder?.string != nil){
            let placholderString = NSMutableAttributedString(string: self.attributedPlaceholder!.string, attributes: [NSForegroundColorAttributeName:placeholderColor])
            self.attributedPlaceholder = placholderString
        }
        
        if(icon != nil){
            if(iconIndent>0){
                let imageView = UIImageView(frame: CGRect(x: iconIndent, y: 0, width: 20, height: 20))
                imageView.center.y=self.icony
                imageView.contentMode=UIViewContentMode.ScaleAspectFit
                imageView.image = icon?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
                self.addSubview(imageView)
                print(imageView.frame)
            }
            else{
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.contentMode=UIViewContentMode.ScaleAspectFit
                imageView.image = icon?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
                self.leftView = imageView
                self.leftViewMode = UITextFieldViewMode.Always
                self.addSubview(imageView)
            }
        }
        
    }
    
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRect(x: indentation, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRect(x: indentation, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    

}
