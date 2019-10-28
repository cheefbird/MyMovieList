//
//  MovieDBRouter.swift
//  MyMovieList
//
//  Created by Francis Breidenbach on 10/27/19.
//  Copyright © 2019 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire

enum MovieDBRouter: URLRequestConvertible {
  
  // MARK: Routes
  
  case getWeeklyTrendingMovies
  
  // MARK: - Route URL Components
  
  // MARK: Base URL
  
  var baseURL: String {
    return "https://api.themoviedb.org/3/"
  }
  
  var method: HTTPMethod {
    switch self {
    case .getWeeklyTrendingMovies:
      return .get
      
    default:
      return .get
    }
  }
  
  var relativePath: String {
    
    switch self {
    case .getWeeklyTrendingMovies:
      return "/trending/movie/week"
      
    default:
      return "/"
    }
  }
  
  var parameters: Parameters? {
    return nil
  }
  
  var headers: [String: String] {
    var headers = [String: String]()
    
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    
    return headers
  }
  
  // MARK: - Methods
  
  func asURLRequest() throws -> URLRequest {
    guard let url = URL(string: baseURL) else {
      throw MovieDBServiceError.Basic.URLCreationError(urlString: baseURL)
    }
    
    let requestUrl = url.appendingPathComponent(relativePath)
    
    var fullRequestUrl = URLRequest(url: requestUrl)
    fullRequestUrl.httpMethod = method.rawValue
    
    for (key, value) in headers {
      fullRequestUrl.setValue(value, forHTTPHeaderField: key)
    }
    
    let encoding = URLEncoding.default
    
    return try encoding.encode(fullRequestUrl, with: nil)
  }
  
}
