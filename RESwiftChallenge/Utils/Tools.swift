//
//  Tools.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 15/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ url: String!, customLoader : Bool = false, placeholder: String! = nil) {
        guard let url = url else {
            self.image = #imageLiteral(resourceName: "IconPink@2x.png")
            return
        }
        
        if customLoader{
            //let imageData = Data(contentsOf: Bundle.main.url(forResource: "loader", withExtension: "gif")!)
            //self.kf.indicatorType = .image(imageData: imageData )
        } else {
            self.kf.indicatorType = .activity
        }
        
        let resource = URL(string: url)
        
        var placeholderImage: UIImage? = nil
        if let plholder = placeholder {
            placeholderImage = UIImage(named: plholder)
        }
        
        _ = self.kf.setImage(with: resource, placeholder: placeholderImage, options: [.transition(ImageTransition.fade(1))])
    }
}

// MARK: - JSON Struct
public typealias JSON = [String : Any]

public protocol MyDecodable {
    init?(json: JSON)
    
}
public protocol JSONEncodable {
    func convertToDict() -> JSON?
    
}

public extension Array where Element: MyDecodable {
    static func from(jsonArray: [JSON]) -> [Element]? {
        var models: [Element] = []
        
        for json in jsonArray {
            let model = Element(json: json)
            
            if let model = model {
                models.append(model)
            } else {
                return nil
            }
        }
        
        return models
    }
}

public extension Array where Element: JSONEncodable {
    
    func toJSONArray() -> [JSON]? {
        var jsonArray: [JSON] = []
        
        for json in self {
            if let json = json.convertToDict() {
                jsonArray.append(json)
            } else {
                return nil
            }
        }
        
        return jsonArray
    }
}

extension Dictionary {
    func convertToJson() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue: 0))
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)
            return jsonString
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
