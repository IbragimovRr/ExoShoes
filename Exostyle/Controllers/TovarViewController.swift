//
//  TovarViewController.swift
//  Exostyle
//
//  Created by Ибрагимов Эльдар on 05.04.2024.
//

import UIKit

class TovarViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    private let screen = UIScreen.main.bounds.height / 2
    var tovar: Tovar?
    var sizeSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDesign()
        collectionView.delegate = self
        collectionView.dataSource = self
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
    }
    
    func addDesign(){
        heightCollectionView.constant = screen
        price.text = "\(tovar!.price)Р"
        name.text = tovar!.name
    }
    
    @IBAction func addCart(_ sender: Any) {
        guard let size = sizeSelected else {return}
        RealmSelf().saveToBag(tovar: tovar!, size: "\(tovar!.sizes[size])")
    }
    
    @IBAction func buy(_ sender: Any) {
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension TovarViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sizeCollectionView {
            return tovar!.sizes.count
        }else {
            return tovar!.images.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! ImageCollectionViewCell
            cell.im.image = UIImage(named: tovar!.images[indexPath.row])
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "size", for: indexPath) as! SizeCollectionViewCell
            if sizeSelected == indexPath.row {
                cell.contentView.backgroundColor = UIColor.lightGray
            }else {
                cell.contentView.backgroundColor = UIColor.gray
            }
            cell.lbl.text = "\(tovar!.sizes[indexPath.row])"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sizeSelected = indexPath.row
        sizeCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            return CGSize(width: UIScreen.main.bounds.width, height: screen)
        }else{
            return CGSize(width: 50, height: 50)
        }
    }
    
    
}
