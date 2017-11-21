APP = test-inst

# Add any other object files to this list below
APP_OBJS = test-inst.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ -pthread -static $(APP_OBJS) $(LDLIBS)


