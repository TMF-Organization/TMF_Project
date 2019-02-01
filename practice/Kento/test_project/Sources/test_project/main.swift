var x:[Float] = [1.0]
var y:[Float] = [0.5]
let dt:Float = 0.001
let a:Float = 25.0
let b:Float = 2.0
func Runge(x: Float, y: Float) -> (next_x: Float, next_y: Float) {
    let k1_x: Float = y
    let k1_y: Float = -a*x - b*y
    let k2_x: Float = y + k1_x*dt/2.0
    let k2_y: Float = -a*(x+k1_x*dt/2.0) - b*(y+k1_y*dt/2.0)
    let k3_x = y + k2_x*dt
    let k3_y = -a*(x+k2_x*dt) - b*(y+k2_y*dt)
    let k4_x = y + k3_x*dt/2.0
    let k4_y = -a*(x+k3_x*dt/2.0) - b*(y+k3_y*dt/2.0)
    let k_x: Float = (k1_x + 2*k2_x + 2*k3_x + k4_x)/6.0
    let k_y: Float = (k1_y + 2*k2_y + 2*k3_y + k4_y)/6.0
    let next_x: Float = x + k_x*dt
    let next_y: Float = x + k_y*dt
    return (next_x, next_y)
}

for i in 0...50000 {
    let tmp = Runge(x:x[i], y:y[i])
    x.append(tmp.next_x)
    y.append(tmp.next_y)
}
