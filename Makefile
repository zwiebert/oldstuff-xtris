CXXFLAGS=-Wall -g -I/usr/X11R6/include -Wno-unused


xt_cppflags= -DPF_VIEW=Xt_Play_Field_View -DPF_CTRL=Xt_Play_Field_Control
xtobjs= framework.o gui_xt.o main.o mvc.o playfield.o
xtlibs= -L/usr/X11R6/lib -lXt -lXaw -lXmu -lX11

x_cppflags= -DPF_VIEW=X_Play_Field_View -DPF_CTRL=X_Play_Field_Control
xobjs= framework.o gui_x.o main.o mvc.o playfield.o
xlibs= -L/usr/X11R6/lib -lX11

CPPFLAGS=$(xt_cppflags)
objs=$(xtobjs)
libs=$(xtlibs)

sources=Makefile TODO arch.txt design.txt dummies.hh framework.cc framework.hh\
 gelernt.txt gui_x.cc gui_x.hh gui_xt.cc gui_xt.hh main.cc mvc.cc mvc.hh\
 playfield.cc playfield.hh stones.hh



tetris: $(objs)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) --enable-auto-import $(objs) -o tetris $(libs)

framework.o: framework.cc framework.hh mvc.hh
gui_x.o: gui_x.cc gui_x.hh framework.hh mvc.hh
gui_xt.o: gui_xt.cc gui_xt.hh framework.hh mvc.hh
main.o: main.cc dummies.hh framework.hh mvc.hh playfield.hh gui_xt.hh \
 stones.hh
mvc.o: mvc.cc mvc.hh
playfield.o: playfield.cc playfield.hh framework.hh mvc.hh

# Src Distribitions
src.tar.gz: $(sources)
	tar -czf src.tar.gz $(sources)

#src.tar: $(sources)
#	tar -cf src.tar $(sources)
#%.gz:%
#	gzip -f $<
#
