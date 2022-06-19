### cisco packet tracer ( network 수행평가 대비 )

###### ip config
```
시리얼 설정

R1(config)# int(interface) Se0/3/0
R1(config-if)# ip add ip~~~~~ gateway~~~
```

###### console 암호 설정
```
R1(config)# line con 0 
R1(config-line)# pass password!!
R1(config-line)# login
```
###### 콘솔 접속 메세지 설정
```
R1# conf t
R1(config)#
R1(config)# banner motd @
여기 안에 메세지를 쓰고 골뱅이로 닫음
@
```
###### 콘솔 로그인 설정
```
R1(config)# user username psasword password!!
R1(config# line con 0
R1(config)# login local
```

###### telnet 접속 허용 및 암호 설정
```
R1(config)# line vty 0 4        # 0 ~ 4 까지 5개 허용
R1(config-line)# pass psasword!!
R1(config-line)# login
```
###### 콘솔 및 텔넷 접속 시 메세지 보이도록 설정
```
R1(config)# line vty 0 4
R1(config-if)# motd-banner
R1(config-if)# exit
```

###### Privilege mode 접속하기
```enable pass password!!```

###### vlan 설정(IN 스위치)
```
switch(config)# vlan 10
switch(config-vlan)# name ex1
```
###### vlan 각 포트에 할당하기
```
switch(config)# int fa0/1      # 포트에 들어가는거
switch(config-if)# sw mode acc
switch(config-if)# sw acc vlan 10         # 10 은 vlan 번호
```

###### inter-vlan 할당
```
R1(config)# int fa0/0         # R1 fa0/0 포트에 sub interface 구성하는거임
R1(config-if)# no sh          # no shutdown = 연다
R1(config-if)# fa0/0.10       # vlan number 마지막껀
R1(config-subif)# encap dot1q 10
R1(config-subif)# ip add ip~~~~~ gateway~~~~        # 여기서 IP 마지막은 0을 넣어줘야됨 => xxx.xxx.xxx.0
R1(config-subif)# no sh
```

###### trank 설정( inter-valn 이 가능하도록 switch에서 vlan을 나눠주는 작업 )
```
switch(config)# int fa0/24    # 받고 있는 스위치의 포트 넘버
R1(config-if)# sw mode trunk
```

###### routing 설정( RIP V2 이용 )
```
R1(config)# rou rip
R1(config-router)# network xxx.xxx.vlan_number.0
```

###### sub mask 를 한다 = encap dot1q 포트번호

###### 정적 라우팅 구성시 받는 쪽에서 활성화 시켜야 하는 설정 ?
```
-- 받는 쪽--
ISP(config)# cdp run     # hostname 이 ISP 일뿐 router에서 하는거임

-- 보내는 쪽--
R1(config)# cdp run
R1(config)# do show cdp ne de      # 확인하는거
```
###### 원격 로그인(telnet) PC에서 R1으로 텔넷 설정
```
R1(config)# user user01 pass password!!
R1(config)# line vty 0 4
R1(config-if)# login local
```
###### R1에서 모든 암호를 인코딩되어 저장하게 설정하는 방법
```R1(config)# service password-encryption```
###### Port-security 설정
- s1의 fa0/3 포트에 PC가 연결될 예정
- port-security : 1대의 pc만 데이터를 주고 받을 수 있도록 설정 2대 이상 연결하면 바로 cut shutdown 하게 함
```
S1(config)# int fa0/3
S1(config-if)# sw mode acc
S1(config-if)# sw port           # port 
S1(config-if)# sw port max 1     # 최대치 1
S1(config)# sw port violation shutdown    # violation : 위반하다    즉 위반하면 shutdown 하는거임
```
