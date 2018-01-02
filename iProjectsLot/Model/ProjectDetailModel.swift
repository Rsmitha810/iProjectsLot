//
//  ProjectDetailModel.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 27/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import Foundation
import UIKit

struct ProjectDetail: Decodable {
    let name: String
    let pid: String
    let coverImage: String
    var projectImage: UIImage {
        return UIImage(named: self.coverImage) ?? #imageLiteral(resourceName: "defaultProject")
    }
    let bu: String
    let manager: String
    let director: String
    let resources: [Person]

    //Get details of a single project from JSON file ProjectDetail.json
    static func getProjectDetailsJSONData(fromFile fileName: String, forProjectID requiredPid: String) -> ProjectDetail? {
        let isJSONDataRetrieved = JSONParser.readJSONDataFromBundle(forFileName: fileName)
        guard let jsondata = isJSONDataRetrieved.data else {
            print(isJSONDataRetrieved.error!.rawValue)
            return nil
        }
        do {
            let result = try JSONDecoder().decode([String: ProjectDetail].self, from: jsondata)
            let requiredProject = result.values.filter { $0.pid == requiredPid }
            return requiredProject.first
        }
        catch {
            print("Caught an exception: \(error), \(error.localizedDescription)")
        }
        return nil
    }
}
