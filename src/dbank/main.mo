import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue = 200;
  // currentValue := 100;

  let id = 23432412545; //let like constant unchangable

  public func topUp(amount: Float){
    currentValue += amount;
  Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    //? operator may trap inferred type Nat
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }else{
      Debug.print("insufficient fund");
    }
  };

  // let startTime = func now() : Time;
  // type Time = Int;
  // func startTime() : Time
  let currentTime = Time.now();
  Debug.print(debug_show(startTime));


  //? MUST USE async
  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now;
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.formInt(timeElapsedS));
    startTime := currentTime;
  }
}