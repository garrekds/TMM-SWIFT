

/*
 In transfer_matrix, we use Swift's Accelerate package and, specifically,
 the simd module to perform matrix multiplication.
 */

import Accelerate
import simd

func makeDynamicalMatrix(n_eff: Double, theta: Double = 0, wave_type: String) -> [[Double]] {
    /* Takes effective refractive index, n_eff, and incident angle, theta, to
     calculate the 2x2 dynamical matrix.
     #TODO: Make wave_type optional and add mixed wave.*/
    
    var rows: [[Double]] = []
    if wave_type == "s-wave" {
        rows = [
            [1, 1],
             [n_eff * cos(theta), -n_eff * cos(theta)]]
    }
    if wave_type == "p-wave" {
        rows = [
              [cos(theta), cos(theta)],
              [n_eff, -n_eff ]]
    }
     
    return rows
}
