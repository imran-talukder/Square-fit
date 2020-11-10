//
//  CanvasCollectionViewCell.swift
//  Collection View
//
//  Created by Appnap WS01 on 8/11/20.
//

import UIKit

class CanvasCollectionViewCell: UICollectionViewCell {
    let ImageToTap : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        self.backgroundColor = .clear
        addSubview(ImageToTap)

        ImageToTap.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        ImageToTap.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        ImageToTap.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.63).isActive = true
        ImageToTap.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ImageToTap.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


