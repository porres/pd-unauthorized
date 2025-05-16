/*
** Copyright (C) 2000 Albert L. Faber
**  
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
** 
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
** 
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software 
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

#ifndef SIGMP3PLAY_H_INCLUDED
#define SIGMP3PLAY_H_INCLUDED

/* AUDIOBUFSIZE = n*64 with n=1,2,3 ...  */
#define    AUDIOBUFSIZE    16384

#define         FALSE                   0
#define         TRUE                    1
#define         SBLIMIT                 32
#define         SSLIMIT                 18
#define         MPG_MD_STEREO           0
#define         MPG_MD_JOINT_STEREO     1
#define         MPG_MD_DUAL_CHANNEL     2
#define         MPG_MD_MONO             3

#define MAXFRAMESIZE 1792
/* Pre Shift fo 16 to 8 bit converter table */
#define AUSHIFT (3)
#define BOOL int
#define MP3_EX  -2
#define MP3_ERR -1
#define MP3_OK  0
#define MP3_NEED_MORE 1

struct frame
  {
  int stereo;
  int jsbound;
  int single;
  int lsf;
  int mpeg25;
  int header_change;
  int lay;
  int error_protection;
  int bitrate_index;
  int sampling_frequency;
  int padding;
  int extension;
  int mode;
  int mode_ext;
  int copyright;
  int original;
  int emphasis;
  int framesize; /* computed framesize */
  };

struct mpstr
  {
  struct buf *head,*tail;
  int bsize;
  int framesize;
  int fsizeold;
  struct frame fr;
  unsigned char bsspace[2][MAXFRAMESIZE+512]; /* MAXFRAMESIZE */
  float hybrid_block[2][2][SBLIMIT*SSLIMIT];
  int hybrid_blc[2];
  unsigned long header;
  int bsnum;
  float synth_buffs[2][2][0x110];
  int  synth_bo;
  };

static const long freqs[9] = { 44100, 48000, 32000,
                  22050, 24000, 16000 ,
                  11025 , 12000 , 8000 };

BOOL InitMP3(struct mpstr *mp);
BOOL InitAgainMP3(struct mpstr *mp);
int  decodeMP3(struct mpstr *mp, char *inmemory,int inmemsize,char *outmemory,int outmemsize,int *done);
void ExitMP3(struct mpstr *mp);

int  decode_header (struct frame *fr,unsigned long newhead);

/* added remove_buf to support mpglib seeking */
static void remove_buf(struct mpstr *mp);

#endif
