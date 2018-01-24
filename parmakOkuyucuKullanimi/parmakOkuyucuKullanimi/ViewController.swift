//
//  ViewController.swift
//  parmakOkuyucuKullanimi
//
//  Created by Esat Gözcü on 28.11.2017.
//  Copyright © 2017 Esat Gözcü. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var dogrulamaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authContext = LAContext()
        var error: NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Parmak İzinizi Doğrulayın !!", reply: { (success, error) in
                if success == true{
                    //Eğer doğrulama başarılı olursa
                    self.dogrulamaLabel.text = "Doğrulandı"
                }
                else{
                    //Doğrulama başarısız olursa
                    self.dogrulamaLabel.text = "Doğrulanamadı !!"
                }
            })
        }
    }
}

