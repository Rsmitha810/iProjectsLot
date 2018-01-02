//
//  CustomCollectionViewCell.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 27/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectID: UILabel!
    
    //Configure the cell
    func displayAll(projects: Projects) {
        projectName.text = projects.name
        projectID.text = projects.pid
        coverImage.image = projects.projectImage
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        projectID.text = nil
        projectName.text = nil
        coverImage.image = nil
    }
}
