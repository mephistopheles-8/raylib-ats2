PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

RMF=rm -f

PATSCC=$(PATSHOMEQ)/bin/patscc

PATSFLAGS=-DATS_MEMALLOC_LIBC
CFLAGS=-O2 `pkg-config --cflags raylib`
LFLAGS=`pkg-config --libs raylib`

all:: test01
test01: test01.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) test01

all:: test02
test02: test02.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) test02

all:: test03
test03: test03.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS)  -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) test03

cleanall:: ; $(RMF) *_*ats.c

clean:: cleanall

