#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

#include <sys/socket.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <netinet/in.h>

int main()
{
    //creat a socket
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (client_socket == -1)
    {
        perror("UNABLE TO CREATE CLIENT SOCKET");
        exit(-1);
    }

    //specify the address for the socket
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(9002);
    server_address.sin_addr.s_addr = INADDR_ANY;

    int connection_status = connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address));

    if (connection_status == -1)
    {
        perror("UNABLE TO CONNECT TO SERVER SOCKET");
        exit(-1);
    }

    //recieve data from server
    char server_response[1024];
    read(client_socket, server_response, 1024);
    char* client_message = "TEST FROM CLIENT";
    send(client_socket, client_message, strlen(client_message), 0);

    printf("THE SERVER SENT: %s", server_response);

    close(client_socket);

    return 0;
}

int DeamonCreate()
{
    pid_t pid;
    pid = fork();

    if (pid == -1)
    {
        perror("UNABLE TO CREATE DEAMON");
        exit(-1);
    }
    else if (!pid)
    {
        umask(0); 
        setsid();
        chdir("/");

        close(STDIN_FILENO);
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
    }
    else 
    {
        printf("PARENT CLOSED");
    }

    return 0;
}
