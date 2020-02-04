//
//  FilterThumbnailView.swift
//  ImageFilter
//
//  Created by Techmaster on 5/23/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import EVGPUImage2


class FilterThumbnailView: UIImageView {

        var previewImage: UIImage!
        lazy var headerTitle: UILabel = {
            let headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 10))
            headerTitle.font = UIFont.systemFont(ofSize: 10, weight: .medium)
            headerTitle.textColor = UIColor.white
            headerTitle.textAlignment = .center
            
            return headerTitle
        }()
        
        lazy var headerView: UIView = {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
            headerView.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.6)
            
            headerView.addSubview(headerTitle)
            
            return headerView
        }()
        
    //Lưu các hiệu ứng filter ảnh. Chỉ được phép hoặc basic_filter hoặc group_filter khác nil
    var basic_filter: BasicOperation? // Loại đơn giản
    var group_filter: OperationGroup? //Loại phức tạp cần gộp nhiều bước filter
    
    convenience init(image: UIImage?, lable: String?, basic_filter: BasicOperation) {
        self.init(image: image)
        headerTitle.text(lable ?? "normal")
        //self.bounds = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        self.basic_filter = basic_filter
        renderThumbnail(image: image)
        
    }
    
    convenience init(image: UIImage?, label: String?) {
        self.init(image: image)
        headerTitle.text(label ?? "normal")
        previewImage = image
    }
    
    convenience init(image: UIImage?, lable: String?, group_filter: OperationGroup) {
        self.init(image: image)
        headerTitle.text(lable ?? "normal")
        self.group_filter = group_filter
        renderThumbnail(image: image)
    }
    
    func renderThumbnail(image: UIImage?) {
        if basic_filter != nil {
            if let filteredImage = image?.filterWithOperation(basic_filter!) {
                self.image = filteredImage
                previewImage = filteredImage
            }
        } else if group_filter != nil {
            if let filteredImage = image?.filterWithOperation(group_filter!) {
                self.image = filteredImage
                previewImage = filteredImage
            }
        } else {
            
        }
    }
}
