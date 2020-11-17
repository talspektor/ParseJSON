//
//  ViewController.swift
//  ParseJSON
//
//  Created by Tal Spektor on 17/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let stringUrl = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
            } catch let jsonError {
                print("Error serialize json", jsonError)
            }
        }.resume()
    }


}

