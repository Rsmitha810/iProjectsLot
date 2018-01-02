//
//  ViewController.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 26/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:-  IB Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- Properties
    var projectsList = [Projects]()
    private let cellSize: CGFloat = 160.0
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let projects = Projects.getProjectsJSONData(fromFile: "Projects") else {
            return
        }
        self.projectsList = projects
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

//MARK:- CollectionView Data source methods
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectsList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CustomCollectionViewCell else{
            print("Could not create collection view cell")
            return UICollectionViewCell()
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        //Retrive project from the data received from JSON file
        let projectdata = projectsList[indexPath.row]
        cell.displayAll(projects: projectdata)
        return cell
    }
}

//MARK:- CollectionView Delegate methods
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "projectDetailTableView") as? ProjectDetailViewController else {
            print("Could not instantiate ProjectDetailViewController from current VC")
            return
        }
        vc.project_id = projectsList[indexPath.row].pid
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- CollectionView FlowLayout Delegate methods
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize + 20.0)
    }
}
