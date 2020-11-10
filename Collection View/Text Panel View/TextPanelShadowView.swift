//
//  TextShadowView.swift
//  Collection View
//
//  Created by Appnap WS01 on 10/11/20.
//

import UIKit

class TextPanelShadowView: UIView {
    //MARK: - Properties
    var backButton: UIButton = UIButton()
    var shadowSlider: UISlider = CustomSlider()
    var sliderPercentage: UILabel = UILabel()
    var textPanelBaseDelegate: TextPanelBaseViewDelegate?
    var shadowDelegate: TextPanelShadowDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        //MARK: - back button setup
        addSubview(backButton)
        backButton.setImage(UIImage(named: "Back-2"), for: .normal)
        backButton.backgroundColor = UIColor(hexString: "#15151f")
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.60714).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        backButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        //MARK: - slider percentage label setup
        addSubview(sliderPercentage)
        sliderPercentage.text = "72%"
        sliderPercentage.font = UIFont(name: "KumbhSans-Bold", size: 11)
        sliderPercentage.textColor = .white
        sliderPercentage.translatesAutoresizingMaskIntoConstraints = false
        sliderPercentage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        sliderPercentage.heightAnchor.constraint(equalToConstant: 14).isActive = true
        sliderPercentage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        sliderPercentage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        //MARK: - Slider setup
        addSubview(shadowSlider)
        
        
        shadowSlider.minimumValue = 0
        shadowSlider.maximumValue = 100
        shadowSlider.value = 72
        
        shadowSlider.tintColor = UIColor(hexString: "#ffda18")
        shadowSlider.maximumTrackTintColor = .white
        shadowSlider.setThumbImage(UIImage(named: "Thumb"), for: .normal)
        shadowSlider.translatesAutoresizingMaskIntoConstraints = false
        
        
        shadowSlider.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 38).isActive = true
        shadowSlider.rightAnchor.constraint(equalTo: sliderPercentage.leftAnchor, constant: -11).isActive = true
        shadowSlider.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        shadowSlider.addTarget(self, action: #selector(sliderEditing), for: .valueChanged)
        
        
    }
    
    //MARK: - Actions
    @objc func sliderEditing(slider: UISlider, event: UIEvent) {
        sliderPercentage.text = "\(Int(shadowSlider.value))%"
        shadowDelegate?.send_data_from_textPanelShadowView_To_EditVC(slider: slider, event: event)
    }
    
    
    
    @objc func backButtonTapped() {
        self.isHidden = true
        textPanelBaseDelegate?.send_data_from_textPanel_To_EditVC(title: "Back")
    }  
}

class CustomSlider: UISlider {
   let trackHeight: CGFloat = 3
   override func trackRect(forBounds bounds: CGRect) -> CGRect {
      let track = super.trackRect(forBounds: bounds)
      return CGRect(x: track.origin.x, y: track.origin.y, width: track.width, height: trackHeight)
   }
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
}
