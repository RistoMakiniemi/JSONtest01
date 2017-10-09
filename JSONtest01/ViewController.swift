//
//  ViewController.swift
//  JSONtest01
//
//  Created by Koulutus on 03/10/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // First we try to read from Resources
        let urlAAA = Bundle.main.url(forResource: "mytest", withExtension: "json")
        
        do {
            let dataAAA = try Data(contentsOf: urlAAA!)
            // Use JSON parser to encode data
            let jsonAAA = try JSONSerialization.jsonObject(with: dataAAA, options: [])
            
            if let resultAAA = jsonAAA as? [String: Any] {
                if let iterAAA1 = resultAAA["firstname"] as? String {
                    NSLog(iterAAA1)
                }
                if let iterAAA2 = resultAAA["familyname"] as? String {
                    NSLog(iterAAA2)
                }
                if let iterAAA3 = resultAAA["age"] as? Int {
                    NSLog(iterAAA3.description)
                }
                
                if let iterAAA4 = resultAAA["childkey"] as? [String:Any] {
                    if let iterAAA41 = iterAAA4["childkeyToo"] as? String {
                    
                        NSLog(iterAAA41)
                    }
                }
                
                if let iterAAA5 = resultAAA["children"] as? [String] {
                    for object in iterAAA5 {
                        NSLog(object)
                    }
                }
            }
            
        }
        catch let MyError as NSError {
            print(MyError.description)
        }
        
        /*
        
        // We can read JSON file direcly using URL of asset in internet
        let urlBBB = URL(string: "https://jsonip.com")
        
        let requestBBB = URLRequest(url: urlBBB!)
        
        //let dataBBB = try Data(contentsOf: urlBBB!)
        let taskBBB = URLSession.shared.dataTask(with: requestBBB, completionHandler: {
        
            (data, response, error) in
            guard let dataBBB = dataBBB, let error = nil
                else { return }
            
            do {
            
                let jsonAAA = try JSONSerialization.jsonObject(with: dataBBB, options: [])

            
                if let resultBBB = jsonAAA as? [String: Any] {
                    if let iterBBB = resultBBB["reject-fascism"] as? String {
                            NSLog(iterBBB)
                        
                    }
                }
                    
            }
            catch let MyError as NSError {
                print(MyError.description)
            }
                 
        }
 */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

