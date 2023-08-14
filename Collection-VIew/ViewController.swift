//
//  ViewController.swift
//  Collection-VIew
//
//  Created by DA MAC M1 157 on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - variables
    private var images: [UIImage] = []
    
    
    //MARK: - UI Components
    private let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBlue
        //collectionView.contentInset = UIEdgeInsets(top: 200, left: 50, bottom: 200, right: 50)
        //collectionView.alwaysBounceVertical = true
        //removes safe area
        //collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
        
        for _ in 0...25 {
            images.append(UIImage(named: "1")!)
            images.append(UIImage(named: "2")!)
            images.append(UIImage(named: "3")!)
            images.append(UIImage(named: "1")!)
            images.append(UIImage(named: "2")!)
        }
        
        
       
    }
    
    private func setupUI() {
        view.addSubview(myCollectionView)
        view.backgroundColor = .systemBackground
        configureConstraints()
    }

    private func configureConstraints() {
        let composeMyCollectionView = [
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        NSLayoutConstraint.activate(composeMyCollectionView)
    }    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell in Home Controller.")
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width/3) - 5
        return CGSize(width: size , height: size)
    }
    
    //vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    //horizontal spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    //border spacing on the sides
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 3, bottom: 5, right: 3)
    }
    
}
