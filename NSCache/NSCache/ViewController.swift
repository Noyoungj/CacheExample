//
//  ViewController.swift
//  NSCache
//
//  Created by 노영재 on 2023/04/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //Properties
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let urlString = "https://smileflower-santa-bucket.s3.ap-northeast-2.amazonaws.com/5ceef048-72b4-42b8-9ec5-11d6760cad58.jpg"
    //LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.setImageUrl(urlString)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}

