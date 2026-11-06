#include <stdio.h>
#include <unistd.h>

int main(void) {
    printf("Hello C CI/CD! pid=%d\n", getpid());
    fflush(stdout);

    /* 常驻进程：容器型服务的正常形态，退出会被 kubelet 判为异常并重启 */
    while (1) {
        sleep(60);
    }

    return 0;
}
