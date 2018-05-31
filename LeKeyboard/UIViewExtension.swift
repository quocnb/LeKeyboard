//
//  UIViewExtension.swift
//  ClothesMaker
//
//  Created by Quoc Nguyen on 1/17/18.
//  Copyright © 2018 Quoc Nguyen. All rights reserved.
//

import UIKit
import SnapKit
import LazySwifter

extension UIView {
    func addContentViewFromXib() {
        guard let content = Bundle.main.loadNibNamed(self.identifier, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.addSubview(content)
        content.frame = self.bounds
        content.snp.makeConstraints { (maker) in
            maker.top.bottom.left.right.equalTo(0)
        }
    }
}
