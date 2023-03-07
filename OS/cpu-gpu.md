### CPU 와 GPU
Central processing unit
graphics processing unit
옛날에는 cpu가 주로 계산에 쓰이고
Gpu는 그림 출력 같은 것에만 쓰이는데

이제는 Gpu가 계산에도 쓰일 수 있음

2003년 이전 single core cpu
core -> ALU(Arithmetic-logic unit
cu는 alu를 제어

multi-core cpu -> 2 ~ 32+ cores
many-core gpu -> 1024 ~ 8192 +cores

병렬 컴퓨팅 Parallel computing
ubiquitous : 언제 어디서나 병렬 컴퓨팅이됨

hw 는 이미 parallel device 즉 병렬기기 but
sw 는 아직 sequential processing 순차 처리 함

전자 속도 = 광속(light speed) = 3 * 10^8 m/sec

3 GHz CPU 기준
1 clock 소요 시간 1/3*10^9 sec
전자 이동거리(1 clock 당)
3*10^8 / 3*10^9 => 10cm

이게 10 GHz CPu 기준으로 3cm 임

즉 CPU 클럭을 올리는 것은 이미 한계임

CPU는 반응 시간 latency 단축을 목표로 함 => 코어 성능 증가 , 캐쉬 큼 , ALU도 큼
GPU는 처리량을 확대하는데 집중함 => 코어 숫자 증가 , 캐쉬 조금만 , ALU 개수가 많음

MPC분야
MPC 란 대규모 병렬 처리
Massively parallel processing

model = device + programming language + compiler + lib
OpenMP(Open Multi-processing) 멀티 코어 CPU 용 , visual studio 사용 가능 , 최근 gpu로 확장 중
CUDA(쿠다 , Compute Unified Device Architecture) : NVIDIA GPU 전용 => 현재는 클라우드 컴퓨팅 , 딥러닝 초반 발전
OpenCL( Open Computing language ,CPU GPU FPGA 모두 제공, 범용성 , 가장 복잡)
