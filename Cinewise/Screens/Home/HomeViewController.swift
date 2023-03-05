//
//  HomeViewController.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    //MARK: - UI Properties
    private var collectionView: UICollectionView!
    
    //MARK: - Injections
    var viewModel: HomeVMProtocol!
    
    //MARK: - Properties
    private var dataSource: UICollectionViewDiffableDataSource<Int, HomePresentation>!
    
    private var topRated = [HomePresentation]()
    private var selectedCategory = [HomePresentation]()
    
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
        case .fetchedMovies(let topRated, let selectedCategory):
            self.topRated = topRated
            self.selectedCategory = selectedCategory
            updateData()
        }
    }
    
    func navigate(to route: HomeRoute) {
        
    }
}

//MARK: - UI Related
extension HomeViewController {
    private func layout() {
        configureView()
        configureCollectionView()
        createDataSource()
    }
    
    private func configureView() {
        title = "Home"
        view.backgroundColor = Colors.mainColor
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.backgroundColor = Colors.mainColor
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
        })
    }
    
    private func updateData() {
        DispatchQueue.main.async {
            var snapshot = NSDiffableDataSourceSnapshot<Int, HomePresentation>()
            snapshot.appendSections([0, 1])
            snapshot.appendItems(self.topRated, toSection: 0)
            snapshot.appendItems(self.selectedCategory, toSection: 1)
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout { sectionNum, env in
            if sectionNum == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: .zero, leading: CGFloat(10), bottom: .zero, trailing: CGFloat(10))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(240)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            }
            
            else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: CGFloat(10), leading: CGFloat(10), bottom: .zero, trailing: CGFloat(10))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(240)), subitems: [item])
                group.edgeSpacing = .init(leading: .none, top: .fixed(10), trailing: .none, bottom: .none)
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        }
        return layout
    }
}

