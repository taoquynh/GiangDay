//
//  MainScreen.swift
//  ImageFilter
//
//  Created by Techmaster on 5/23/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
import EVGPUImage2
var objmainVC = MainScreen()
class MainScreen: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    let photo = UIImageView(frame: CGRect.zero)
    let filter_scroll = FilterPreviewScroll(frame: CGRect.zero)
    var filter_scroll_height: CGFloat!  //chiều cao filter scroll sau khi auto layout
    var scale_original_image: UIImage?  //Lưu ảnh gốc đã được thu nhỏ để tạo filter thumbnail
    static var filter_scroll_margin: CGFloat = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.sv(
            photo,
            filter_scroll
        )
        photo.contentMode = .scaleAspectFit
        
        photo.isUserInteractionEnabled = true
        photo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectPhoto)))
     
        
        view.layout(
            64,
            |photo|,
            8,
            |filter_scroll|,
            34
        )
        photo.Height == filter_scroll.Height * 4.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Ban đầu set một cái ảnh mẫu
            self.setNewImageToPhoto(image:UIImage(named: "hot-girl")!)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
        
    }
    
    @objc func showSpinningWheel(_ notification: NSNotification) {
        print(notification.userInfo ?? "")
        if let dict = notification.userInfo as NSDictionary? {
            if let id = dict["image"] as? UIImage{
                if id != nil {
                photo.image = id
                }
            }
        }
    }
    
    @objc func selectPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        filter_scroll_height = filter_scroll.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //Chọn ra một ảnh mới
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        setNewImageToPhoto(image: image)
       
        dismiss(animated: true)
    }
    
    func setNewImageToPhoto(image: UIImage) {
        photo.image = image
        scale_original_image = scaleOriginalImage(input: photo.image!, newHeight: filter_scroll_height - 2.0 * MainScreen.filter_scroll_margin)
        filter_scroll.generateFilterThumbnails(image: scale_original_image)
        
    }
    
    func applyEffect(image: UIImage) {
        photo.image = image
    }
    
    func printSomething() {
        photo.image = nil
        print("printSomething function has been called")
        //photo.image = image
    }
    
    //Thu nhỏ ảnh gốc
    func scaleOriginalImage(input: UIImage, newHeight: CGFloat) -> UIImage? {
        let scale = newHeight / input.size.height //minus 8.0 for margin
        return UIImage.scale(image: input, by: scale)
    }

}


