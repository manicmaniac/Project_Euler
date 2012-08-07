object Problem31 {
  val coins = List(200, 100, 50, 20, 10, 5, 2, 1)

  def currency(amount:Int, coins:List[Int]):Int =
    (amount, coins) match {
      case (0, _) => 1
      case (_, Nil) => 0
      case (_, _) if(amount<0) => 0
      case (_, _) => currency(amount, coins.tail) + currency(amount-coins.head, coins)
  }
  def main(args:Array[String]) {
    print(currency(200, coins))
  }
}
