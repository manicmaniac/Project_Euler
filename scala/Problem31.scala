object Problem31 {
  val english_coins = List(200, 100, 50, 20, 10, 5, 2, 1)
  def calculateCurrency(amount:Int, coins:List[Int]):Int =
    (amount, coins) match {
      case (0, _) => 1
      case (_, Nil) => 0
      case (_, _) if(amount<0) => 0
      case (_, _) => calculateCurrency(amount, coins.tail) + calculateCurrency(amount-coins.head, coins)
  }
  def main(args:Array[String]) {
    println(calculateCurrency(200, english_coins))
  }
}
