//
//  SettingViewController.swift
//  LEDScreen
//
//  Created by Kay on 2022/11/19.
//

import UIKit

class SettingViewController: UIViewController {

    weak var delegate: LEDSettingDelegateProtocol?
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var textFromPreviousVC: String?
    var textColor: UIColor = .yellow
    var backGroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePreviousSetting()
    }
    
    private func configurePreviousSetting() {
        if let textFromPreviousVC = textFromPreviousVC {
            textfield.text = textFromPreviousVC
        }
        changeTextColor(textColor)
        changeBackgroundColor(backGroundColor)
    }
    
    
    @IBAction func tapTextColorSetting(_ sender: UIButton) {
        var color: UIColor = .white
        if sender == self.yellowButton {
            color = .yellow
        } else if sender == self.purpleButton {
            color = .purple
        } else {
            color = .green
        }
        textColor = color
        changeTextColor(color)
    }
    
    
    @IBAction func tapBackgroundColorSetting(_ sender: UIButton) {
        var color: UIColor = .white
        if sender == self.blackButton {
            color = .black
        } else if sender == self.blueButton {
            color = .blue
        } else {
            color = .orange
        }
        backGroundColor = color
        changeBackgroundColor(color)
    }
    
    private func changeTextColor(_ selectedColor: UIColor) {
        self.yellowButton.alpha = selectedColor == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = selectedColor == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = selectedColor == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(_ selectedColor: UIColor) {
        self.blackButton.alpha = selectedColor == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = selectedColor == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = selectedColor == UIColor.orange ? 1 : 0.2
    }
    
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.settingApply(text: textfield.text!, textColor: textColor, backgroundColor: backGroundColor)
        self.navigationController?.popViewController(animated: true)
    }
}
