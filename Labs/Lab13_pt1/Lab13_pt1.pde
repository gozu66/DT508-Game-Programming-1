void setup()
{
  int i = 140;
  println(decToBin(i));
}

String decToBin(int dec)
{
  String binaryOutput = "";
  while(dec > 0)
  {
    binaryOutput = (dec % 2) + binaryOutput;
    dec = dec / 2;
  }
  return binaryOutput;
}
