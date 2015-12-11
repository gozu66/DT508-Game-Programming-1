void setup()
{
  println(findMin(100.0f, 200.0f, 500.0f));
  println(findMin(22.5f, 0.0f, 145.0f));
  println(findMin(0.225f, 1.0f, -80.0f));
  println(findMin(-157.2564f, -78745.0f, 4587.0f));
}

float findMin(float a, float b, float c)
{
  if(a < b && a < c)
  {
    return a;
  }
  else if (b < c && b < a)
  {
    return b;
  }
  else 
  {
    return c;
  }
}
