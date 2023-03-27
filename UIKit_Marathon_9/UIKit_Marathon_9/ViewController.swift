//
//  ViewController.swift
//  UIKit_Marathon_9
//
//  Created by user228564 on 3/25/23.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(MyViewCell.self, forCellWithReuseIdentifier: "MyViewCell")
        self.collectionView.alwaysBounceVertical = false
        self.collectionView.backgroundColor = .systemMint
    }
    
    override func loadView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 250, height: 400)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyViewCell", for: indexPath) as! MyViewCell
        cell.backgroundColor = .systemGray4
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.decelerationRate = UIScrollView.DecelerationRate.normal
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellWidthWithSpacing = 260.0
        var offset = targetContentOffset.pointee
        let index = offset.x  / cellWidthWithSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthWithSpacing, y: 0)

        targetContentOffset.pointee = offset
    }
}

 



