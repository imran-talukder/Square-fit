//
//  Protocols.swift
//  Collection View
//
//  Created by Appnap WS01 on 8/11/20.
//

import UIKit


protocol MainPanelCollectionViewDelegate: class {
    func send_data_from_mainPanel_To_EditVC(index: Int)
    func send_data_from_canvasPanel_To_EditVC(index: Int)
    func send_data_from_cropPanel_To_EditVC(index: Int)
    func send_data_from_stylePanel_To_EditVC(index: Int)
    func send_data_from_filterPanel_To_EditVC(index: Int)
    func send_data_from_presetPanel_To_EditVC(index: Int)
    func send_data_from_framePanel_To_EditVC(index: Int)
    func send_data_from_borderPanel_To_EditVC(index: Int)
    func send_data_from_shapePanel_To_EditVC(index: Int)
    func send_data_from_colorPanel_To_EditVC(index: Int)
    func send_data_from_drawPanel_To_EditVC(index: Int)
    func send_data_from_stickerPanel_To_EditVC(index: Int)
    func send_data_from_editPanel_To_EditVC(index: Int)
    
}

protocol TextPanelViewDelegate {
    func send_data_from_textPanel_To_EditVC(title: String)
    func send_data_from_textPanelShadowView_To_EditVC(slider: UISlider, event: UIEvent)
    func send_data_from_textPanelColorView_To_EditVC(colorIndex: Int, For: String, colorAlpha: Float)
}
