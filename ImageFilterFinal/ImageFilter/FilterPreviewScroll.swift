//
//  FilterPreviewScroll.swift
//  ImageFilter
//
//  Created by Techmaster on 5/23/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import EVGPUImage2

class FilterPreviewScroll: UIScrollView {
    var filterArray = [FilterThumbnailView]()
    var tagIndex: Int = 100
    
    func addFilterThumbnail(filterPreview: FilterThumbnailView) {
        
        filterPreview.frame = CGRect(origin: CGPoint(
            x: MainScreen.filter_scroll_margin + CGFloat(filterArray.count) * (filterPreview.bounds.width + MainScreen.filter_scroll_margin) ,
            y: MainScreen.filter_scroll_margin),
                                     size: filterPreview.bounds.size)
        filterArray.append(filterPreview)
        filterPreview.tag = tagIndex
        tagIndex += 1
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        filterPreview.isUserInteractionEnabled = true
        filterPreview.addGestureRecognizer(tapGestureRecognizer)
        
        self.addSubview(filterPreview)
        self.contentSize = CGSize(width: MainScreen.filter_scroll_margin + CGFloat(filterArray.count) * (filterPreview.bounds.width + MainScreen.filter_scroll_margin),
                                  height: self.bounds.size.height)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedView = tapGestureRecognizer.view as! FilterThumbnailView
        print("action ")
        
        let imageDataDict:[String: UIImage] = ["image": tappedView.previewImage]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict) 
        print(tappedView.headerTitle.text!)
    }
    
    //Sinh ra các thumbnail đại diện cho các loại filter khác nhau. Nếu là lần chọn ảnh thứ 2, thì hãy xóa các filter cũ đi
    func generateFilterThumbnails(image: UIImage?) {
        if filterArray.count > 0 {
            for view in self.subviews {
                view.removeFromSuperview()
            }
            filterArray.removeAll()
        }
        
        addFilterThumbnail(filterPreview: FilterThumbnailView(image: image, label: "normal"))
        addFilterThumbnail(filterPreview: FilterThumbnailView( image: image, lable: "Luminance", basic_filter: Luminance()))
        addFilterThumbnail(filterPreview: FilterThumbnailView( image: image, lable: "BoxBlur", basic_filter: BoxBlur()))
        addFilterThumbnail(filterPreview: FilterThumbnailView(image: image, lable: "SmoothToonFilter", group_filter: SmoothToonFilter()))
        addFilterThumbnail(filterPreview: FilterThumbnailView(image: image, lable: "MonochromeFilter", basic_filter: MonochromeFilter()))
        addFilterThumbnail(filterPreview: FilterThumbnailView(image: image, lable: "", group_filter: TiltShift()))
        addFilterThumbnail(filterPreview: FilterThumbnailView(image: image, lable: "", group_filter: UnsharpMask()))
    }
   

}
