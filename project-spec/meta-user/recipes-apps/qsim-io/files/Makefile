APP = qsim-io

# Add any other object files to this list below
APP_OBJS = qsim-io.o debug_print.h

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ -pthread -static $(APP_OBJS) $(LDLIBS)

clean: 
	rm -f $(APP) 

