import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank{
  //stable keyword adds peristence
  stable var currentValue:Float = 300;
  // currentValue := 100;
  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));
  
  //Debug.print(debug_show(currentValue));

  public func TopUp(amount:Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //Allow user to withdraw
  public func Withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Not possbile");
    }
  };

  public query func CheckBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;

  }

  // Debug.print(debug_show(startTime))

  // TopUp();
}