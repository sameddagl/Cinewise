//
//  HomeViewController.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

//MARK: - UI Related
extension HomeViewController {
    private func layout() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = Colors.mainColor
    }
}

