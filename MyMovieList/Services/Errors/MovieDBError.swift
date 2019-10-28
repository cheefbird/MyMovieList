//
//  MovieDBError.swift
//  MyMovieList
//
//  Created by Francis Breidenbach on 10/27/19.
//  Copyright © 2019 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire

enum MovieDBServiceError: Error {
  
  enum Basic: Error {
    
    case URLCreationError(urlString: String)
  }
}
