/*
In England the currency is made up of pound, £, and pence, p, and there are
eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

It is possible to make £2 in the following way:

    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

How many different ways can £2 be made using any number of coins?
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

