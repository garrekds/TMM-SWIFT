
import Accelerate
import simd
import Foundation
import Numerics


class Cat {
    var name: String
    var livesRemaining: Int = 9
    
    init(name: String) {
        self.name = name
    }
    
    func describe() -> String {
        return "I'm \(self.name) and I have \(self.livesRemaining) lives"
    }
}

let mitsy = Cat(name: "Mitsy")
//print(mitsy.describe())


class Functions {
    func cavityModeEnergy(theta: [Double], E0: Double, n_eff: Double) -> [Double] {
        var energies: [Double] = []
        for t in theta {
            energies.append(E0 / .sqrt(1 - pow(sin(t) / n_eff, 2)))
        }
        return energies
    }
    
    func coupledEnergies(theta: [Double], E0: Double, Ee: Double, V: Double, n_eff: Double, branch:Int = 0) -> [Double] {
        
        let Ecavity = cavityModeEnergy(theta: theta, E0: E0, n_eff: n_eff)
        var coupledEnergies: [Double] = []
        
        if branch == 0 {
            for Ec in Ecavity {
                let E_coupled = 0.5 * (Ee + Ec) - 0.5 * .sqrt(4*pow(V, 2) + pow((Ee - Ec), 2))
                coupledEnergies.append(E_coupled)
            }
        }
        if branch == 1 {
            for Ec in Ecavity {
                let E_coupled = 0.5 * (Ee + Ec) + 0.5 * .sqrt(4*pow(V, 2) + pow((Ee - Ec), 2))
                coupledEnergies.append(E_coupled)
            }
        }
        return coupledEnergies
    }
    
    func gauss(omega: [Double], omega_0: Double = 0.0, A: Double = 1.0, W: Double = 10.0) -> [Double] {
        var gaussian: [Double] = []
        
        for w in omega {
            let exponent = pow( (w - omega_0) / W, 2)
            gaussian.append(A * .exp( -exponent))
        }
        return gaussian
    }
    func lorentz(omega: [Double], omega_0: Double = 0.0, gamma: Double = 10.0) -> [Double] {
        var lorentzian: [Double] = []
        for w in omega {
            let lorentzFunction = 1 / .pi * gamma / ( pow(w - omega_0, 2) + pow(gamma, 2) )
            lorentzian.append(lorentzFunction)
        }
        return lorentzian
    }
}


func linspace(start: Double, stop: Double, num: Double) -> Array<Double> {

	/* Return linearly spaced real numbers over a specified interval, inclusive.
	
	start : The first value of the sequence.
	stop : The last value of the sequence.
	num : The number of samples to be generated.
	
	*/
	
	let div = num - 1
	let delta = (stop - start)
	let interval = delta / div
	
	let linspaced: Array<Double> = Array(stride(from: start, through: stop, by: interval))
	
	return linspaced
	
	}


func matrixMultiply2x2(a: [[Double]], b: [[Double]]) -> [[Double]] {
    
    let newMatrix = [[a[0][0]*b[0][0] + a[0][1]*b[1][0], a[0][0]*b[0][1] + a[0][1]*b[1][1]],
        [a[1][0]*b[0][0] + a[1][1]*b[1][0], a[1][0]*b[0][1] + a[1][1]*b[1][1]]]
    return newMatrix
}



//print("Cavity fit function")
//print(upperPolariton)
//print(lowerPolariton)




//func sum(xs: [Int]) -> Int {
//    var result: Int = 0
//    for x: Int in xs {
//        result = result + x
//    }
//    return result
//}
//let intNumbers: [Int] = [1, 2, 3, 4, 5]
//let resultInt = sum(xs: intNumbers)
////print(resultInt)
//
//protocol Debugging {
//    func help() -> String
//}

//class MatrixMultiply: Debugging {
//    func help() -> String {
//        return "Offers methods to aid with matrix-matrix multiplications."
//    }
//
//    func multiply () {
//        // ...
//    }
//}
//
//var a = [0, 1, 2, 3, 4, 5]
//let b = a.map {$0+2}
////print(b)
//


