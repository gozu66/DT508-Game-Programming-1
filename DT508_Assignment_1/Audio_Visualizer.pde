//AudioInput lineIn;
//
//void audioVisualizerSetup()
//{
//  lineIn = minim.getLineIn();
//  lineIn.enableMonitoring();
//}
//
//void audioVisualizerDraw()
//{
//  for(int i = 0; i < lineIn.bufferSize() - 1; i++) 
//  {
//    line(i, (height/2 - 100) + lineIn.left.get(i)*50, i + 1, (height/2 - 100) + lineIn.left.get(i+1)*50);
//    line(i, (height/2 + 100) + lineIn.right.get(i)*50, i + 1, (height/2 + 100) + lineIn.right.get(i+1)*50);
//  }
//}
