#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>

#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/types.h>

#include <netinet/in.h>

void StartApp();

int main()
{
    int file = open("/home/PSAppLog.txt", O_RDWR, O_CREAT);
    if (file < 0)
    {
        perror("UNABLE TO CREATE FILE");
        exit(-1);
    }
    // create the server socket
    int server_socket;
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1)
    {
        perror("UNABLE TO CREATE SOCKET FOR SERVER");
        exit(-1);
    }

    // define the server address
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(9002);
    server_address.sin_addr.s_addr = INADDR_ANY;

    // bind the socket to our specified IP and port
    if (bind(server_socket, (struct sockaddr *) &server_address, sizeof(server_address)) == -1)
    {
        perror("UNABLE TO BIND SERVER SOCKET");
        exit(-1);
    }

    if (listen(server_socket, 5) == -1)
    {
        perror("UNABLE TO LISTEN SERVER SOCKET");
        exit(-1);
    }

    int client_socket;
    client_socket = accept(server_socket, NULL, NULL);
    if (client_socket < 0)
    {
        perror("UNABLE TO ACCEPT CLENT SOCKET AND SERVER SOCKET");
        exit(-1);
    }

    StartApp();

    char* server_message = "TEST FROM SERVER";
    send(client_socket, server_message, strlen(server_message), 0);
    char client_response[1024];
    read(client_socket, client_response, 1024);

    printf("THE CLIENT SENT: %s\n", client_response);

    close(server_socket);

    return 0;
}

void StartApp()
{
    pid_t pid;
    pid = fork();

    if (pid == -1)
    {

    }
}
