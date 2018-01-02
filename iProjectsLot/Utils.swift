//
//  utils.swift
//  iProjectsLot
//
//  Created by Smitha Ramamurthy on 29/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import Foundation

enum FetchError: String {
    typealias RawValue = String
    case fileNotFound = "Requested JSON file not found "
    case downloadingDataFailed = "Could not download data from requested file"
    case deserializingJSONFailed = "Ill- Formed JSON "
}
class Utils {
    class func getURLFromBundle(forFileName fileName: String) -> (url: URL?, error: FetchError?){
        guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return (nil, FetchError.fileNotFound)
        }
        return (path, nil)
    }
    class func getData(fromURL fileURL: URL) -> (data: Data?, error: FetchError?) {
        guard let data = try? Data(contentsOf: fileURL) else {
            return (nil, FetchError.downloadingDataFailed)
        }
        return (data, nil)
    }
}
class JSONParser {
    class func readJSONDataFromBundle(forFileName filename: String) -> (data: Data?, error: FetchError?) {
        let fileURLStatus = Utils.getURLFromBundle(forFileName: filename)
        guard let fileURL = fileURLStatus.url else {
            return (nil, fileURLStatus.error)
        }
        let fileDataStatus = Utils.getData(fromURL: fileURL)
        guard let jsonData = fileDataStatus.data else {
            return (nil, fileDataStatus.error)
        }
        return (jsonData, nil)
    }
}

