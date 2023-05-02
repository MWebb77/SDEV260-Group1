//
//  ViewController.swift
//  PersonalitySurvey
//
//  Created by Marland Kennedy on 4/29/23.
//

import UIKit

class ViewController: UIViewController {

   /* override func viewDidLoad() {
        super.viewDidLoad()*/
        let button = UIButton()
        var imageIndex = 0
       
    var imageDirectory:[String:String] = ["greenhouse1.png":"ambivert",
                                          "greenhouse2.png":"ambivert",
                                          "blue1.png":"intravert",
                                          "blue2.png":"intravert",
                                          "blue3.png":"intravert",
                                          "orange.png":"extravert",
                                          "orange1.png":"extravert",
                                          "orange2.png":"extravert",
                                          "purple1.png":"intravert",
                                          "purple2.png":"intravert",
                                          "purple3.png":"intravert",
                                          "red.png":"extravert",
                                          "red1.png":"extravert",
                                          "red2.png":"extravert",
                                          "yellow1.png":"ambivert",
                                          "yellow2.png":"ambivert",
                                          "yellow3.png":"ambivert"]
        var overlayImageView: UIImageView?
        var timer: Timer?
 
 override func viewDidLoad() {
     super.viewDidLoad()
     var _count:Int = 0
     // set up image button
            button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            button.center = view.center
            view.addSubview(button)
            
            // set up initial image
           /* button.setImage(UIImage(named: imageNames[imageIndex]), for: .normal)*/
     let imageName = Array(imageDirectory.keys)[imageIndex]
     button.setImage(UIImage(named: imageName), for: .normal)
           
        // start timer to update image every 3 seconds
       /*timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true)*/
     timer = Timer.scheduledTimer(timeInterval: 3,target:self, selector: #selector(UpdateImage), userInfo: nil, repeats:true)
     
     // add tageget button
button.addTarget(self, action: #selector(buttonPressed), for:.touchUpInside)
            
 }
    @objc func UpdateImage(){
        imageIndex += 1
        if (imageIndex >= imageDirectory.count)
        {
            imageIndex = 0;
        }
        let nextImageName = Array(imageDirectory.keys)[imageIndex]
        button.setImage(UIImage(named: nextImageName), for: .normal)
    }
    @objc func buttonPressed() {
            // perform action when button is tapped
            //print("Button pressed")
        let imageName = Array(imageDirectory.keys)[imageIndex]
        let value = imageDirectory[imageName] ?? "Unknown Value"
        print("The color of the image is -- \(value)")
        // add overlay image view
       
                if overlayImageView == nil {
                    let overlayImage = UIImage(named: "greencheckMark.png")
                    overlayImageView = UIImageView(image: overlayImage)
                    overlayImageView!.frame = button.bounds
                    button.addSubview(overlayImageView!)
                }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.overlayImageView?.removeFromSuperview()
            self.overlayImageView = nil
        }
    }
   
}

