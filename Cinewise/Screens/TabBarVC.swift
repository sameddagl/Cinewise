//
//  TabBarVC.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

final class TabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().backgroundColor = Colors.mainColor
        UINavigationBar.appearance().tintColor = .white
        
        UITabBar.appearance().backgroundColor = Colors.mainColor
        UITabBar.appearance().tintColor = .white
        
        let homeVC = embedInNavController(vc: HomeBuilder.make(), title: "Home", tabBarImage: SFSymbols.home)
        let searchVC = embedInNavController(vc: SearchViewController(), title: "Search", tabBarImage: SFSymbols.search)
        let watchListVC = embedInNavController(vc: WatchListViewController(), title: "Watch List", tabBarImage: SFSymbols.bookmark)
        
        self.viewControllers = [homeVC, searchVC, watchListVC]
    }
    
    private func embedInNavController(vc: UIViewController, title: String, tabBarImage: UIImage?) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.title = title
        nav.tabBarItem.image = tabBarImage
        
        return nav
    }
}


