//
//  ResourceDetailTableViewController.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 28/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import UIKit

class ResourceDetailTableViewController: UITableViewController {
    @IBOutlet weak var resourceImage: UIImageView!
    @IBOutlet weak var resourceName: UILabel!
    @IBOutlet weak var resourceEmpID: UILabel!
    @IBOutlet weak var resourceDesignation: UILabel!
    @IBOutlet weak var resourceExperience: UILabel!
    @IBOutlet weak var resourceBU: UILabel!
    @IBOutlet weak var resourceMailID: UILabel!
    @IBOutlet weak var resourceExtn: UILabel!
    @IBOutlet weak var resourceMobileNo: UILabel!
    @IBOutlet weak var resourceLocation: UILabel!
    @IBOutlet weak var reportingManager: UILabel!
    
    var empID: String = ""
    var resource: Person? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resource = Person.getRequestedResource(fromFile: "Person", with: empID)
        displayDetails()
    }

    func displayDetails() {
        resourceImage.image = resource?.personImage
        resourceName.text = resource?.name
        resourceEmpID.text = resource?.empID
        resourceDesignation.text = resource?.designation
        resourceExperience.text = resource?.experience ?? ""
        resourceBU.text = resource?.bu ?? ""
        resourceMailID.text = resource?.officialEmail
        resourceExtn.text = resource?.extnNo ?? ""
        resourceMobileNo.text = resource?.phNo
        reportingManager.text = resource?.reportingManager
        var seat = resource?.seatLocation ?? ""
        let workLocation = resource?.location ?? ""
        seat.append(" ")
        seat.append(workLocation)
        resourceLocation.text = seat
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
