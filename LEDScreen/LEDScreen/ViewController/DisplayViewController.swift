//
//  DisplayViewController.swift
//  LEDScreen
//
//  Created by Kay on 2022/11/19.
//

import UIKit

class DisplayViewController: UIViewController, LEDSettingDelegateProtocol {

    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.textFromPreviousVC = customLabel.text
            settingViewController.textColor = customLabel.textColor
            settingViewController.backGroundColor = backGroundView.backgroundColor!
        }
    }
    
    func settingApply(text: String, textColor: UIColor, backgroundColor: UIColor) {
        self.customLabel.text = text
        self.customLabel.textColor = textColor
        self.backGroundView.backgroundColor = backgroundColor
    }

}

