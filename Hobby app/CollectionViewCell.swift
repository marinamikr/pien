///564x/fe/7f/02/fe7f02064b70e31e45ffda1af479bbee.jpg
//  CollectionViewCell.swift
//  Hobby app
//
//  Created by 鈴木絢心 on 2024/01/26.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            collectionImageView.image = image
        }
    }
}
//
//  override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        backgroundColor = .blue
//        // Initialization code
//    }
//    
//    override func prepareForReuse() {
//            super.prepareForReuse()
//            
//          collectionImageView.image = UIImage()
//        }
//        
//        func setupCell(imageName: String) {
//           
//            collectionImageView.image = UIImage(named: imageName)
//        }
//
//}
