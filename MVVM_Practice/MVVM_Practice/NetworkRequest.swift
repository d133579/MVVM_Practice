//
//  NetworkRequest.swift
//  MVVM_Practice
//
//  Created by 文 on 2018/2/11.
//  Copyright © 2018年 文. All rights reserved.
//

import UIKit

class NetworkRequest: NSObject {
    private static var singleton:NetworkRequest?
    static func sharedInstance() -> NetworkRequest {
        if singleton == nil {
            singleton = NetworkRequest()
        }
        return singleton!
    }
    func downloadData(url : URL, completion: @escaping ( _ result:[TBikeSite]) -> Void , errorCompletion: @escaping (_ errorMeg:String) -> Void) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) { (data, rseponse, error) in
            guard error == nil else {
                return errorCompletion(error.debugDescription)
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.timeZone = TimeZone(secondsFromGMT: 8)
            formatter.locale = Locale(identifier: "ZH_TW")
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            //兩種寫法不同 留著參考
//            if let result = try? decoder.decode([TBikeSite].self, from: data!) {

//            } else {
//                print("error")
//            }
            
            do {
                let resultData = try decoder.decode([TBikeSite].self, from: responseData)
                completion(resultData)
            } catch let error{
                print(error)
            }
        }
        task.resume()
    }

}
