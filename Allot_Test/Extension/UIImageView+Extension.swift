//
//  UIImageView+Extension.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import SDWebImage

extension UIImageView
{
    func loadImageFromURL(_ url : URL? ,completed : ((Bool)->(Void))?) {
        loadImageFromURL(url, placeHolderImage: image != nil ? image : UIImage() ,completed : completed)
    }
    
    func loadImageFromURL(_ url : URL? , placeHolderImage : UIImage? = nil ,completed : ((Bool)->(Void))? = nil) {
        let placeHolderContentMode = contentMode
        self.image = placeHolderImage ?? UIImage()
        guard let imageURL = url else {
            completed?(false)
            return
        }
        
        sd_setImage(with: imageURL, placeholderImage: placeHolderImage != nil ? placeHolderImage : UIImage(), options: []) {
            [weak self]
            image, error, cacheType, url in
            if let error = error {
                print("Loading image failed - \(error), url- \(imageURL)")
            }
            let success = image != nil && error == nil && url != nil
            self?.contentMode = success ? .scaleAspectFill : placeHolderContentMode
            completed?(success)
        }
    }
}
