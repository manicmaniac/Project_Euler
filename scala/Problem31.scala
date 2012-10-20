/*
In England the currency is made up of pound, $B!r(B, and pence, p, and there are
eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, $B!r(B1 (100p) and $B!r(B2 (200p).

It is possible to make $B!r(B2 in the following way:

    1$B!_!r(B1 + 1$B!_(B50p + 2$B!_(B20p + 1$B!_(B5p + 1$B!_(B2p + 3$B!_(B1p

How many different ways can $B!r(B2 be made using any number of coins?
*/

object Problem31 {
  def currency(amount:Int, coins:List[Int]):Int =
    (amount, coins) match {
      case (0, _) => 1
      case (_, Nil) => 0
      case (_, _) if(amount<0) => 0
      case (_, _) => currency(amount, coins.tail) + currency(amount-coins.head, coins)
  }

  def main(args:Array[String]) {
    val coins = List(200, 100, 50, 20, 10, 5, 2, 1)
    println(currency(200, coins))
  }
}

