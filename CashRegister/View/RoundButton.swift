//
//  RoundButton.swift
//  CashRegister
//
//  Created by user193216 on 10/23/21.
//

import UIKit

class RoundButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override
    init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        layer.cornerRadius = layer.frame.height/2
        layer.cornerRadius = 20;
    }
    
}
