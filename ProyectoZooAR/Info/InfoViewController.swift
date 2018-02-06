//
//  InfoViewController.swift
//  ReproductorMusicaJulio
//
//  Created by alumnos on 22/1/18.
//  Copyright © 2018 julio. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController //, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIAlertViewDelegate {
{
    
    var arrayEvents: [UIImage] = [#imageLiteral(resourceName: "fotousuario")]
    var arrayAnimals: [UIImage] = [#imageLiteral(resourceName: "fotousuario")]
    var arrayRestaurants: [UIImage] = [#imageLiteral(resourceName: "fotousuario")]

    @IBOutlet weak var cvEvents: UICollectionView!
    @IBOutlet weak var cvAnimals: UICollectionView!
    @IBOutlet weak var cvRestaurants: UICollectionView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}/*
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // store.getBookImages {
         //   self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
  //  let store = DataStore.sharedInstance
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.audiobooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellsInfo", for: indexPath) as! CollectionViewCell
        
        let book = store.audiobooks[indexPath.row]
        
        cell.displayContent(image: store.images[indexPath.row], title: book.name)
        
        return cell
        
    }*/

