//
//  Post.swift
//  FotografPaylasmaUygulamasi
//
//  Created by Texinsight on 3.06.2023.
//

import Foundation

class Post {
    var email :String
    var yorum :String
    var gorselUrl: String
    
    init(email: String, yorum: String, gorselUrl: String) {
        self.email = email
        self.yorum = yorum
        self.gorselUrl = gorselUrl
    }
}
