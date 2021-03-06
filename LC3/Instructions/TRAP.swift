//
//  TRAP.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class TrapHandler: InstructionHandler {
    override func run(instruction: UInt16) -> Void {
        let pc = computer.programCounter.getValue()
        computer.getRegister(address: 7).setValue(pc)

        let vector = instruction & 0xFF // 8 bits

        // We have fake traps for the default ones.
        switch (vector) {
            case 0x20:
                // TODO: GETC
                break
            case 0x21:
                // TODO: OUT
                break
            case 0x22:
                // TODO: PUTS
                break
            case 0x23:
                // TODO: IN
                break
            case 0x25:
                // HALT
                computer.halted = true
                break
            case 0x80:
                let a = computer.getRegister(address: 0).getValue()
                let b = computer.getRegister(address: 1).getValue()
                
                let div = a / b
                let mod = a % b
                
                computer.getRegister(address: 0).setValue(div)
                computer.getRegister(address: 1).setValue(mod)
                
                break
            default:
                computer.programCounter.setValue(vector)
                break
        }
    }
}
