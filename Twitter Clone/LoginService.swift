//
//  LoginService.swift
//  Twitter Clone
//
//  Created by Mick Soumphonphakdy on 8/5/15.
//  Copyright (c) 2015 Mick Soum. All rights reserved.
//

import Foundation
import Accounts

//  Create a class for the account seup
class LoginService{
  
  
  // the completionHandler is a type Function used as a parameter for the this class
  // when calling this function, the completion function will set the variables passed in (string or ACAccount)
  class func loginForTwitter (completionHandler: (String?, ACAccount?) -> (Void)){
    //instantiate account
    let accountStore = ACAccountStore()
    //define account type with ACAccount Constants
    let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
    //request access, remember to ask user to provide their credentials in the settings section of their phone
    accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (accessGranted, error) -> Void in
      //error return value if any
      if let error = error{
        completionHandler("Please Login",nil)
        return
      }else{
        if accessGranted{
          //request and capture the account object that is requestes in the account constants
          if let account = accountStore.accountsWithAccountType(accountType).first as? ACAccount{
            completionHandler(nil,account)
          }
          else{
            completionHandler("A Twitter App is required", nil)
          }
          
        }
      }
    }
  }
}


