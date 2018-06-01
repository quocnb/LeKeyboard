//
//  KeyboardViewController.swift
//  LeKeyboardExtension
//
//  Created by Quoc Nguyen on 2018/05/30.
//  Copyright © 2018 Quoc Nguyen. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var leKeyboard: LeKeyboardView!

    override func updateViewConstraints() {
        super.updateViewConstraints()

        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let inputView = self.inputView else {
            return
        }
        let view = LeKeyboardView(frame: inputView.bounds)
        self.leKeyboard = view
        inputView.addSubview(self.leKeyboard)
        leKeyboard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leKeyboard.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            leKeyboard.topAnchor.constraint(equalTo: inputView.topAnchor),
            leKeyboard.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            leKeyboard.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
            ])
        configureLeKeyboardView()
    }

    func configureLeKeyboardView() {
        leKeyboard.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        leKeyboard.didTapDelete = { [weak self] in
            let proxy = self?.textDocumentProxy
            if let lastText = proxy?.documentContextBeforeInput?.components(separatedBy: " ").last {
                if lastText.isEmpty {
                    proxy?.deleteBackward()
                    return
                }
                for _ in 0..<lastText.count {
                    proxy?.deleteBackward()
                }
            } else {
                proxy?.deleteBackward()
            }
        }
        leKeyboard.didTapButton = { [weak self] text in
            self?.textDocumentProxy.insertText(text)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(_ textInput: UITextInput?) {

    }

}
