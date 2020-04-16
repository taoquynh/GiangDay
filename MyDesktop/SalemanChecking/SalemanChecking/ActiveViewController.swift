//
//  ActiveViewController.swift
//  SalemanChecking
//
//  Created by hieu nguyen van on 9/10/19.
//  Copyright © 2019 hieunv. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class ActiveViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myView: UIView!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var locationManager: CLLocationManager!
    var scanEnabled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addBackground()
        let backgroundImage = UIImage(named: "scanlogo.png")
        let imageView: UIImageView
        imageView = UIImageView(frame: myView.bounds)
        imageView.contentMode = UIView.ContentMode.center
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        myView.addSubview(imageView)
        self.myView.sendSubviewToBack(imageView)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnScan(_ sender: Any) {
        self.scanEnabled = true
        scanQRCode()
//        print(active.bool(forKey: "Active"))
    }
    
    func scanQRCode() {
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        if scanEnabled == true {
            let metadataOutput = AVCaptureMetadataOutput()
            if (captureSession.canAddOutput(metadataOutput)) {
                captureSession.addOutput(metadataOutput)
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
                scanEnabled = false
            } else {
                failed()
                return
            }
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame.size = myView.frame.size //view.layer.frame
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
        
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                guard readableObject.stringValue != nil else { return }
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                //check QRcode của saleman
                //print(readableObject.stringValue!)
                if readableObject.stringValue!.contains("SM@http")
                {
                    //lấy saleman link và merchant id
                    let link: String = readableObject.stringValue!
                    let sepaString = link.components(separatedBy: "@")
                    let saleman_link: String = sepaString[1]
                    let merchant_id: String = sepaString[2]
                    // tạo biến userdefault để lưu saleman link, merchant
                    //let act_user_def = UserDefaults.standard
                    let link_user_def = UserDefaults.standard
                    let merchant_id_user_def = UserDefaults.standard
                    //act_user_def.set(true, forKey: "Active")
                    link_user_def.set(saleman_link, forKey: "Link")
                    merchant_id_user_def.set(merchant_id, forKey: "merchantID")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    //gửi về appdelegate
                    //appDelegate.passData(act_user_def)
                    appDelegate.passData(link_user_def)
                    appDelegate.passData(merchant_id_user_def)
                    alertValidationAndPoptoView(title: "Alert", message: "Kích hoạt thành công!",storyBoard: "SigninViewController", ViewController: self)
                }else
                {
                    displayMessage(message: "Mã QRcode không phải từ phần mềm saleman!", title: "Kiểm tra mã QRcode", vw: self)
                }
        }
    }

}
