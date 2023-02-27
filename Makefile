CXXFLAGS=-O3 -g
BINARIES=mtaproject
RGB_LIB_DISTRIBUTION=matrix
RGB_INCDIR=$(RGB_LIB_DISTRIBUTION)/include
RGB_LIBDIR=$(RGB_LIB_DISTRIBUTION)/lib
RGB_LIBRARY_NAME=rgbmatrix
RGB_LIBRARY=$(RGB_LIBDIR)/lib$(RGB_LIBRARY_NAME).a
LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
$(RGB_LIBRARY):
	$(MAKE) -C $(RGB_LIBDIR)

all : mtaproject

mtaproject : $(RGB_LIBRARY)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)

%.o : %.cc
	$(CXX) -I$(RGB_INCDIR) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(BINARIES)
	$(MAKE) -C $(RGB_LIBDIR) clean
