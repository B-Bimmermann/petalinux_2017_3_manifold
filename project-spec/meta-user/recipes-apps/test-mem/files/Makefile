APP = test-mem

# Add any other object files to this list below
APP_OBJS = test-mem.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ -pthread -static $(APP_OBJS) $(LDLIBS)


