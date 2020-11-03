#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>

#include <sys/wait.h>
#include <sys/syslog.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/types.h>

#include <netinet/in.h>

int LOG_DESCRIPTOR;

void ConfigureServer();

int main()
{
    ConfigureServer();

    // create the server socket
    int server_socket;
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1)
    {
        char* server_message = "UNABLE TO CREATE SOCKET FOR SERVER\n";
        write(LOG_DESCRIPTOR, server_message, sizeof(server_message));
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
        char* server_message = "UNABLE TO BIND SERVER SOCKET\n";
        write(LOG_DESCRIPTOR, server_message, sizeof(server_message));
        exit(-1);
    }

    if (listen(server_socket, 5) == -1)
    {
        char* server_message = "UNABLE TO LISTEN SERVER SOCKET\n"; 
        write(LOG_DESCRIPTOR, server_message, sizeof(server_message));
        exit(-1);
    }

    int client_socket;
    client_socket = accept(server_socket, NULL, NULL);
    if (client_socket < 0)
    {
        char* server_message = "UNABLE TO ACCEPT CLENT SOCKET AND SERVER SOCKET\n";
        write(LOG_DESCRIPTOR, server_message, sizeof(server_message));
        exit(-1);
    }

    // fork to execute creating monitoring deamon function;
    pid_t pid = fork();

    if (pid == -1)
    {
        char* message = "UNABLE TO CREATE DEAMON PROCESS\n";
        write(LOG_DESCRIPTOR, message, sizeof(message));
        exit(-1);
    }
    else if (!pid)
    {
        execl("../../MakeFiles/monitoringdeamon", NULL);
    }
    else 
    {
        close(server_socket);
        return 0;
    }
}

void ConfigureServer()
{
    LOG_DESCRIPTOR = creat("/usr/local/var/Log", S_IRWXU);
    if (LOG_DESCRIPTOR == -1)
    {
        perror("UNABLE TO CREATE LOG FILE\nSERVER PROCESS TERMINATED\n");
        exit(-1);
    }
}
