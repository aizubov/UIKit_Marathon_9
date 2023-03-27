//
//  MyViewCell.swift
//  UIKit_Marathon_9
//
//  Created by user228564 on 3/26/23.
//

import UIKit

class MyViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel(frame: contentView.bounds)
        label.textAlignment = .center
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
