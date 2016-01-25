FFT fft;

void audioVisualizerSetup()
{
  fft = new FFT(music.bufferSize(), music.sampleRate());
}

int AVStep = 8;
float audioOutput = 0;

void audioVisualizerDraw()
{
  fft.forward(music.mix);
  audioOutput = fft.getBand(0) * 4;
  println(audioOutput);
}

