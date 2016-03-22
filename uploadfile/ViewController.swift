//
//  ViewController.swift
//  uploadfile
//
//  Created by ShinChven Zhang on 16/3/22.
//  Copyright © 2016年 atlassc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func uploadFile(sender: AnyObject) {
        print("start")
        
        let serializer = AFHTTPRequestSerializer()
        let request = serializer.multipartFormRequestWithMethod("POST", URLString: "http://10.0.0.6:8080/upload.do", parameters: ["name":"text.txt"], constructingBodyWithBlock: { (AFMultipartFormData formData) -> Void in

            try! formData.appendPartWithFileURL(NSURL.fileURLWithPath("/Users/ShinChven/Desktop/textfile.txt"), name: "file")
            
            print("packing file")
            }, error: nil)
        
        let manager = AFURLSessionManager(sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        var uploadTask:NSURLSessionUploadTask
        
        uploadTask = manager.uploadTaskWithStreamedRequest(request, progress: { (NSProgress progress) -> Void in
            //
            }, completionHandler: { (NSURLResponse resp, responseObject, error) -> Void in
                print("complete")
        })
        
        uploadTask.resume()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

