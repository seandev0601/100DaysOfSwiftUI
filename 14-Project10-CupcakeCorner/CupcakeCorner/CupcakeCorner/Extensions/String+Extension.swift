//
//  String+Extension.swift
//  CupcakeCorner
//
//  Created by Po Hsiang Chao on 2023/8/26.
//

import Foundation

extension String {
    var isInvalid: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
