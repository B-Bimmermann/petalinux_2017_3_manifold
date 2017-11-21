APP = mark-app

# Add any other object files to this list below
APP_OBJS = mark-app.o debug_print.h

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ -pthread -static $(APP_OBJS) $(LDLIBS)


