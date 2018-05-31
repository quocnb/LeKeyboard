//
//  ShapeButton.swift
//  LeKeyboard
//
//  Created by Quoc Nguyen on 2018/05/30.
//  Copyright © 2018 Quoc Nguyen. All rights reserved.
//

import UIKit

class ShapeButton: UIButton {

    var defaultBackgroundColor: UIColor = .white
    var highlightBackgroundColor: UIColor = .lightGray

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = isHighlighted ? highlightBackgroundColor : defaultBackgroundColor
    }
}

// MARK: - Private Methods
private extension ShapeButton {
    func commonInit() {
        self.tintColor = UIColor.darkText
        self.titleLabel?.textColor = UIColor.darkText
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.35
        layer.shadowColor = UIColor.darkGray.cgColor
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.2
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}
