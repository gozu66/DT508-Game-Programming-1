float hyp, adj, opp, theta, t1x, t2x, t3x, t1y, t2y, t3y;

void setup()
{
  size(300, 300);
  
  adj = 200.0f;
  theta = 35.0f;
  opp = tan(radians(theta))*adj;
  hyp = sqrt((opp * opp) + (adj * adj));

  println(hyp + "  Hyp");
  println(opp + "  Opposite");
  println(adj + "  Adjacent");
  
  t1x = 50.0f;
  t1y = height - 90.0f;
  t2x = t1x + adj;
  t2y = t1y;
  t3x = t2x;
  t3y = t2y - opp;

  line(t1x, t1y, t2x, t2y);
  line(t2x, t2y, t3x, t3y);
  line(t3x, t3y, t1x, t1y);
  
//  String sHyp = Float.toString(hyp);
//  String sOpp = Float.toString(opp);
//  String sAdj = Float.toString(adj);
}
