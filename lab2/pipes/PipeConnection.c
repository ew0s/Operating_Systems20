#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int fd[2];
    int result;
    size_t size;
    char resstring[14];

    // try to create pipe
    if (pipe(fd) < 0)
    {
        printf("Can\'t create a pipe\n");
        exit(-1);
    }

    // create a new proccess
    result = fork();
    if (result)
    {
        // if can't create a proccess then stop
        printf("Can\'t fork a child\n");
        exit(-1);
    }
    else if (result > 0) 
    {
        // we are in root proccess wich will send info to child proccess
        close(fd[0]);

        size = write(fd[1], "Hello world!", 14);
        if (size != 14)
        {
            printf("Can\'t write all string\n");
            exit(-1);
        }
        
        close(fd[1]);
        printf("Parent exit\n");
    }
    else
    {
        close(fd[1]);

        size = read(fd[0], resstring, 14);
        if (size < 0)
        {
            printf("Can\'t read a string");
            exit(-1);
        }

        printf("%s\n", resstring);
        close(fd[0]);
    }

    return 0;
}
