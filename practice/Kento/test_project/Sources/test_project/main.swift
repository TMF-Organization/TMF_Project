import Foundation

var x:[Float] = [1.0]
var y:[Float] = [0.0]
let dt:Float = 0.001
let a:Float = 25
let b:Float = 2
func Runge(x: Float, y: Float) -> (next_x: Float, next_y: Float) {
    let k1_x = y
    let k1_y = -a*x - b*y
    let k2_x = y + k1_y*dt/2.0
    let k2_y = -a*(x+k1_x*dt/2.0) - b*(y+k1_y*dt/2.0)
    let k3_x = y + k2_y*dt
    let k3_y = -a*(x+k2_x*dt) - b*(y+k2_y*dt)
    let k4_x = y + k3_y*dt/2.0
    let k4_y = -a*(x+k3_x*dt/2.0) - b*(y+k3_y*dt/2.0)
    let k_x = (k1_x + 2*k2_x + 2*k3_x + k4_x)/6.0
    let k_y = (k1_y + 2*k2_y + 2*k3_y + k4_y)/6.0
    let next_x: Float = x + k_x*dt
    let next_y: Float = y + k_y*dt
    return (next_x, next_y)
}

let task = Process()
task.launchPath = "/usr/bin/gnuplot"
let pipe = Pipe()
task.standardInput = pipe
task.launch()

pipe.fileHandleForWriting.write("set terminal png\n".data(using: .utf8)!)
pipe.fileHandleForWriting.write("set output \"test.png\"\n".data(using: .utf8)!)
pipe.fileHandleForWriting.write("plot \"-\" with lines\n".data(using: .utf8)!)

for i in 0...4999 {
    let tmp = Runge(x:x[i], y:y[i])
    x.append(tmp.next_x)
    y.append(tmp.next_y)
    let count: Float = Float(i+1)*dt
    let strt: String = String(format: "%.3f", count)
    let strx: String = String(format: "%.3f", tmp.next_x)
    let str: String = strt + " " + strx + "\n"
    pipe.fileHandleForWriting.write(str.data(using: .utf8)!)
}

pipe.fileHandleForWriting.write("q\n".data(using: .utf8)!)