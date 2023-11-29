"""
///기본 타입 확장 Expanding Basic Types
"""
protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable {
    func printSelf() {
        print(self)
    }
}
extension Int: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

1024.printSelf()        //1024
3.14.printSelf()        //3.14
"hana".printSelf()      //"hana"
