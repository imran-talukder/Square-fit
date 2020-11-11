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
    var delegate: TextPanelViewDelegate?
    let colorNameArray: [String] = ["Color-1", "Color-2", "Color-3", "Color-4", "Color-5", "Color-6", "Color-7",
                                    "Color-8", "Color-9", "Color-10", "Color-11", "Color-12", "Color-13", "Color-14",
                                    "Color-15", "Color-16", "Color-17", "Color-18", "Color-19", "Color-20", "Color-21",
                                    "Color-22", "Color-23", "Color-24", "Color-25", "Color-26", "Color-27", "Color-28"]
    var indexTapped: Int? = nil
    var colorCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var buttonStage = "Text"
    var colorAlpha: Float = 0.72
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        //MARK: - background button setup
        addSubview(backgroundButton)
        backgroundButton.setTitle("Background", for: .normal)
        backgroundButton.titleLabel?.font = UIFont(name: "KumbhSans-Bold", size: 12)
        backgroundButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 21, width: 70, height: 35)
       
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
        slider.maximumValue = 1
        slider.value = 0.72
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
        backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        
        //MARK: - color collection view setup
        
        if let flowLayout = colorCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 8
        }
        
        addSubview(colorCollectionView)
        colorCollectionView.register(TextPanelColorCollectionViewCell.self, forCellWithReuseIdentifier: "colorCell")
        colorCollectionView.backgroundColor = .clear
        colorCollectionView.translatesAutoresizingMaskIntoConstraints = false
        colorCollectionView.anchor(top: nil, left: self.backButton.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        colorCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.32335).isActive = true
        colorCollectionView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        
        
        //MARK: - action functions
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        textButton.addTarget(self, action: #selector(textButtonTapped(_ :)), for: .touchUpInside)
        backgroundButton.addTarget(self, action: #selector(textButtonTapped(_ :)), for: .touchUpInside)
        slider.addTarget(self, action: #selector(sliderValueChanged(_ :)), for: .valueChanged)
    }
    @objc func backButtonTapped() {
        self.animHide(duration: 0.3)
    }
    @objc func sliderValueChanged(_ sender: UISlider) {
        colorAlpha = sender.value
        indexTapped = nil
        colorCollectionView.reloadData()
    }
    @objc func textButtonTapped(_ sender: UIButton) {
        buttonStage = sender.currentTitle!
        indexTapped = nil
        if buttonStage == "Text" {
            textButton.setTitleColor(UIColor(hexString: "#ffda18"), for: .normal)
            backgroundButton.setTitleColor(.white, for: .normal)
        }
        else {
            backgroundButton.setTitleColor(UIColor(hexString: "#ffda18"), for: .normal)
            textButton.setTitleColor(.white, for: .normal)
        }
        colorCollectionView.reloadData()
    }
    
}


//MARK: - color cllection view cell

class TextPanelColorCollectionViewCell: UICollectionViewCell {
    let ImageToTap : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        self.backgroundColor = .clear
        addSubview(ImageToTap)

        ImageToTap.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
        ImageToTap.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - color collection view data source

extension TextPanelColorView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! TextPanelColorCollectionViewCell
        cell.ImageToTap.image = UIImage(named: colorNameArray[indexPath.row])
        if indexPath.row == indexTapped {
            cell.layer.borderWidth = 2.0
            cell.layer.borderColor = UIColor(hexString: "#ffda18").cgColor
            cell.layer.cornerRadius = 7
        }else{
            cell.layer.borderWidth = 0.0
            cell.layer.borderColor = UIColor(hexString: "#ffda18").cgColor
            cell.layer.cornerRadius = 7
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.colorCollectionView.frame.height
        let width = (self.colorCollectionView.frame.width/8.2)-5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexTapped = indexPath.row
        DispatchQueue.main.async {
            self.colorCollectionView.reloadData()
        }
        delegate?.send_data_from_textPanelColorView_To_EditVC(colorIndex: indexTapped!, For: buttonStage, colorAlpha: colorAlpha)
    }
    
}
