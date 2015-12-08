FFT fft;

void audioVisualizerSetup()
{
  fft = new FFT(music.bufferSize(), music.sampleRate());
}

int AVStep = 8;

void audioVisualizerDraw()
{
  fft.forward(music.mix);
  
  stroke(255);
  for(int i = 0; i < fft.specSize(); i += AVStep)
  {
    if(i <= (fft.specSize() * 0.3f))
    {
      stroke(175, 0, 0);
    }
    else if (i <= (fft.specSize() * 0.6f))
    {
      stroke(175, 175, 0);
    }
    else
    {
      stroke(0, 175, 0);
    }
    line( i, height, i, height - fft.getBand(i) * AVStep);
  }
}


