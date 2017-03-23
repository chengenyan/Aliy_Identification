//
//  ViewController.swift
//  AliyIdentification
//
//  Created by apple on 2017/3/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class ViewController: UIViewController,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.title="实名认证"
            let btn=UIButton.init(frame: CGRect(x:100,y:100,width:100,height:100))
            btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
            btn.backgroundColor=UIColor.red
            view.addSubview(btn)
                    // Do any additional setup after loading the view.
        }
    
                                    //图片点击
        func btnClick(){
            locaphoto()
           //opencamera()
        }
    
        //照相机
        func locaphoto()
        {
            let iscamera=UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.rear)
            if iscamera {
                let imagepicker=UIImagePickerController.init()
                imagepicker.delegate = self
                imagepicker.sourceType=UIImagePickerControllerSourceType.camera
                imagepicker.allowsEditing=true
                self.present(imagepicker, animated: true, completion: { () -> Void in
                })
            }
        }
        //相册
        func opencamera(){
            let imagepicker=UIImagePickerController.init()
            imagepicker.delegate = self
            imagepicker.sourceType=UIImagePickerControllerSourceType.photoLibrary
            imagepicker.allowsEditing=true
            self.present(imagepicker, animated: true, completion: { () -> Void in
            })
            
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
            picker.dismiss(animated: false) { () -> Void in
            }//相册,照相机关闭
          
            let imageda:Data=UIImageJPEGRepresentation(image, 0.5)!
            let base64String:String = imageda.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))
            ApiClientDriverLicence.instance().driverIdentificationwithbasestr(base64String) { (mydata, resp, error) in
                if error == nil {
                    let bodystring:String=String.init(data: mydata!, encoding: String.Encoding.utf8)!
                    print("]]]]]]" + bodystring)
                    if bodystring != "" {
                    let dic:NSDictionary=PublicView.dictionary(withJsonString: bodystring) as NSDictionary
                    let outputsarr:NSArray=dic["outputs"] as! NSArray
                    
                    if outputsarr.count>0{
                    let outputdic:NSDictionary=outputsarr[0] as! NSDictionary
                    let outputValue:NSDictionary=outputdic["outputValue"] as! NSDictionary
                    let dataValue:String=outputValue["dataValue"] as! String
                         let dataValuedic:NSDictionary=PublicView.dictionary(withJsonString: dataValue) as NSDictionary
                    print(dataValuedic["name"] as! String)
                    }

            }
                }
            }
            

           /* ApiClientIdentification.instance().identificationwithbasestr(base64String) { (mydata, resp, error) in
                if error == nil {
                    let bodystring:String=String.init(data: mydata!, encoding: String.Encoding.utf8)!
                    print("]]]]]]" + bodystring)
                    let dic:NSDictionary=PublicView.dictionary(withJsonString: bodystring) as NSDictionary
                    
                    //let data:Data=bodystring.data(using: String.Encoding.utf8)!
                    //let dic=try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
             let outputsarr:NSArray=dic["outputs"] as! NSArray
             
             if outputsarr.count>0{
             let outputdic:NSDictionary=outputsarr[0]
             let outputValue:NSDictionary=outputdic["outputValue"] as! NSDictionary
             let dataValue:String=outputValue["dataValue"] as! String
             let dataValuedic:NSDictionary=PublicView.dictionary(withJsonString: dataValue) as NSDictionary
             print(dataValuedic["name"] as! String)
             }

             
                }
            }*/
            
    }


        

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */



}

