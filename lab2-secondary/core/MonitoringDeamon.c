#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

#include <sys/wait.h>
#include <sys/stat.h>
#include <sys/types.h>

#define CHLD_NEED_WORK      1
#define CHLD_NEED_TERMINATE 2

int MonitorProc();
void SetPidFile();
void WriteLog(const char* info, ...);
int WorkProc();

void SetPidFile()
{

}

void WriteLog(const char* info, ...)
{

}

int WorkProc()
{
    return 0;
}



int main()
{
    pid_t pid = fork();

    if (pid == -1)
    {
        // error to log
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

        int status = MonitorProc();
        
        return status;
    }
    else 
    {
        return 0;
    }
}

int MonitorProc()
{
    pid_t     pid;
    int       status;
    int       needExecute = 1;
    sigset_t sigset;
    siginfo_t siginfo;

    sigemptyset(&sigset);

    sigaddset(&sigset, SIGQUIT);
    sigaddset(&sigset, SIGINT);
    sigaddset(&sigset, SIGTERM);
    sigaddset(&sigset, SIGCHLD);

    sigaddset(&sigset, SIGUSR1);
    sigprocmask(SIG_BLOCK, &sigset, NULL);

    SetPidFile();

    for(;;)
    {
        if (needExecute)
        {
            pid = fork();
        }

        needExecute = 1;

        if (pid == -1)
        {
            WriteLog("[MONITOR] Fork failed (%s)\n", strerror(errno));
        }
        else if (!pid) 
        {
            status = WorkProc();
            exit(status);
        }
        else 
        {
            sigwait(&sigset, &siginfo);

            if (siginfo.si_signo == SIGCHLD)
            {
                wait(&status);
                status = WEXITSTATUS(status);

                if (status == CHLD_NEED_TERMINATE)
                {
                    WriteLog("[MONITOR] Child stopped\n");
                    break;
                }
                else if (status == CHLD_NEED_WORK)
                {
                    WriteLog("[MONITOR] Child restart\n");
                }
            }
            else if (siginfo.si_signo == SIGUSR1) 
            {
                kill(pid, SIGUSR1);
                needExecute = 0;
            }
            else 
            {
                WriteLog("[MONITOR] Signal %s\n", strsignal(siginfo.si_signo));
                kill(pid, SIGTERM);
                status = 0;
                break;
            }
        }
    }

    WriteLog("[MONITOR] Stopped\n");
    // unlink(PID_FILE);
    return status;
}
