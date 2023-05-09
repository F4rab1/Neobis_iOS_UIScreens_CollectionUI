//
//  ViewController.swift
//  CollectionUI
//
//  Created by Фараби Иса on 09.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Singles"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let images: [UIImage] = [UIImage(named: "bookImage")!, UIImage(named: "booksImage")!, UIImage(named: "envelopeImage")!, UIImage(named: "globusImage")!]
    let label1: [String] = ["SOS", "On-the-Go", "Classic", "SOS"]
    let label2: [String] = ["Mini meltdown? Get some \nHeadspace in a hurry", "Mindful living? Get your \nHeadspace to go", "Like it simple? Get some \nextra Headspace", "Mini meltdown? Get some \nHeadspace in a hurry"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTabBarController()
        setupViews()
        setupConstraints()
        configureCollectionView()
    }
    
    func setupViews() {
        view.addSubview(menuButton)
        view.addSubview(titleLabel)
        view.addSubview(searchButton)
        view.addSubview(collectionView)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
    }
    
    func setupTabBarController() {
        let tabBarController = UITabBarController()
        
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Series", image: UIImage(systemName: "list.bullet.rectangle"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "Headspace", image: UIImage(systemName: "headphones"), tag: 1)
        
        let thirdViewController = UIViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController]
        
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = .black
        
        let topDividerView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        topDividerView.backgroundColor = .lightGray
        tabBar.addSubview(topDividerView)
        
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            menuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return label1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
            return UICollectionViewCell()
        }
        
        let text1 = label1[indexPath.item]
        let text2 = label2[indexPath.item]
        let imagee = images[indexPath.item]
        
        cell.configure(with: text1, text2: text2, imageforcell: imagee)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = 180.00
        return CGSize(width: width, height: height)
    }
}

