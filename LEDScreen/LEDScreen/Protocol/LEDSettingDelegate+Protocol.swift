//
//  LEDSettingDelegate+Protocol.swift
//  LEDScreen
//
//  Created by Kay on 2022/11/19.
//

import UIKit

protocol LEDSettingDelegateProtocol: AnyObject {
    func settingApply(text: String, textColor: UIColor, backgroundColor: UIColor)
}
