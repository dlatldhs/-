### fcntl flock -> linux file lock 거는거

```
#include <unistd.h>
#include <fcntl.h>
 
int fcntl(int fd, int cmd);
int fcntl(int fd, int cmd, long arg);
int fcntl(int fd, int cmd, struct flock* lock);
```
마지막 줄의 함수 형태가 레코드 잠금을 위해서 사용되는 형태임

###### flock 이라는 변수가 있는데 이 구조체는 파일 레코드 잠금을 위해 필요한 여러가지 정보 즉 잠금의 형태 어디서부터 어디까지 잠글 것인지 몇 바이트 크기 만큼을 잠글것인지 등의 다양한 정보를 설정할 수 있다.

#### flock의 구조체
```
struct flock
{
    short int l_type;   /* 잠김 타입: F_RDLCK, F_WRLCK, or F_UNLCK.  */
    short int l_whence; /* 파일의 절대적 위치 */
    __off_t l_start;    /* 파일의 offset */ 
    __off_t l_len;      /* 잠그고자 하는 파일의 길이 */
    __pid_t l_pid;      /* 잠그을 얻은 프로세스의 pid */
};
```
##### `flock.l_type` 은 `F_RDLCK` 하고 `F_WRLCK` 하고 `F_UNLCK` 3가지로 세팅 가능함
- ###### F_RDLCK 하고 F_WRLCK 는 읽기와 쓰기 전용으로 잠금이 걸린 상태를 뜻함
- ###### F_UNLCK 은 잠금이 걸려있지 않은 상태를 뜻함
- ###### I_start : I_whence 에서 이동한 거리 즉 오프셋(offset)을 뜻함
- ###### I_len : 잠금할 크키
```ex) I_whence = SEEK_SET , I_start =16 이라면 레코드의 위치는 처음 +16 이므로 16번째가 된다. I_len이 16이라고 가정하면 16번째 줄부터 32째 줄까지 데이터 블록을 뜻하게 될 것이다.
``` 
- ###### F_GETLK : 잠금이 있는지 없는지 검사 => 잠금 X flock.I_tpye 을 F_UNLCK 로 설정
- ###### F_SETLK : flock 구조체에 설정된 잠금을 얻음 / 혹은 잠금을 풀기 위해 사용됨
- ###### F_SETLKW : F_SETLK 와 같은 일을 하지만 error를 리던하는 대신 잠금이 풀릴때까지 해당영역에서 기다림 F_SETLK의 봉쇄형 역할을 가지고 있음

##### 예제 코드
 
```
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
 
int fd_lock(int fd);
int fd_open(int fd);
int fd_isopen(int fd);
 
int main()
{
    int fd;
    int n_read;
    char buf[11];
    char wbuf[11];
 
    fd = open("counter.txt", O_CREAT|O_RDWR); 
    if (fd == -1)
    {
        perror("file open error : ");
        exit(0);
    }
    if (fd_isopen(fd) == -1)
    {
        perror("file is lock "); 
        exit(0);
    }
    printf("I get file lock\n");
 
    memset(buf, 0x00, 11);
    memset(wbuf, 0x00, 11);
    if ((n_read = read(fd, buf, 11)) > 0)
    {
        printf("%s\n", buf); 
    }
 
    // 처음위치로 되돌린다. 
    lseek(fd, 0, SEEK_SET);
    sprintf(wbuf, "%d", atoi(buf) + 1);
    write(fd, wbuf, 11);
    
    // 숫자외의 필요없는 부분을 자른다.  
    ftruncate(fd, strlen(wbuf)); 
    // 10 초를 쉰다. 
    sleep(10);
 
    // 파일잠김을 푼다. 
    if (fd_unlock(fd) == -1)
    {
        perror("file unlock error ");
    }
    printf("file unlock success\n");
    sleep(5);
 
    close(fd);
}
 
// 파일이 잠겨있는지 확인하고 잠겨 있지 않으면
// 잠금을 얻고 
// 잠겨 있을경우 잠김이 풀릴때까지 기다린다(F_SETLKW) 
int fd_isopen(int fd)
{
    struct flock lock;
 
    lock.l_type = F_WRLCK; 
    lock.l_start = 0;
    lock.l_whence = SEEK_SET;
    lock.l_len = 0;
 
    return fcntl(fd, F_SETLKW, &lock);
}
 
// 파일 잠금을 얻은후 모든 작업이 끝난다면 
// 파일 잠금을 돌려준다. 
int fd_unlock(int fd)
{
    struct flock lock;
 
    lock.l_type = F_UNLCK; 
    lock.l_start = 0;
    lock.l_whence = SEEK_SET;
    lock.l_len = 0;
 
    return fcntl(fd, F_SETLK, &lock);
}
```
##### 실행결과
```
host04@ubuntu:~/class/linux_class/homework$ ./fcntl_test
I get file lock
1

file unlock success
host04@ubuntu:~/class/linux_class/homework$
host04@ubuntu:~/class/linux_class/homework$
```
