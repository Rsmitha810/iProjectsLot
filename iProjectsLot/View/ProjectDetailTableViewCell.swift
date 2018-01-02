//
//  ProjectDetailTableViewCell.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 28/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import UIKit

class ProjectDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var buName: UILabel!
    @IBOutlet weak var directorName: UILabel!
    @IBOutlet weak var totalResources: UILabel!
   
    //Configure the cell
    func configureBusinessUnitCell(for projectDetails: ProjectDetail) {
        buName.text = projectDetails.bu
        directorName.text = projectDetails.director
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        buName.text = nil
        directorName.text = nil
        totalResources.text = nil
    }
}

class ResourcesListTableViewCell: UITableViewCell {
    @IBOutlet weak var resourceImage: UIImageView!
    @IBOutlet weak var resourceName: UILabel!
    @IBOutlet weak var resourceDesignation: UILabel!
    @IBOutlet weak var empID: UILabel!
    
    //Configure the cell
    func displayEmployee(in resource: Person) {
        resourceImage.image = resource.personImage
        resourceName.text = resource.name
        resourceDesignation.text = resource.designation
        empID.text = resource.empID
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        resourceName.text = nil
        resourceImage.image = nil
        resourceDesignation.text = nil
        empID.text = nil
    }
}
