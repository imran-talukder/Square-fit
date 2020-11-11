//
//  Extensions.swift
//  Collection View
//
//  Created by Appnap WS01 on 8/11/20.
//

import UIKit


extension UIView {
    func anchor (top : NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor? , bottom : NSLayoutYAxisAnchor? , right : NSLayoutXAxisAnchor? , paddingTop : CGFloat , paddingLeft : CGFloat , paddingBottom : CGFloat , paddingRight : CGFloat , width : CGFloat , height : CGFloat){
            
            translatesAutoresizingMaskIntoConstraints = false
            
            if let top = top {
                self.topAnchor.constraint(equalTo: top , constant: paddingTop).isActive = true
            }
            if let left = left {
                self.leftAnchor.constraint(equalTo: left , constant: paddingLeft).isActive = true
            }
            if let bottom = bottom {
                self.bottomAnchor.constraint(equalTo: bottom , constant: -paddingBottom).isActive = true
            }
            if let right = right {
                self.rightAnchor.constraint(equalTo: right , constant: -paddingRight).isActive = true
            }
            if  width != 0 {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            if height != 0 {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
}


public extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3", "iPhone4,1":
            return "iPhone 4"

        case "iPhone5,1", "iPhone5,2", "iPhone5,3", "iPhone5,4", "iPhone6,1", "iPhone6,2", "iPhone8,4":
            return "iPhone 5"

        case "iPhone7,2", "iPhone8,1", "iPhone9,1", "iPhone9,3", "iPhone10,1", "iPhone10,4":
            return "iPhone 6,7,8"

        case "iPhone7,1", "iPhone8,2", "iPhone9,2", "iPhone9,4", "iPhone10,2", "iPhone10,5":
            return "iPhone Plus"

        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"

        case "i386", "x86_64":
            return "Simulator"
        default:
            return identifier
        }
    }
}


extension UIView{
    func animShow(duration: Float){
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(duration: Float){
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
}



extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
