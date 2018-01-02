//
//  HeaderCellForTableView.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 27/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import UIKit

class HeaderCellForTableView: UIView {
    @IBOutlet weak var coverimage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
   
    //Configure the cell
    func configureHeaderView(for projectData: ProjectDetail) {
        name.text = projectData.name
        id.text = projectData.pid
        coverimage.image = projectData.projectImage
    }
}

