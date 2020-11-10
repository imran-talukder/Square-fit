//
//  ViewController.swift
//  Collection View
//
//  Created by Appnap WS01 on 5/11/20.
//

import UIKit

class ViewController: UIViewController{
    
//MARK: - properties
    
    @IBOutlet weak var bottomNotchControlHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomNotchView: UIView!
    
    let tabBarView : MainPanelCollectionView = {
        let view = MainPanelCollectionView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    let canvasTabBarView: CanvasCollectionView = {
        let view = CanvasCollectionView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    let cropTabBarView: CropCollectionView = {
        let view = CropCollectionView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    //MARK: - text-panel-view
    
    let textTabBarView: TextPanelBaseView = {
        let view = TextPanelBaseView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    let textPanelShadowView: TextPanelShadowView = {
        let view = TextPanelShadowView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
    let textPanelColorView: TextPanelColorView = {
        let view = TextPanelColorView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return view
    }()
    
      
//MARK: - viewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notchCheck()
        showMainPanelView()
        showCanvasPanelView()
        canvasTabBarView.animShow(duration: 0.05)
        canvasTabBarView.animHide(duration: 0.05)
        
    }
    
//MARK: - functions
    
    func showMainPanelView() {
            view.addSubview(tabBarView)
            tabBarView.delegate = self
            tabBarView.anchor(top: nil, left: self.view.leftAnchor, bottom: bottomNotchView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: 0, height: view.frame.height * 0.12)
            
    }
    
    func showCanvasPanelView() {
        view.addSubview(canvasTabBarView)
        view.bringSubviewToFront(canvasTabBarView)
        canvasTabBarView.anchor(top: nil, left: self.view.leftAnchor, bottom: bottomNotchView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: 0, height: view.frame.height * 0.12)
        canvasTabBarView.animShow(duration: 0.3)
    }
    func showCropPanelView() {
        view.addSubview(cropTabBarView)
        view.bringSubviewToFront(cropTabBarView)
        cropTabBarView.anchor(top: nil, left: self.view.leftAnchor, bottom: bottomNotchView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: 0, height: view.frame.height * 0.12)
        cropTabBarView.animShow(duration: 0.3)
    }
    
    //MARK: - Text Panel Views Functions
    
    func showTextPanelBaseView() {
        view.addSubview(textTabBarView)
        textTabBarView.delegate = self
        view.bringSubviewToFront(textTabBarView)
        textTabBarView.anchor(top: nil, left: self.view.leftAnchor, bottom: bottomNotchView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: 0, height: view.frame.height * 0.1875)
        textTabBarView.animShow(duration: 0.3)
    }
    
    func showTextPanelShadowView() {
        textTabBarView.isHidden = true
        view.addSubview(textPanelShadowView)
        textPanelShadowView.textPanelBaseDelegate = self
        textPanelShadowView.shadowDelegate = self
        view.bringSubviewToFront(textPanelShadowView)
        textPanelShadowView.anchor(top: nil, left: self.view.leftAnchor, bottom: bottomNotchView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: 0, height: view.frame.height * 0.125)
        textPanelShadowView.animShow(duration: 0.3)
        
    }
    
    func showTextPanelColorView() {
        view.addSubview(textPanelColorView)
        view.bringSubviewToFront(textPanelColorView)
        textPanelColorView.anchor(top: nil, left: self.view.leftAnchor, bottom: bottomNotchView.topAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 , width: 0, height: view.frame.height * 0.1875)
        textPanelColorView.animShow(duration: 0.3)
    }
    

    
    func notchCheck() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                bottomNotchControlHeightConstraint.constant = 0
                
            case 1334:
                print("iPhone 6/6S/7/8")
                bottomNotchControlHeightConstraint.constant = 0
                
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                
                
            case 2436:
                print("iPhone X/XS/11 Pro")
                
            case 2688:
                print("iPhone XS Max/11 Pro Max")
                
            case 1792:
                print("iPhone XR/ 11 ")
                
            default:
                print("Unknown")
            }
        }
    }
    
}

extension ViewController: MainPanelCollectionViewDelegate {
    func send_data_from_mainPanel_To_EditVC(index: Int) {
        switch index {
        case 0:
            print("nothing will goes here")
        case 1:
            self.showCanvasPanelView()
        case 2:
            self.showCropPanelView()
        case 3:
            print("nothing will goes here")
        case 10:
            self.showTextPanelBaseView()
            print("text panel view loaded")
            
        default:
            print("Hey")
        }
        
    }
    func send_data_from_canvasPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_cropPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_stylePanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_filterPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_presetPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_framePanel_To_EditVC(index: Int) {   // // ["New", "Canvas", "Crop", "Style", "Filter", "Preset", "Frame", "Border", "Shape", "Color", "Text", "Draw", "Sticker", "Edit"]
        
    }
    
    func send_data_from_borderPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_shapePanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_colorPanel_To_EditVC(index: Int) {
        
    }
    func send_data_from_drawPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_stickerPanel_To_EditVC(index: Int) {
        
    }
    
    func send_data_from_editPanel_To_EditVC(index: Int) {
        
    }

}

extension ViewController: TextPanelBaseViewDelegate {
    
    func send_data_from_textPanel_To_EditVC(title: String) {
        switch title {
        case "    New":
            print("New button tapped")
        case "Color":
            self.showTextPanelColorView()
        case "Shadow    ":
            self.showTextPanelShadowView()
        case "Bold":
            print("Bold button tapped")
        case "Italic":
            print("Italic button tapped")
        case "Leftalign":
            print("Textalign button tapped")
        default:
            self.showTextPanelBaseView()
        }
    }
}

extension ViewController: TextPanelShadowDelegate {
    func send_data_from_textPanelShadowView_To_EditVC(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
                case .began:
                    print("started moving")
                case .moved:
                    print("Just moved the slider")
                case .ended:
                    print("Just ended slider editing")
                default:
                    break
            }
        }
    }
}








