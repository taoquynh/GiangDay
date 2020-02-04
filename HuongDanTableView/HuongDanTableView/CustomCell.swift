//
//  CustomCell.swift
//  HuongDanTableView
//
//  Created by Taof on 8/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "burger-aureole")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tafo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = """
        Cục Hàng không Việt Nam cấm vận chuyển laptop 15 inch của Apple dưới mọi hình thức, bao gồm đem theo lên khoang máy bay, hành lý ký gửi hay thông qua đường hàng hóa. Hành khách làm trái quy định có thể bị từ chối vận chuyển và xử phạt.
        
        Trên chuyến bay, nếu tổ bay phát hiện có máy tính trong diện bị cấm, người sở hữu phải tắt nguồn máy tính, không sạc pin và tuân thủ các yêu cầu hàng không.
        """
        label.numberOfLines = 0
        return label
    }()
    
    func setupLayout(){
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        containerView.addSubview(photoImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(addressLabel)
        
        photoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        addressLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 64).isActive = true
        
    }

    // khởi tạo cell không có file xib
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        photoImageView.layer.cornerRadius = photoImageView.frame.width/2
        photoImageView.layer.masksToBounds = true
        // Configure the view for the selected state
    }

}
