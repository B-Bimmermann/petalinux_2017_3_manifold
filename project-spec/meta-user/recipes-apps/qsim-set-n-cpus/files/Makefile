APP = qsim-set-n-cpus

# Add any other object files to this list below
APP_OBJS = qsim-set-n-cpus.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS)

