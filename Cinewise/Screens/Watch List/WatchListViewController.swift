//
//  WatchListViewController.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

final class WatchListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

//MARK: - UI Related
extension WatchListViewController {
    private func layout() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = Colors.mainColor
    }
}
