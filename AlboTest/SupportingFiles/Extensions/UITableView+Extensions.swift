//
//  UITableView+Extensions.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 22/04/21.
//


import UIKit

extension UITableView {
    static func getDefault(adjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior = .automatic, contentInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.contentInset = contentInset
        tableView.contentInsetAdjustmentBehavior = adjustmentBehavior
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }
    
}
