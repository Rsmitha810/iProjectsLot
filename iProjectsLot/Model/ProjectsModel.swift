//
//  ProjectsModel.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 26/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import Foundation
import UIKit

struct Projects: Decodable {
    let name: String
    let pid: String
    let coverImage: String
    var projectImage: UIImage {
        return UIImage(named: self.coverImage) ?? #imageLiteral(resourceName: "defaultProject")
    }

    //Get projects list from JSON files Projects.json
    static func getProjectsJSONData(fromFile fileName: String) -> [Projects]? {
        let isJSONDataRetrieved = JSONParser.readJSONDataFromBundle(forFileName: fileName)
        guard let jsondata = isJSONDataRetrieved.data else {
            print(isJSONDataRetrieved.error!.rawValue)
            return nil
        }
        do {
            return try JSONDecoder().decode([Projects].self, from: jsondata)
        }
        catch {
            print("Caught an exception: \(error), \(error.localizedDescription)")
        }
        return nil
    }
}
