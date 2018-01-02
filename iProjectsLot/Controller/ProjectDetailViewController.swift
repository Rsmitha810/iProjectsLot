//
//  ProjectDetailViewController.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 27/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    //MARK:- IB Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeaderView: HeaderCellForTableView!
    
    //MARK:- Properties
    private var projectdetails: ProjectDetail?
    var project_id: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get selected project details and display them
        guard let details = ProjectDetail.getProjectDetailsJSONData(fromFile: "ProjectDetail", forProjectID: project_id) else {
            return
        }
        projectdetails = details
        self.tableHeaderView.configureHeaderView(for: projectdetails!)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        //Deselect the cell which is highlighted if any
        if self.tableView.indexPathForSelectedRow != nil {
            self.tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
}

//MARK:- Table View Delegate Methods
extension ProjectDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Allow only the resources cell to be selected and show the detail view controller, else just deselect the row
        guard indexPath.section == 1 else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "resourceDetail") as? ResourceDetailTableViewController else {
            print("Could not create resource detail view controller")
            return
        }
        guard let employeeID = projectdetails?.resources[indexPath.row].empID else {
            print("Could not finc employee ID for the requested resource")
            return
        }
        vc.empID = employeeID
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- Table View Data Source Methods
extension ProjectDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows: Int = (projectdetails?.resources.count)!
        if section == 0 {
            numberOfRows = 1
        }
        return numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            guard let dataCell = tableView.dequeueReusableCell(withIdentifier: "projectDetailCell") as? ProjectDetailTableViewCell else {
                print("Could not create table view cell to display project details")
                return cell
            }
            dataCell.configureBusinessUnitCell(for: projectdetails!)
            cell = dataCell
        } else if indexPath.section == 1 {
            guard let dataCell = tableView.dequeueReusableCell(withIdentifier: "resourceCell") as? ResourcesListTableViewCell else {
                print("Could not create resource cell for table view")
                return cell
            }
            dataCell.displayEmployee(in: (projectdetails?.resources[indexPath.row])!)
            cell = dataCell
        }
        return cell
    }
}

