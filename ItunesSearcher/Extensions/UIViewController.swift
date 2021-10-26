//
//  UIViewController.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, action: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОK", style: .cancel) { _ in
            if let action = action {
                action()
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
