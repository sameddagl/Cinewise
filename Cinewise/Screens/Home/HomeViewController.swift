//
//  HomeViewController.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        viewModel.load()
    }
}

extension HomeViewController: HomeVMDelegate {
    func handleOutput(_ output: HomeOutputs) {
        switch output {
        case .startLoading:
            print("start loading")
        case .endLoading:
            print("end loading")
        case .fetchedMovies(let movies):
            print(movies.count)
        }
    }
    
    func navigate(to route: HomeRoute) {
        
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

