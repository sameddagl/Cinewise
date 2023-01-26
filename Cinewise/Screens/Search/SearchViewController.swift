//
//  SearchViewController.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

//MARK: - UI Related
extension SearchViewController {
    private func layout() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = Colors.mainColor
    }
}



