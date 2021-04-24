//
//  UIView+Extensions.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//

import UIKit

extension UIView {
    func getTopAnchor() -> NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }else{
            return self.topAnchor
        }
    }
    
    func getBottomAnchor() -> NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }else{
            return self.bottomAnchor
        }
    }
}
