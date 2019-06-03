//
//  ImageViewController.swift
//  RandomPractice
//
//  Created by Apple on 03/06/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    enum KittenImageLocation: String {
        case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
        case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
        case error = "not a url"
    }
    private let imageLocation = KittenImageLocation.http.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loadImage(_ sender: Any) {
        guard let imageUrl = URL(string: imageLocation) else {
            print("Can not create image URL")
            return
        }
        
        loadImageUsingDataTask(imageUrl: imageUrl)
    }
    
    private func loadImageUsingDataTask(imageUrl: URL) {
        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data else {
                print("No data, there was an error")
                return
            }
            
            let downloadedImage = UIImage(data: data)
            //update the image on main thread
            DispatchQueue.main.async {
                self.imageView.image = downloadedImage
            }
        }
        
        //a task is created in a suspened state and to actually make the networ
        //request we need to call task.resume()
        task.resume()
    }
}
