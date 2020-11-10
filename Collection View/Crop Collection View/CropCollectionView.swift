//
//  CropCollectionView.swift
//  Collection View
//
//  Created by Appnap WS01 on 8/11/20.
//

import UIKit

class CropCollectionView: UIView {

    //MARK: - properties
    
    let cropImageNameArray: [String] = ["New", "Filter", "Shape", "Style", "Filter", "Preset", "Frame", "Border", "Shape", "Color", "Text", "Draw", "Sticker", "Edit"]
    var cropCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var backButton: UIButton = UIButton()
    var delegate: MainPanelCollectionViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit() {
        self.backgroundColor = UIColor.clear
        
        if let flowLayout = cropCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 15
        }
        
        cropCollectionView.register(CropCollectionViewCell.self, forCellWithReuseIdentifier: "cropCell")
        addSubview(backButton)
        addSubview(cropCollectionView)
    
        //MARK: - back button setup

        backButton.setImage(UIImage(named: "Back-1"), for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.08252800256, green: 0.08185724169, blue: 0.1206081882, alpha: 1)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        backButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.addTarget(self, action: #selector(handleBackTappedInToolBar), for: .touchUpInside)
        
        //MARK: - crop view setup
        
        cropCollectionView.backgroundColor = .clear
        cropCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cropCollectionView.anchor(top: self.topAnchor, left: self.backButton.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        cropCollectionView.delegate = self
        cropCollectionView.dataSource = self
        
    }
    
    
    @objc func handleBackTappedInToolBar(){
        self.animHide(duration: 0.3)
    }
}

//MARK: - extension

extension CropCollectionView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cropImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cropCell", for: indexPath) as! CropCollectionViewCell
        cell.ImageToTap.image = UIImage(named: cropImageNameArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.cropCollectionView.frame.height
        let width = (self.cropCollectionView.frame.width/4)-10
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped \(indexPath.row)")
        delegate?.send_data_from_cropPanel_To_EditVC(index: indexPath.row)
        
    }
}


