import Debug "mo:base/Debug"

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 23432412; //let like constant unchangable

  public func topUp(amount: Nat){
    currentValue += amount;
  Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat){
    //? operator may trap inferred type Nat
    let tempValue: Int = currentValue - amount;
    if (currentValue - amount >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }else{
      Debug.print("insufficient fund");
    }
  };

  //? MUST USE async
  public query func checkBalance(): Nat{
    return currentValue;
  }
}