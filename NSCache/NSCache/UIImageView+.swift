//
//  UIImageView+.swift
//  NSCache
//
//  Created by 노영재 on 2023/04/10.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

extension UIImageView {
    func setImageUrl(_ url: String) {
        DispatchQueue.global(qos: .background).async {

            /// cache할 객체의 key값을 string으로 생성
            let cachedKey = NSString(string: url)

            /// cache된 이미지가 존재하면 그 이미지를 사용 (API 호출안하는 형태)
            if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
                self.image = cachedImage
                return
            }

            // Cache된 이미지가 존재하지 않기 때문에 url을 통해 로컬데이터로 다운받는 과정
            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, result, error) in
                guard error == nil else {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                    }
                    return
                }

                DispatchQueue.main.async { [weak self] in
                    if let data = data, let image = UIImage(data: data) {

                        /// 캐싱
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        self?.image = image
                    }
                }
            }.resume()
        }
    }
}
