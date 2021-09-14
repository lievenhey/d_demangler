d_demangle:
	dmd -c demangle.d
	dmd -oflibd_demangle.so demangle.o -shared -defaultlib=libphobos2.so
