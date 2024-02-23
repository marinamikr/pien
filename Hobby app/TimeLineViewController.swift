//
//  TimeLineViewController.swift
//  Hobby app
//
//  Created by 鈴木絢心 on 2024/01/26.
//

import UIKit

class TimeLineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    let movie = [
        UIImage(named: "post1")!,
        UIImage(named: "post2")!,
        UIImage(named: "post3")!,
        UIImage(named: "post1")!,
        UIImage(named: "post2")!,
        UIImage(named: "post3")!,
        UIImage(named: "post1")!,
        UIImage(named: "post2")!,
        UIImage(named: "post3")!
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        
        cell.image = movie[indexPath.item]
//
//                            cell.setupCell(imageName: movie[indexPath.row])
//        cell.collectionImageView.image = movie[indexPath.row]
        
        
        return cell
    }
}
