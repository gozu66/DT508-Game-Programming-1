FFT fft;

void audioVisualizerSetup()
{
  fft = new FFT(music.bufferSize(), music.sampleRate());
}

int AVStep = 8;
float audioOutput = 0;
float audioOutput2 = 0;

void audioVisualizerDraw()
{
  fft.forward(music.mix);
  audioOutput = fft.getBand(0);
  audioOutput2 = fft.getBand(60) * 20;
}

boolean brickIsHit;
int step = 1, step2 = 1, step3 = 1;

void drawBackground()
{
  step3 = (int)audioOutput + 1;
  step2 = (int)audioOutput2 + 1;
  
  step += 1;
  
  if (step % 15 == 0)
  {
    step = 1;
  }
  
  loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      if (y % step == 0)
      {
        if (!brickIsHit)
        {
          int loc = x + (y * width);
          color c  = color(step3, 0, step2);
          pixels[loc] = c;
        } 
        else
        {
          int loc = x + (y * width);
          color c  = color(255, 255, 255);
          pixels[loc] = c;
        }
      }
    }
  }
  brickIsHit = false;
  updatePixels();
}

