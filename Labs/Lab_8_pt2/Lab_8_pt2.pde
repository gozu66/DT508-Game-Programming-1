void setup()
{
  float area = circleArea(10);
  println(area);
  area = circleArea(55);
  println(area);
  area = circleArea(20.554);
  println(area);
}

float circleArea(float radius)
{
  return PI * sq(radius);
}
