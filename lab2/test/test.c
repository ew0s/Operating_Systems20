#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

#define NAMED_PIPE_NAME "/tmp/my_named_pipe"
#define BUFSIZE         50

int main(int argc, char ** argv)
{
    int fd, len;
    char buf[BUFSIZE];

    if (mkfifo(NAMED_PIPE_NAME, 0777))
    {
        perror("mkfifo");
        return 1;
    }
    printf("%s is created\n", NAMED_PIPE_NAME);

    if ( (fd = open(NAMED_PIPE_NAME, O_RDONLY) ) <= 0)
    {
        perror("open");
        return 1;
    }
    printf("%s is opened\n", NAMED_PIPE_NAME);

    do
    {
        memset(buf, '\0', BUFSIZE - 1);
        if ( (len = read(fd, buf, BUFSIZE - 1) ) <= 0)
        {
            perror("read");
            close(fd);
            remove(NAMED_PIPE_NAME);
            return 0;
        }
        printf("Incomming message (%d): %s\n", len, buf);
    } while (1);
}
