//
//  GyroManager.swift
//  RelaxApp
//
//  Created by william Vise on 23/8/2022.
//

import Foundation
import CoreMotion

class GyroManager: ObservableObject {
    @Published var rollx = 0.0
    @Published var rolly = 0.0
    @Published var pulsex = 0.0
    @Published var pulsey = 0.0
    let motion = CMMotionManager()
    
    
    init() {
        self.motion.gyroUpdateInterval = 1 / 60
        
        self.motion.startGyroUpdates(to: .main) { (data, error) in
            if self.rollx <= 0 {
                self.rollx += (data?.rotationRate.x)! + 1 / 10
            } else {
                self.rollx += (data?.rotationRate.x)! - 1 / 10
            }
            
            if self.rolly <= 0 {
                self.rolly += (data?.rotationRate.y)! + 1 / 10
            } else {
                self.rolly += (data?.rotationRate.y)! - 1 / 10
            }
            
            self.pulsex = (data?.rotationRate.x)!
            self.pulsey = (data?.rotationRate.y)!
            
            
            
            let tup = (self.rollx,self.rolly)
            print(tup)
            
        }
    }
   
    
}
