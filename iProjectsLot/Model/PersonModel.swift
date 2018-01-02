//
//  PersonModel.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 27/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import Foundation
import UIKit

struct Person: Decodable {
    let name: String
    let empID: String
    var image: String
    var personImage: UIImage {
        return UIImage(named: self.image) ?? #imageLiteral(resourceName: "defaultUser")
    }
    let designation: String
    let officialEmail: String
    let phNo: String
    let extnNo: String
    let experience: String
    let reportingManager: String
    let seatLocation: String
    let location: String
    let bu: String
    
    //Get details of a single person from JSON file Person.json
    static func getAllResources(fromFile fileName: String) -> (resources: [Person]?,error: FetchError?) {
        let isJSONDataRetrieved = JSONParser.readJSONDataFromBundle(forFileName: fileName)
        guard let resourceData = isJSONDataRetrieved.data else {
            print(String(describing:isJSONDataRetrieved.error?.rawValue))
            return (nil, isJSONDataRetrieved.error)
        }
        do {
            return (try JSONDecoder().decode([Person].self, from: resourceData), nil)
        } catch {
            print("Exception caught: \(error), \(error.localizedDescription)")
            return (nil, FetchError.deserializingJSONFailed)
        }
    }
    
    static func getRequestedResource(fromFile fileName: String, with empID: String) -> Person? {
        let allResources = getAllResources(fromFile: fileName)
        guard let resources = allResources.resources else {
            print("Error: \(String(describing: allResources.error?.rawValue))")
            return nil
        }
        return resources.filter{ $0.empID == empID }.first
    }
}
