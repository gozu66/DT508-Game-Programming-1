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
//  println(audioOutput);
}

