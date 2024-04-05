//
//  ViewController.swift
//  Exostyle
//
//  Created by Ибрагимов Эльдар on 02.04.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tovarTableView: UITableView!
    @IBOutlet weak var recomendCollectionView: UICollectionView!
    private var tovars = Tovars.array
    private var recomend = Recomend.array
    private var selectedTovar:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recomendCollectionView.delegate = self
        recomendCollectionView.dataSource = self
        tovarTableView.dataSource = self
        tovarTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Gradient().setGradientBackground(view: self.view)
    }


}
extension MainViewController:UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tovars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tovar") as! TovarTableViewCell
        cell.im.image = UIImage(named: tovars[indexPath.row].images[0])
        cell.name.text = tovars[indexPath.row].name
        cell.price.text = "\(tovars[indexPath.row].price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTovar = indexPath.row
        performSegue(withIdentifier: "tovar", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recomend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recomend", for: indexPath) as! RecomendCollectionViewCell
        cell.im.image = UIImage(named: recomend[indexPath.row].image)
        cell.txt.text = recomend[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tovar" {
            let vc = segue.destination as! TovarViewController
            vc.tovar = tovars[selectedTovar!]
        }
        
    }
    
}
