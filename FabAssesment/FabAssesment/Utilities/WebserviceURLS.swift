//
//  WebserviceURLS.swift
//  FabAssesment
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import Foundation

/// APP_KEY object that registered with New York Times API services
let APP_KEY = "Cd2gTxTBjoAv1s7iLfzQLOqw0OiVlFHH"

/// basic api link
let baseURL = "http://api.nytimes.com/svc/mostpopular/v2/"

/// api's list
let MOSTVIEWED_URL = String(format: "%@mostviewed/all-sections/7.json?api-key=\(APP_KEY)", baseURL)





