//
//  TextPanelColorView.swift
//  Collection View
//
//  Created by Appnap WS01 on 10/11/20.
//

import UIKit

class TextPanelColorView: UIView {

    var textButton: UIButton = UIButton()
    var backgroundButton: UIButton = UIButton()
    var slider: CustomSlider = CustomSlider()
    var backButton: UIButton = UIButton()
    
    override func layoutSubviews() {
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func commonInit() {
        
        //MARK: - background button setup
        addSubview(backgroundButton)
        backgroundButton.setTitle("Background", for: .normal)
        backgroundButton.titleLabel?.font = UIFont(name: "KumbhSans-Bold", size: 12)
        backgroundButton.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundButton.anchor(top: self.topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: self.frame.height * 0.152, paddingLeft: 0, paddingBottom: 0, paddingRight: 21, width: 70, height: 35)
        //backgroundButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.3).isActive = true
        
        //MARK: - text button setup
        addSubview(textButton)
        textButton.setTitle("Text", for: .normal)
        textButton.setTitleColor(UIColor(hexString: "#ffda18"), for: .normal)
        textButton.layer.cornerRadius = 12
        textButton.backgroundColor = UIColor(hexString: "#15151f")
        textButton.titleLabel?.font = UIFont(name: "KumbhSans-Bold", size: 12)
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.anchor(top: nil, left: nil, bottom: nil, right: backgroundButton.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 24, width: 52, height: 28)
        textButton.centerYAnchor.constraint(equalTo: backgroundButton.centerYAnchor).isActive = true
        
        //MARK: - slider setup
        addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 72
        slider.tintColor = UIColor(hexString: "#ffda18")
        slider.maximumTrackTintColor = .white
        slider.setThumbImage(UIImage(named: "Thumb"), for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22).isActive = true
        slider.rightAnchor.constraint(equalTo: textButton.leftAnchor, constant: -36).isActive = true
        slider.centerYAnchor.constraint(equalTo: textButton.centerYAnchor).isActive = true
        
        //MARK: - back button setup
        addSubview(backButton)
        backButton.setImage(UIImage(named: "Back-2"), for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.08252800256, green: 0.08185724169, blue: 0.1206081882, alpha: 1)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4071).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 16).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        
        //MARK: - action functions
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc func backButtonTapped() {
        self.animHide(duration: 0.3)
    }
    
    
}
