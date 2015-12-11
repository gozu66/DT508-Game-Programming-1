FFT fft;

void audioVisualizerSetup()
{
  fft = new FFT(music.bufferSize(), music.sampleRate());
}

int AVStep = 8;

void audioVisualizerDraw()
{
  fft.forward(music.mix);
  float inc = 4;

  noStroke();
  for(int i = 0; i < fft.specSize() - 113; i++)
  {
    if(i <= (fft.specSize() * 0.3f))
    {
      stroke(175, 0, 0);
//      fill(175, 0, 0);
    }
    else if (i <= (fft.specSize() * 0.6f))
    {
      stroke(175, 175, 0);
//      fill(175, 175, 0);
    }
    else
    {
      stroke(0, 175, 0);
//        fill(0, 175, 0);
    }
    line( i, height, i, height - fft.getBand(i) * AVStep);
  }
  
//  println(fft.specSize());
}


