//
//  ViewCollectionView.swift
//  Collection View
//
//  Created by Appnap WS01 on 5/11/20.
//

import UIKit




class MainPanelCollectionView: UIView{
    let mainPanelIconImageNameArray: [String] = ["New", "Canvas", "Crop", "Style", "Filter", "Preset", "Frame", "Border", "Shape", "Color", "Text", "Draw", "Sticker", "Edit"]
    var mainPanelCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    weak var delegate: MainPanelCollectionViewDelegate?
    
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
        
        if let flowLayout = mainPanelCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 15
        }
        
        mainPanelCollectionView.register(MainPanelcollectionViewCell.self, forCellWithReuseIdentifier: "mainCell")
        addSubview(mainPanelCollectionView)
    
        
        //MARK: Setup Main CollectionView
        mainPanelCollectionView.backgroundColor = .black
        mainPanelCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainPanelCollectionView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        mainPanelCollectionView.delegate = self
        mainPanelCollectionView.dataSource = self
        
    }
    
 
}

extension MainPanelCollectionView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainPanelIconImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainPanelcollectionViewCell
        cell.ImageToTap.image = UIImage(named: mainPanelIconImageNameArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.mainPanelCollectionView.frame.height
        let width = (self.mainPanelCollectionView.frame.width/4.55)-10
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.send_data_from_mainPanel_To_EditVC(index: indexPath.row)
    }
}




