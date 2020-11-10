//
//  TextPanelView.swift
//  Collection View
//
//  Created by Appnap WS01 on 9/11/20.
//

import UIKit

class TextPanelBaseView: UIView {
    var topParentStack: UIStackView!
    var buttonStack: UIStackView!
    var layerStack: UIStackView!
    var delegate: TextPanelBaseViewDelegate?
    //MARK: - buttons
    var newButton: UIButton = UIButton()
    var colorButton: UIButton = UIButton()
    var shadowButton: UIButton = UIButton()
    
    var textBoldButton: UIButton = UIButton()
    var textItalicButton: UIButton = UIButton()
    var textAlighmentButton: UIButton = UIButton()
    
    var backButton: UIButton = UIButton()
    var pickerButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: - functions
    
    func commonInit() {
        
        topParentStack = UIStackView()
        buttonStack = UIStackView()
        layerStack = UIStackView()
        setButtonStack()
        setLayerStack()
        topParentStack = UIStackView(arrangedSubviews: [buttonStack, layerStack])
        topParentStack.axis = .horizontal
        topParentStack.distribution = .fill
        topParentStack.alignment = .center
        topParentStack.spacing = 30
        topParentStack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(topParentStack)
        addSubview(backButton)
        addSubview(pickerButton)
        
        //MARK: - top parentStack setup
        topParentStack.translatesAutoresizingMaskIntoConstraints = false
        topParentStack.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: self.frame.height * 0.23809)
        
        //MARK: - back button setup
        
        backButton.setImage(UIImage(named: "Back-1"), for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.08252800256, green: 0.08185724169, blue: 0.1206081882, alpha: 1)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.44).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.topAnchor.constraint(equalTo: topParentStack.bottomAnchor, constant: 12).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        
        //MARK: - picker button setup
        pickerButton.layer.cornerRadius = 8
        pickerButton.setTitle("   Butler Bold", for: .normal)
        pickerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)  //
        pickerButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        pickerButton.setBackgroundImage(UIImage(named: "PickerButtonImage"), for: .normal)
        pickerButton.backgroundColor = #colorLiteral(red: 0.08252800256, green: 0.08185724169, blue: 0.1206081882, alpha: 1)
        pickerButton.translatesAutoresizingMaskIntoConstraints = false
        pickerButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2738).isActive = true
        pickerButton.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 20).isActive = true
        pickerButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        pickerButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        
        //MARK: - buttons target actions
        
        backButton.addTarget(self, action: #selector(handleBackTappedInToolBar), for: .touchUpInside)
        shadowButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        colorButton.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        
        
    }
    @objc func buttonTapped(_ button: UIButton) {
        print("shadow 1st tapped")
        delegate?.send_data_from_textPanel_To_EditVC(title: button.currentTitle!)
        print(button.tag)
    }
    
    @objc func handleBackTappedInToolBar(){
        self.animHide(duration: 0.3)
    }
    
    
    func setButtonStack() {
        setButtons(button: newButton, title: "    New")
        setButtons(button: colorButton, title: "Color")
        setButtons(button: shadowButton, title: "Shadow    ")
        buttonStack = UIStackView(arrangedSubviews: [newButton, colorButton, shadowButton])
        
        buttonStack.axis = .horizontal
        buttonStack.distribution = .equalSpacing
        buttonStack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        buttonStack.alignment = .center
        buttonStack.backgroundColor = UIColor(hexString: "#2a2a37")
        buttonStack.layer.cornerRadius = 8

    }
    func setLayerStack() {
        setLayerButtons(layer: textBoldButton, image: UIImage(named: "Bold")!)
        setLayerButtons(layer: textItalicButton, image: UIImage(named: "Italic")!)
        setLayerButtons(layer: textAlighmentButton, image: UIImage(named: "Leftalign")!)
        layerStack = UIStackView(arrangedSubviews: [textBoldButton, textItalicButton, textAlighmentButton])
        
        layerStack.axis = .horizontal
        layerStack.distribution = .fillEqually
        layerStack.alignment = .fill
        layerStack.spacing = 30
        layerStack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        layerStack.backgroundColor = .clear
    }
    
    
    func setButtons(button: UIButton, title: String) {
        button.backgroundColor = .clear
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.titleLabel?.font = UIFont(name: "KumbhSans-Bold", size: 16)
    }
    
    func setLayerButtons(layer: UIButton, image: UIImage) {
        layer.backgroundColor = .clear
        layer.setImage(image, for: .normal)
    }
}
