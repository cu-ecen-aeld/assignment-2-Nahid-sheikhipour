

#include <fcntl.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    openlog("writer", 0, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments");
        closelog();
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];
    size_t writelen = strlen(writestr);

    int fd = open(writefile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd == -1) {
        syslog(LOG_ERR, "Failed to open file: %s", writefile);
        close(fd);
        closelog();
        return 1;
    }

    ssize_t ret = write(fd, writestr, writelen);
    if (ret == -1 || (size_t)ret != writelen) {
        syslog(LOG_ERR, "Failed to write to file: %s", writefile);
        close(fd);
        closelog();
        return 1;
    }

    if (close(fd) == -1) {
        syslog(LOG_ERR, "Failed to close file: %s", writefile);
        
        closelog();
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    close(fd);
    closelog();
    return 0;
}
