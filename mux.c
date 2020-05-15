#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char **argv)
{
  av_register_all();
  avformat_open_input();
  avformat_find_stream_info();
  av_read_frame();
  avformat_close_input();
  return 0;
}
