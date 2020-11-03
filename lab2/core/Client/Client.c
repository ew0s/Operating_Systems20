#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>

#include <sys/socket.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <netinet/in.h>

#define LOG_PATH "/usr/local/var/Log"

int LOG_DESCRIPTOR;

void ConfigureClient();

int main()
{
    ConfigureClient();
    //creat a socket
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (client_socket == -1)
    {
        char* client_message = "UNABLE TO CREATE CLIENT SOCKET\n";
        write(LOG_DESCRIPTOR, client_message, sizeof(client_message));
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
        char* client_message = "UNABLE TO CONNECT TO SERVER SOCKET\n";
        write(LOG_DESCRIPTOR, client_message, sizeof(client_message));
        exit(-1);
    }

    close(client_socket);
    return 0;
}

void ConfigureClient()
{
    LOG_DESCRIPTOR = open(LOG_PATH, O_WRONLY);
    if (LOG_DESCRIPTOR == -1)
    {
        perror("UNABLE TO CREATE LOG FILE\nCLIENT PROCESS TERMINATED\n");
        exit(-1);
    }
}
