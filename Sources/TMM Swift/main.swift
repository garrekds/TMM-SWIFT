//
//  main.swift
//  TMM Swift
//
//  Created by Garrek Stemo on 2020/07/02.
//  Copyright © 2020 Garrek Stemo. All rights reserved.
//

import Accelerate
import simd

let functions = Functions()
let angles = linspace(start: 1, stop: 10, num: 10)
//print(angles.count)
//print(angles)


let d1 = makeDynamicalMatrix(n_eff: 2.0, theta: 0.0, wave_type: "s-wave")

let d2 = makeDynamicalMatrix(n_eff: 1.0, theta: 0.0, wave_type: "s-wave")

let someVector = simd_float2(x: 1.0, y: 0.0)
//print(d1)
//print(d2)
//let transformVector = d1 * someVector
//print(transformVector)
//let multiplyMatrix = d1 * d2

let matrixMult = matrixMultiply2x2(a: d1, b: d2)
let identity: [[Double]] = [[1, 0], [0, 1]]
let a1 = matrixMultiply2x2(a: identity, b: identity)
print(a1)
//print(matrixMult)

let angleArr: [Double] = Array(stride(from: 0.0, to: .pi / 6, by: 0.01))
let cavityMode = functions.cavityModeEnergy(theta: angleArr, E0: 1.0, n_eff: 1.5)
let upperPolariton = functions.coupledEnergies(theta: angleArr, E0: 2150.0, Ee: 2172.0, V: 64.0, n_eff: 1.5, branch: 1)
let lowerPolariton = functions.coupledEnergies(theta: angleArr, E0: 2150.0, Ee: 2172.0, V: 64.0, n_eff: 1.5, branch: 0)


let newMatrix: [[Double]] = [[1, 1], [1, 1]]
//print(newMatrix)
