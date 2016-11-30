#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<arpa/inet.h>
#include<sys/socket.h>
 
#define PORT 1337
 
int main(void) {
    struct sockaddr_in si_other;
    int s, slen=sizeof(si_other);
    char message[2];
	message[0] = 'H';
	message[1] = '\n';
 
    if ( (s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1) {
	fprintf(stderr, "Socket creation failed!\n");
	exit(1);
    }
 
    memset((char *) &si_other, 0, sizeof(si_other));
    si_other.sin_family = AF_INET;
    si_other.sin_port = htons(PORT);
     
    if (inet_aton(SERVER , &si_other.sin_addr) == 0) {
        fprintf(stderr, "inet_aton() failed\n");
        exit(1);
    }

    for (int i = 0; i < 1000000; i++) {
    if (sendto(s, message, strlen(message) , 0 , (struct sockaddr *) &si_other, slen)==-1) {
        fprintf(stderr, "sendto() failed\n");
    }
    }
 
    close(s);
    return 0;
}

