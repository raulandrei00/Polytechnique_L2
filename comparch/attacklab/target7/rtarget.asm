
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e1 9f 00 00 	mov    0x9fe1(%rip),%rax        # 40aff0 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 9f 00 00    	pushq  0x9fe2(%rip)        # 40b008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 9f 00 00    	jmpq   *0x9fe4(%rip)        # 40b010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <strcasecmp@plt>:
  401030:	ff 25 e2 9f 00 00    	jmpq   *0x9fe2(%rip)        # 40b018 <strcasecmp@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	pushq  $0x0
  40103b:	e9 e0 ff ff ff       	jmpq   401020 <.plt>

0000000000401040 <__errno_location@plt>:
  401040:	ff 25 da 9f 00 00    	jmpq   *0x9fda(%rip)        # 40b020 <__errno_location@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	pushq  $0x1
  40104b:	e9 d0 ff ff ff       	jmpq   401020 <.plt>

0000000000401050 <srandom@plt>:
  401050:	ff 25 d2 9f 00 00    	jmpq   *0x9fd2(%rip)        # 40b028 <srandom@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	pushq  $0x2
  40105b:	e9 c0 ff ff ff       	jmpq   401020 <.plt>

0000000000401060 <strncpy@plt>:
  401060:	ff 25 ca 9f 00 00    	jmpq   *0x9fca(%rip)        # 40b030 <strncpy@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	pushq  $0x3
  40106b:	e9 b0 ff ff ff       	jmpq   401020 <.plt>

0000000000401070 <strncmp@plt>:
  401070:	ff 25 c2 9f 00 00    	jmpq   *0x9fc2(%rip)        # 40b038 <strncmp@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	pushq  $0x4
  40107b:	e9 a0 ff ff ff       	jmpq   401020 <.plt>

0000000000401080 <strcpy@plt>:
  401080:	ff 25 ba 9f 00 00    	jmpq   *0x9fba(%rip)        # 40b040 <strcpy@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	pushq  $0x5
  40108b:	e9 90 ff ff ff       	jmpq   401020 <.plt>

0000000000401090 <puts@plt>:
  401090:	ff 25 b2 9f 00 00    	jmpq   *0x9fb2(%rip)        # 40b048 <puts@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	pushq  $0x6
  40109b:	e9 80 ff ff ff       	jmpq   401020 <.plt>

00000000004010a0 <write@plt>:
  4010a0:	ff 25 aa 9f 00 00    	jmpq   *0x9faa(%rip)        # 40b050 <write@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	pushq  $0x7
  4010ab:	e9 70 ff ff ff       	jmpq   401020 <.plt>

00000000004010b0 <strlen@plt>:
  4010b0:	ff 25 a2 9f 00 00    	jmpq   *0x9fa2(%rip)        # 40b058 <strlen@GLIBC_2.2.5>
  4010b6:	68 08 00 00 00       	pushq  $0x8
  4010bb:	e9 60 ff ff ff       	jmpq   401020 <.plt>

00000000004010c0 <mmap@plt>:
  4010c0:	ff 25 9a 9f 00 00    	jmpq   *0x9f9a(%rip)        # 40b060 <mmap@GLIBC_2.2.5>
  4010c6:	68 09 00 00 00       	pushq  $0x9
  4010cb:	e9 50 ff ff ff       	jmpq   401020 <.plt>

00000000004010d0 <printf@plt>:
  4010d0:	ff 25 92 9f 00 00    	jmpq   *0x9f92(%rip)        # 40b068 <printf@GLIBC_2.2.5>
  4010d6:	68 0a 00 00 00       	pushq  $0xa
  4010db:	e9 40 ff ff ff       	jmpq   401020 <.plt>

00000000004010e0 <memset@plt>:
  4010e0:	ff 25 8a 9f 00 00    	jmpq   *0x9f8a(%rip)        # 40b070 <memset@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	pushq  $0xb
  4010eb:	e9 30 ff ff ff       	jmpq   401020 <.plt>

00000000004010f0 <alarm@plt>:
  4010f0:	ff 25 82 9f 00 00    	jmpq   *0x9f82(%rip)        # 40b078 <alarm@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	pushq  $0xc
  4010fb:	e9 20 ff ff ff       	jmpq   401020 <.plt>

0000000000401100 <close@plt>:
  401100:	ff 25 7a 9f 00 00    	jmpq   *0x9f7a(%rip)        # 40b080 <close@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	pushq  $0xd
  40110b:	e9 10 ff ff ff       	jmpq   401020 <.plt>

0000000000401110 <read@plt>:
  401110:	ff 25 72 9f 00 00    	jmpq   *0x9f72(%rip)        # 40b088 <read@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	pushq  $0xe
  40111b:	e9 00 ff ff ff       	jmpq   401020 <.plt>

0000000000401120 <strcmp@plt>:
  401120:	ff 25 6a 9f 00 00    	jmpq   *0x9f6a(%rip)        # 40b090 <strcmp@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	pushq  $0xf
  40112b:	e9 f0 fe ff ff       	jmpq   401020 <.plt>

0000000000401130 <signal@plt>:
  401130:	ff 25 62 9f 00 00    	jmpq   *0x9f62(%rip)        # 40b098 <signal@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	pushq  $0x10
  40113b:	e9 e0 fe ff ff       	jmpq   401020 <.plt>

0000000000401140 <gethostbyname@plt>:
  401140:	ff 25 5a 9f 00 00    	jmpq   *0x9f5a(%rip)        # 40b0a0 <gethostbyname@GLIBC_2.2.5>
  401146:	68 11 00 00 00       	pushq  $0x11
  40114b:	e9 d0 fe ff ff       	jmpq   401020 <.plt>

0000000000401150 <fprintf@plt>:
  401150:	ff 25 52 9f 00 00    	jmpq   *0x9f52(%rip)        # 40b0a8 <fprintf@GLIBC_2.2.5>
  401156:	68 12 00 00 00       	pushq  $0x12
  40115b:	e9 c0 fe ff ff       	jmpq   401020 <.plt>

0000000000401160 <strtol@plt>:
  401160:	ff 25 4a 9f 00 00    	jmpq   *0x9f4a(%rip)        # 40b0b0 <strtol@GLIBC_2.2.5>
  401166:	68 13 00 00 00       	pushq  $0x13
  40116b:	e9 b0 fe ff ff       	jmpq   401020 <.plt>

0000000000401170 <memcpy@plt>:
  401170:	ff 25 42 9f 00 00    	jmpq   *0x9f42(%rip)        # 40b0b8 <memcpy@GLIBC_2.14>
  401176:	68 14 00 00 00       	pushq  $0x14
  40117b:	e9 a0 fe ff ff       	jmpq   401020 <.plt>

0000000000401180 <prctl@plt>:
  401180:	ff 25 3a 9f 00 00    	jmpq   *0x9f3a(%rip)        # 40b0c0 <prctl@GLIBC_2.2.5>
  401186:	68 15 00 00 00       	pushq  $0x15
  40118b:	e9 90 fe ff ff       	jmpq   401020 <.plt>

0000000000401190 <time@plt>:
  401190:	ff 25 32 9f 00 00    	jmpq   *0x9f32(%rip)        # 40b0c8 <time@GLIBC_2.2.5>
  401196:	68 16 00 00 00       	pushq  $0x16
  40119b:	e9 80 fe ff ff       	jmpq   401020 <.plt>

00000000004011a0 <random@plt>:
  4011a0:	ff 25 2a 9f 00 00    	jmpq   *0x9f2a(%rip)        # 40b0d0 <random@GLIBC_2.2.5>
  4011a6:	68 17 00 00 00       	pushq  $0x17
  4011ab:	e9 70 fe ff ff       	jmpq   401020 <.plt>

00000000004011b0 <munmap@plt>:
  4011b0:	ff 25 22 9f 00 00    	jmpq   *0x9f22(%rip)        # 40b0d8 <munmap@GLIBC_2.2.5>
  4011b6:	68 18 00 00 00       	pushq  $0x18
  4011bb:	e9 60 fe ff ff       	jmpq   401020 <.plt>

00000000004011c0 <memmove@plt>:
  4011c0:	ff 25 1a 9f 00 00    	jmpq   *0x9f1a(%rip)        # 40b0e0 <memmove@GLIBC_2.2.5>
  4011c6:	68 19 00 00 00       	pushq  $0x19
  4011cb:	e9 50 fe ff ff       	jmpq   401020 <.plt>

00000000004011d0 <fopen@plt>:
  4011d0:	ff 25 12 9f 00 00    	jmpq   *0x9f12(%rip)        # 40b0e8 <fopen@GLIBC_2.2.5>
  4011d6:	68 1a 00 00 00       	pushq  $0x1a
  4011db:	e9 40 fe ff ff       	jmpq   401020 <.plt>

00000000004011e0 <perror@plt>:
  4011e0:	ff 25 0a 9f 00 00    	jmpq   *0x9f0a(%rip)        # 40b0f0 <perror@GLIBC_2.2.5>
  4011e6:	68 1b 00 00 00       	pushq  $0x1b
  4011eb:	e9 30 fe ff ff       	jmpq   401020 <.plt>

00000000004011f0 <getopt@plt>:
  4011f0:	ff 25 02 9f 00 00    	jmpq   *0x9f02(%rip)        # 40b0f8 <getopt@GLIBC_2.2.5>
  4011f6:	68 1c 00 00 00       	pushq  $0x1c
  4011fb:	e9 20 fe ff ff       	jmpq   401020 <.plt>

0000000000401200 <strtoul@plt>:
  401200:	ff 25 fa 9e 00 00    	jmpq   *0x9efa(%rip)        # 40b100 <strtoul@GLIBC_2.2.5>
  401206:	68 1d 00 00 00       	pushq  $0x1d
  40120b:	e9 10 fe ff ff       	jmpq   401020 <.plt>

0000000000401210 <gethostname@plt>:
  401210:	ff 25 f2 9e 00 00    	jmpq   *0x9ef2(%rip)        # 40b108 <gethostname@GLIBC_2.2.5>
  401216:	68 1e 00 00 00       	pushq  $0x1e
  40121b:	e9 00 fe ff ff       	jmpq   401020 <.plt>

0000000000401220 <sprintf@plt>:
  401220:	ff 25 ea 9e 00 00    	jmpq   *0x9eea(%rip)        # 40b110 <sprintf@GLIBC_2.2.5>
  401226:	68 1f 00 00 00       	pushq  $0x1f
  40122b:	e9 f0 fd ff ff       	jmpq   401020 <.plt>

0000000000401230 <exit@plt>:
  401230:	ff 25 e2 9e 00 00    	jmpq   *0x9ee2(%rip)        # 40b118 <exit@GLIBC_2.2.5>
  401236:	68 20 00 00 00       	pushq  $0x20
  40123b:	e9 e0 fd ff ff       	jmpq   401020 <.plt>

0000000000401240 <connect@plt>:
  401240:	ff 25 da 9e 00 00    	jmpq   *0x9eda(%rip)        # 40b120 <connect@GLIBC_2.2.5>
  401246:	68 21 00 00 00       	pushq  $0x21
  40124b:	e9 d0 fd ff ff       	jmpq   401020 <.plt>

0000000000401250 <fwrite@plt>:
  401250:	ff 25 d2 9e 00 00    	jmpq   *0x9ed2(%rip)        # 40b128 <fwrite@GLIBC_2.2.5>
  401256:	68 22 00 00 00       	pushq  $0x22
  40125b:	e9 c0 fd ff ff       	jmpq   401020 <.plt>

0000000000401260 <getc@plt>:
  401260:	ff 25 ca 9e 00 00    	jmpq   *0x9eca(%rip)        # 40b130 <getc@GLIBC_2.2.5>
  401266:	68 23 00 00 00       	pushq  $0x23
  40126b:	e9 b0 fd ff ff       	jmpq   401020 <.plt>

0000000000401270 <socket@plt>:
  401270:	ff 25 c2 9e 00 00    	jmpq   *0x9ec2(%rip)        # 40b138 <socket@GLIBC_2.2.5>
  401276:	68 24 00 00 00       	pushq  $0x24
  40127b:	e9 a0 fd ff ff       	jmpq   401020 <.plt>

Disassembly of section .text:

0000000000402000 <_start>:
  402000:	f3 0f 1e fa          	endbr64 
  402004:	31 ed                	xor    %ebp,%ebp
  402006:	49 89 d1             	mov    %rdx,%r9
  402009:	5e                   	pop    %rsi
  40200a:	48 89 e2             	mov    %rsp,%rdx
  40200d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  402011:	50                   	push   %rax
  402012:	54                   	push   %rsp
  402013:	45 31 c0             	xor    %r8d,%r8d
  402016:	31 c9                	xor    %ecx,%ecx
  402018:	48 c7 c7 d6 25 40 00 	mov    $0x4025d6,%rdi
  40201f:	ff 15 bb 8f 00 00    	callq  *0x8fbb(%rip)        # 40afe0 <__libc_start_main@GLIBC_2.34>
  402025:	f4                   	hlt    
  402026:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40202d:	00 00 00 

0000000000402030 <_dl_relocate_static_pie>:
  402030:	f3 0f 1e fa          	endbr64 
  402034:	c3                   	retq   
  402035:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40203c:	00 00 00 
  40203f:	90                   	nop

0000000000402040 <deregister_tm_clones>:
  402040:	48 8d 3d 51 99 00 00 	lea    0x9951(%rip),%rdi        # 40b998 <__TMC_END__>
  402047:	48 8d 05 4a 99 00 00 	lea    0x994a(%rip),%rax        # 40b998 <__TMC_END__>
  40204e:	48 39 f8             	cmp    %rdi,%rax
  402051:	74 15                	je     402068 <deregister_tm_clones+0x28>
  402053:	48 8b 05 8e 8f 00 00 	mov    0x8f8e(%rip),%rax        # 40afe8 <_ITM_deregisterTMCloneTable>
  40205a:	48 85 c0             	test   %rax,%rax
  40205d:	74 09                	je     402068 <deregister_tm_clones+0x28>
  40205f:	ff e0                	jmpq   *%rax
  402061:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402068:	c3                   	retq   
  402069:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402070 <register_tm_clones>:
  402070:	48 8d 3d 21 99 00 00 	lea    0x9921(%rip),%rdi        # 40b998 <__TMC_END__>
  402077:	48 8d 35 1a 99 00 00 	lea    0x991a(%rip),%rsi        # 40b998 <__TMC_END__>
  40207e:	48 29 fe             	sub    %rdi,%rsi
  402081:	48 89 f0             	mov    %rsi,%rax
  402084:	48 c1 ee 3f          	shr    $0x3f,%rsi
  402088:	48 c1 f8 03          	sar    $0x3,%rax
  40208c:	48 01 c6             	add    %rax,%rsi
  40208f:	48 d1 fe             	sar    %rsi
  402092:	74 14                	je     4020a8 <register_tm_clones+0x38>
  402094:	48 8b 05 5d 8f 00 00 	mov    0x8f5d(%rip),%rax        # 40aff8 <_ITM_registerTMCloneTable>
  40209b:	48 85 c0             	test   %rax,%rax
  40209e:	74 08                	je     4020a8 <register_tm_clones+0x38>
  4020a0:	ff e0                	jmpq   *%rax
  4020a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4020a8:	c3                   	retq   
  4020a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004020b0 <__do_global_dtors_aux>:
  4020b0:	f3 0f 1e fa          	endbr64 
  4020b4:	80 3d 2d 99 00 00 00 	cmpb   $0x0,0x992d(%rip)        # 40b9e8 <completed.0>
  4020bb:	75 13                	jne    4020d0 <__do_global_dtors_aux+0x20>
  4020bd:	55                   	push   %rbp
  4020be:	48 89 e5             	mov    %rsp,%rbp
  4020c1:	e8 7a ff ff ff       	callq  402040 <deregister_tm_clones>
  4020c6:	c6 05 1b 99 00 00 01 	movb   $0x1,0x991b(%rip)        # 40b9e8 <completed.0>
  4020cd:	5d                   	pop    %rbp
  4020ce:	c3                   	retq   
  4020cf:	90                   	nop
  4020d0:	c3                   	retq   
  4020d1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4020d8:	00 00 00 00 
  4020dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004020e0 <frame_dummy>:
  4020e0:	f3 0f 1e fa          	endbr64 
  4020e4:	eb 8a                	jmp    402070 <register_tm_clones>

00000000004020e6 <usage>:
  4020e6:	48 83 ec 08          	sub    $0x8,%rsp
  4020ea:	48 89 fe             	mov    %rdi,%rsi
  4020ed:	83 3d 40 99 00 00 00 	cmpl   $0x0,0x9940(%rip)        # 40ba34 <is_checker>
  4020f4:	74 41                	je     402137 <usage+0x51>
  4020f6:	bf 10 70 40 00       	mov    $0x407010,%edi
  4020fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402100:	e8 cb ef ff ff       	callq  4010d0 <printf@plt>
  402105:	bf 48 70 40 00       	mov    $0x407048,%edi
  40210a:	e8 81 ef ff ff       	callq  401090 <puts@plt>
  40210f:	bf e8 71 40 00       	mov    $0x4071e8,%edi
  402114:	e8 77 ef ff ff       	callq  401090 <puts@plt>
  402119:	bf 70 70 40 00       	mov    $0x407070,%edi
  40211e:	e8 6d ef ff ff       	callq  401090 <puts@plt>
  402123:	bf 02 72 40 00       	mov    $0x407202,%edi
  402128:	e8 63 ef ff ff       	callq  401090 <puts@plt>
  40212d:	bf 00 00 00 00       	mov    $0x0,%edi
  402132:	e8 f9 f0 ff ff       	callq  401230 <exit@plt>
  402137:	bf 1e 72 40 00       	mov    $0x40721e,%edi
  40213c:	b8 00 00 00 00       	mov    $0x0,%eax
  402141:	e8 8a ef ff ff       	callq  4010d0 <printf@plt>
  402146:	bf 98 70 40 00       	mov    $0x407098,%edi
  40214b:	e8 40 ef ff ff       	callq  401090 <puts@plt>
  402150:	bf c0 70 40 00       	mov    $0x4070c0,%edi
  402155:	e8 36 ef ff ff       	callq  401090 <puts@plt>
  40215a:	bf 3c 72 40 00       	mov    $0x40723c,%edi
  40215f:	e8 2c ef ff ff       	callq  401090 <puts@plt>
  402164:	eb c7                	jmp    40212d <usage+0x47>

0000000000402166 <initialize_target>:
  402166:	55                   	push   %rbp
  402167:	53                   	push   %rbx
  402168:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  40216f:	89 f5                	mov    %esi,%ebp
  402171:	89 3d ad 98 00 00    	mov    %edi,0x98ad(%rip)        # 40ba24 <check_level>
  402177:	8b 3d eb 8f 00 00    	mov    0x8feb(%rip),%edi        # 40b168 <target_id>
  40217d:	e8 05 42 00 00       	callq  406387 <gencookie>
  402182:	89 c7                	mov    %eax,%edi
  402184:	89 05 a6 98 00 00    	mov    %eax,0x98a6(%rip)        # 40ba30 <cookie>
  40218a:	e8 f8 41 00 00       	callq  406387 <gencookie>
  40218f:	89 05 97 98 00 00    	mov    %eax,0x9897(%rip)        # 40ba2c <authkey>
  402195:	8b 05 cd 8f 00 00    	mov    0x8fcd(%rip),%eax        # 40b168 <target_id>
  40219b:	8d 78 01             	lea    0x1(%rax),%edi
  40219e:	e8 ad ee ff ff       	callq  401050 <srandom@plt>
  4021a3:	e8 f8 ef ff ff       	callq  4011a0 <random@plt>
  4021a8:	89 c7                	mov    %eax,%edi
  4021aa:	e8 f3 05 00 00       	callq  4027a2 <scramble>
  4021af:	89 c3                	mov    %eax,%ebx
  4021b1:	85 ed                	test   %ebp,%ebp
  4021b3:	75 3d                	jne    4021f2 <initialize_target+0x8c>
  4021b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ba:	01 d8                	add    %ebx,%eax
  4021bc:	0f b7 c0             	movzwl %ax,%eax
  4021bf:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  4021c6:	89 c0                	mov    %eax,%eax
  4021c8:	48 89 05 c1 97 00 00 	mov    %rax,0x97c1(%rip)        # 40b990 <buf_offset>
  4021cf:	c6 05 4a 98 00 00 72 	movb   $0x72,0x984a(%rip)        # 40ba20 <target_prefix>
  4021d6:	83 3d ab 97 00 00 00 	cmpl   $0x0,0x97ab(%rip)        # 40b988 <notify>
  4021dd:	74 09                	je     4021e8 <initialize_target+0x82>
  4021df:	83 3d 4e 98 00 00 00 	cmpl   $0x0,0x984e(%rip)        # 40ba34 <is_checker>
  4021e6:	74 22                	je     40220a <initialize_target+0xa4>
  4021e8:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  4021ef:	5b                   	pop    %rbx
  4021f0:	5d                   	pop    %rbp
  4021f1:	c3                   	retq   
  4021f2:	bf 00 00 00 00       	mov    $0x0,%edi
  4021f7:	e8 94 ef ff ff       	callq  401190 <time@plt>
  4021fc:	89 c7                	mov    %eax,%edi
  4021fe:	e8 4d ee ff ff       	callq  401050 <srandom@plt>
  402203:	e8 98 ef ff ff       	callq  4011a0 <random@plt>
  402208:	eb b0                	jmp    4021ba <initialize_target+0x54>
  40220a:	be 00 01 00 00       	mov    $0x100,%esi
  40220f:	48 89 e7             	mov    %rsp,%rdi
  402212:	e8 f9 ef ff ff       	callq  401210 <gethostname@plt>
  402217:	89 c5                	mov    %eax,%ebp
  402219:	85 c0                	test   %eax,%eax
  40221b:	75 23                	jne    402240 <initialize_target+0xda>
  40221d:	89 c3                	mov    %eax,%ebx
  40221f:	48 63 c3             	movslq %ebx,%rax
  402222:	48 8b 3c c5 80 b1 40 	mov    0x40b180(,%rax,8),%rdi
  402229:	00 
  40222a:	48 85 ff             	test   %rdi,%rdi
  40222d:	74 2a                	je     402259 <initialize_target+0xf3>
  40222f:	48 89 e6             	mov    %rsp,%rsi
  402232:	e8 f9 ed ff ff       	callq  401030 <strcasecmp@plt>
  402237:	85 c0                	test   %eax,%eax
  402239:	74 19                	je     402254 <initialize_target+0xee>
  40223b:	83 c3 01             	add    $0x1,%ebx
  40223e:	eb df                	jmp    40221f <initialize_target+0xb9>
  402240:	bf f0 70 40 00       	mov    $0x4070f0,%edi
  402245:	e8 46 ee ff ff       	callq  401090 <puts@plt>
  40224a:	bf 08 00 00 00       	mov    $0x8,%edi
  40224f:	e8 dc ef ff ff       	callq  401230 <exit@plt>
  402254:	bd 01 00 00 00       	mov    $0x1,%ebp
  402259:	85 ed                	test   %ebp,%ebp
  40225b:	74 36                	je     402293 <initialize_target+0x12d>
  40225d:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  402264:	00 
  402265:	e8 6e 3e 00 00       	callq  4060d8 <init_driver>
  40226a:	85 c0                	test   %eax,%eax
  40226c:	0f 89 76 ff ff ff    	jns    4021e8 <initialize_target+0x82>
  402272:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  402279:	00 
  40227a:	bf 68 71 40 00       	mov    $0x407168,%edi
  40227f:	b8 00 00 00 00       	mov    $0x0,%eax
  402284:	e8 47 ee ff ff       	callq  4010d0 <printf@plt>
  402289:	bf 08 00 00 00       	mov    $0x8,%edi
  40228e:	e8 9d ef ff ff       	callq  401230 <exit@plt>
  402293:	48 89 e6             	mov    %rsp,%rsi
  402296:	bf 28 71 40 00       	mov    $0x407128,%edi
  40229b:	b8 00 00 00 00       	mov    $0x0,%eax
  4022a0:	e8 2b ee ff ff       	callq  4010d0 <printf@plt>
  4022a5:	bf 08 00 00 00       	mov    $0x8,%edi
  4022aa:	e8 81 ef ff ff       	callq  401230 <exit@plt>

00000000004022af <install_syscall_filter>:
  4022af:	53                   	push   %rbx
  4022b0:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
  4022b7:	66 c7 44 24 10 20 00 	movw   $0x20,0x10(%rsp)
  4022be:	c6 44 24 12 00       	movb   $0x0,0x12(%rsp)
  4022c3:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
  4022c8:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%rsp)
  4022cf:	00 
  4022d0:	66 c7 44 24 18 15 00 	movw   $0x15,0x18(%rsp)
  4022d7:	c6 44 24 1a 01       	movb   $0x1,0x1a(%rsp)
  4022dc:	c6 44 24 1b 00       	movb   $0x0,0x1b(%rsp)
  4022e1:	c7 44 24 1c 3e 00 00 	movl   $0xc000003e,0x1c(%rsp)
  4022e8:	c0 
  4022e9:	66 c7 44 24 20 06 00 	movw   $0x6,0x20(%rsp)
  4022f0:	c6 44 24 22 00       	movb   $0x0,0x22(%rsp)
  4022f5:	c6 44 24 23 00       	movb   $0x0,0x23(%rsp)
  4022fa:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%rsp)
  402301:	00 
  402302:	66 c7 44 24 28 20 00 	movw   $0x20,0x28(%rsp)
  402309:	c6 44 24 2a 00       	movb   $0x0,0x2a(%rsp)
  40230e:	c6 44 24 2b 00       	movb   $0x0,0x2b(%rsp)
  402313:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  40231a:	00 
  40231b:	66 c7 44 24 30 15 00 	movw   $0x15,0x30(%rsp)
  402322:	c6 44 24 32 00       	movb   $0x0,0x32(%rsp)
  402327:	c6 44 24 33 01       	movb   $0x1,0x33(%rsp)
  40232c:	c7 44 24 34 0f 00 00 	movl   $0xf,0x34(%rsp)
  402333:	00 
  402334:	66 c7 44 24 38 06 00 	movw   $0x6,0x38(%rsp)
  40233b:	c6 44 24 3a 00       	movb   $0x0,0x3a(%rsp)
  402340:	c6 44 24 3b 00       	movb   $0x0,0x3b(%rsp)
  402345:	c7 44 24 3c 00 00 ff 	movl   $0x7fff0000,0x3c(%rsp)
  40234c:	7f 
  40234d:	66 c7 44 24 40 15 00 	movw   $0x15,0x40(%rsp)
  402354:	c6 44 24 42 00       	movb   $0x0,0x42(%rsp)
  402359:	c6 44 24 43 01       	movb   $0x1,0x43(%rsp)
  40235e:	c7 44 24 44 e7 00 00 	movl   $0xe7,0x44(%rsp)
  402365:	00 
  402366:	66 c7 44 24 48 06 00 	movw   $0x6,0x48(%rsp)
  40236d:	c6 44 24 4a 00       	movb   $0x0,0x4a(%rsp)
  402372:	c6 44 24 4b 00       	movb   $0x0,0x4b(%rsp)
  402377:	c7 44 24 4c 00 00 ff 	movl   $0x7fff0000,0x4c(%rsp)
  40237e:	7f 
  40237f:	66 c7 44 24 50 15 00 	movw   $0x15,0x50(%rsp)
  402386:	c6 44 24 52 00       	movb   $0x0,0x52(%rsp)
  40238b:	c6 44 24 53 01       	movb   $0x1,0x53(%rsp)
  402390:	c7 44 24 54 3c 00 00 	movl   $0x3c,0x54(%rsp)
  402397:	00 
  402398:	66 c7 44 24 58 06 00 	movw   $0x6,0x58(%rsp)
  40239f:	c6 44 24 5a 00       	movb   $0x0,0x5a(%rsp)
  4023a4:	c6 44 24 5b 00       	movb   $0x0,0x5b(%rsp)
  4023a9:	c7 44 24 5c 00 00 ff 	movl   $0x7fff0000,0x5c(%rsp)
  4023b0:	7f 
  4023b1:	66 c7 44 24 60 15 00 	movw   $0x15,0x60(%rsp)
  4023b8:	c6 44 24 62 00       	movb   $0x0,0x62(%rsp)
  4023bd:	c6 44 24 63 01       	movb   $0x1,0x63(%rsp)
  4023c2:	c7 44 24 64 05 00 00 	movl   $0x5,0x64(%rsp)
  4023c9:	00 
  4023ca:	66 c7 44 24 68 06 00 	movw   $0x6,0x68(%rsp)
  4023d1:	c6 44 24 6a 00       	movb   $0x0,0x6a(%rsp)
  4023d6:	c6 44 24 6b 00       	movb   $0x0,0x6b(%rsp)
  4023db:	c7 44 24 6c 00 00 ff 	movl   $0x7fff0000,0x6c(%rsp)
  4023e2:	7f 
  4023e3:	66 c7 44 24 70 15 00 	movw   $0x15,0x70(%rsp)
  4023ea:	c6 44 24 72 00       	movb   $0x0,0x72(%rsp)
  4023ef:	c6 44 24 73 01       	movb   $0x1,0x73(%rsp)
  4023f4:	c7 44 24 74 06 01 00 	movl   $0x106,0x74(%rsp)
  4023fb:	00 
  4023fc:	66 c7 44 24 78 06 00 	movw   $0x6,0x78(%rsp)
  402403:	c6 44 24 7a 00       	movb   $0x0,0x7a(%rsp)
  402408:	c6 44 24 7b 00       	movb   $0x0,0x7b(%rsp)
  40240d:	c7 44 24 7c 00 00 ff 	movl   $0x7fff0000,0x7c(%rsp)
  402414:	7f 
  402415:	66 c7 84 24 80 00 00 	movw   $0x15,0x80(%rsp)
  40241c:	00 15 00 
  40241f:	c6 84 24 82 00 00 00 	movb   $0x0,0x82(%rsp)
  402426:	00 
  402427:	c6 84 24 83 00 00 00 	movb   $0x1,0x83(%rsp)
  40242e:	01 
  40242f:	c7 84 24 84 00 00 00 	movl   $0x9,0x84(%rsp)
  402436:	09 00 00 00 
  40243a:	66 c7 84 24 88 00 00 	movw   $0x6,0x88(%rsp)
  402441:	00 06 00 
  402444:	c6 84 24 8a 00 00 00 	movb   $0x0,0x8a(%rsp)
  40244b:	00 
  40244c:	c6 84 24 8b 00 00 00 	movb   $0x0,0x8b(%rsp)
  402453:	00 
  402454:	c7 84 24 8c 00 00 00 	movl   $0x7fff0000,0x8c(%rsp)
  40245b:	00 00 ff 7f 
  40245f:	66 c7 84 24 90 00 00 	movw   $0x15,0x90(%rsp)
  402466:	00 15 00 
  402469:	c6 84 24 92 00 00 00 	movb   $0x0,0x92(%rsp)
  402470:	00 
  402471:	c6 84 24 93 00 00 00 	movb   $0x1,0x93(%rsp)
  402478:	01 
  402479:	c7 84 24 94 00 00 00 	movl   $0x0,0x94(%rsp)
  402480:	00 00 00 00 
  402484:	66 c7 84 24 98 00 00 	movw   $0x6,0x98(%rsp)
  40248b:	00 06 00 
  40248e:	c6 84 24 9a 00 00 00 	movb   $0x0,0x9a(%rsp)
  402495:	00 
  402496:	c6 84 24 9b 00 00 00 	movb   $0x0,0x9b(%rsp)
  40249d:	00 
  40249e:	c7 84 24 9c 00 00 00 	movl   $0x7fff0000,0x9c(%rsp)
  4024a5:	00 00 ff 7f 
  4024a9:	66 c7 84 24 a0 00 00 	movw   $0x15,0xa0(%rsp)
  4024b0:	00 15 00 
  4024b3:	c6 84 24 a2 00 00 00 	movb   $0x0,0xa2(%rsp)
  4024ba:	00 
  4024bb:	c6 84 24 a3 00 00 00 	movb   $0x1,0xa3(%rsp)
  4024c2:	01 
  4024c3:	c7 84 24 a4 00 00 00 	movl   $0x1,0xa4(%rsp)
  4024ca:	01 00 00 00 
  4024ce:	66 c7 84 24 a8 00 00 	movw   $0x6,0xa8(%rsp)
  4024d5:	00 06 00 
  4024d8:	c6 84 24 aa 00 00 00 	movb   $0x0,0xaa(%rsp)
  4024df:	00 
  4024e0:	c6 84 24 ab 00 00 00 	movb   $0x0,0xab(%rsp)
  4024e7:	00 
  4024e8:	c7 84 24 ac 00 00 00 	movl   $0x7fff0000,0xac(%rsp)
  4024ef:	00 00 ff 7f 
  4024f3:	66 c7 84 24 b0 00 00 	movw   $0x6,0xb0(%rsp)
  4024fa:	00 06 00 
  4024fd:	c6 84 24 b2 00 00 00 	movb   $0x0,0xb2(%rsp)
  402504:	00 
  402505:	c6 84 24 b3 00 00 00 	movb   $0x0,0xb3(%rsp)
  40250c:	00 
  40250d:	c7 84 24 b4 00 00 00 	movl   $0x0,0xb4(%rsp)
  402514:	00 00 00 00 
  402518:	66 c7 04 24 15 00    	movw   $0x15,(%rsp)
  40251e:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  402523:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402528:	85 ff                	test   %edi,%edi
  40252a:	75 0d                	jne    402539 <install_syscall_filter+0x28a>
  40252c:	89 fb                	mov    %edi,%ebx
  40252e:	89 d8                	mov    %ebx,%eax
  402530:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
  402537:	5b                   	pop    %rbx
  402538:	c3                   	retq   
  402539:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40253f:	b9 00 00 00 00       	mov    $0x0,%ecx
  402544:	ba 00 00 00 00       	mov    $0x0,%edx
  402549:	be 01 00 00 00       	mov    $0x1,%esi
  40254e:	bf 26 00 00 00       	mov    $0x26,%edi
  402553:	b8 00 00 00 00       	mov    $0x0,%eax
  402558:	e8 23 ec ff ff       	callq  401180 <prctl@plt>
  40255d:	85 c0                	test   %eax,%eax
  40255f:	75 29                	jne    40258a <install_syscall_filter+0x2db>
  402561:	48 89 e2             	mov    %rsp,%rdx
  402564:	be 02 00 00 00       	mov    $0x2,%esi
  402569:	bf 16 00 00 00       	mov    $0x16,%edi
  40256e:	b8 00 00 00 00       	mov    $0x0,%eax
  402573:	e8 08 ec ff ff       	callq  401180 <prctl@plt>
  402578:	89 c3                	mov    %eax,%ebx
  40257a:	85 c0                	test   %eax,%eax
  40257c:	75 27                	jne    4025a5 <install_syscall_filter+0x2f6>
  40257e:	bf 78 72 40 00       	mov    $0x407278,%edi
  402583:	e8 08 eb ff ff       	callq  401090 <puts@plt>
  402588:	eb a4                	jmp    40252e <install_syscall_filter+0x27f>
  40258a:	bf 55 72 40 00       	mov    $0x407255,%edi
  40258f:	e8 4c ec ff ff       	callq  4011e0 <perror@plt>
  402594:	e8 a7 ea ff ff       	callq  401040 <__errno_location@plt>
  402599:	83 38 16             	cmpl   $0x16,(%rax)
  40259c:	74 13                	je     4025b1 <install_syscall_filter+0x302>
  40259e:	bb 01 00 00 00       	mov    $0x1,%ebx
  4025a3:	eb 89                	jmp    40252e <install_syscall_filter+0x27f>
  4025a5:	bf 69 72 40 00       	mov    $0x407269,%edi
  4025aa:	e8 31 ec ff ff       	callq  4011e0 <perror@plt>
  4025af:	eb e3                	jmp    402594 <install_syscall_filter+0x2e5>
  4025b1:	48 8b 0d 28 94 00 00 	mov    0x9428(%rip),%rcx        # 40b9e0 <stderr@@GLIBC_2.2.5>
  4025b8:	ba 24 00 00 00       	mov    $0x24,%edx
  4025bd:	be 01 00 00 00       	mov    $0x1,%esi
  4025c2:	bf 90 71 40 00       	mov    $0x407190,%edi
  4025c7:	e8 84 ec ff ff       	callq  401250 <fwrite@plt>
  4025cc:	bb 01 00 00 00       	mov    $0x1,%ebx
  4025d1:	e9 58 ff ff ff       	jmpq   40252e <install_syscall_filter+0x27f>

00000000004025d6 <main>:
  4025d6:	41 56                	push   %r14
  4025d8:	41 55                	push   %r13
  4025da:	41 54                	push   %r12
  4025dc:	55                   	push   %rbp
  4025dd:	53                   	push   %rbx
  4025de:	89 fd                	mov    %edi,%ebp
  4025e0:	48 89 f3             	mov    %rsi,%rbx
  4025e3:	be 5d 55 40 00       	mov    $0x40555d,%esi
  4025e8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4025ed:	e8 3e eb ff ff       	callq  401130 <signal@plt>
  4025f2:	be 0f 55 40 00       	mov    $0x40550f,%esi
  4025f7:	bf 07 00 00 00       	mov    $0x7,%edi
  4025fc:	e8 2f eb ff ff       	callq  401130 <signal@plt>
  402601:	be ab 55 40 00       	mov    $0x4055ab,%esi
  402606:	bf 04 00 00 00       	mov    $0x4,%edi
  40260b:	e8 20 eb ff ff       	callq  401130 <signal@plt>
  402610:	83 3d 1d 94 00 00 00 	cmpl   $0x0,0x941d(%rip)        # 40ba34 <is_checker>
  402617:	75 25                	jne    40263e <main+0x68>
  402619:	41 bc 91 72 40 00    	mov    $0x407291,%r12d
  40261f:	48 8b 05 7a 93 00 00 	mov    0x937a(%rip),%rax        # 40b9a0 <stdin@@GLIBC_2.2.5>
  402626:	48 89 05 eb 93 00 00 	mov    %rax,0x93eb(%rip)        # 40ba18 <infile>
  40262d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  402633:	41 be 00 00 00 00    	mov    $0x0,%r14d
  402639:	e9 81 00 00 00       	jmpq   4026bf <main+0xe9>
  40263e:	be f9 55 40 00       	mov    $0x4055f9,%esi
  402643:	bf 0e 00 00 00       	mov    $0xe,%edi
  402648:	e8 e3 ea ff ff       	callq  401130 <signal@plt>
  40264d:	bf 05 00 00 00       	mov    $0x5,%edi
  402652:	e8 99 ea ff ff       	callq  4010f0 <alarm@plt>
  402657:	41 bc 96 72 40 00    	mov    $0x407296,%r12d
  40265d:	eb c0                	jmp    40261f <main+0x49>
  40265f:	48 8b 3b             	mov    (%rbx),%rdi
  402662:	e8 7f fa ff ff       	callq  4020e6 <usage>
  402667:	be 7b 83 40 00       	mov    $0x40837b,%esi
  40266c:	48 8b 3d 4d 93 00 00 	mov    0x934d(%rip),%rdi        # 40b9c0 <optarg@@GLIBC_2.2.5>
  402673:	e8 58 eb ff ff       	callq  4011d0 <fopen@plt>
  402678:	48 89 05 99 93 00 00 	mov    %rax,0x9399(%rip)        # 40ba18 <infile>
  40267f:	48 85 c0             	test   %rax,%rax
  402682:	75 3b                	jne    4026bf <main+0xe9>
  402684:	48 8b 15 35 93 00 00 	mov    0x9335(%rip),%rdx        # 40b9c0 <optarg@@GLIBC_2.2.5>
  40268b:	be 9e 72 40 00       	mov    $0x40729e,%esi
  402690:	48 8b 3d 49 93 00 00 	mov    0x9349(%rip),%rdi        # 40b9e0 <stderr@@GLIBC_2.2.5>
  402697:	e8 b4 ea ff ff       	callq  401150 <fprintf@plt>
  40269c:	bb 01 00 00 00       	mov    $0x1,%ebx
  4026a1:	e9 c5 00 00 00       	jmpq   40276b <main+0x195>
  4026a6:	ba 10 00 00 00       	mov    $0x10,%edx
  4026ab:	be 00 00 00 00       	mov    $0x0,%esi
  4026b0:	48 8b 3d 09 93 00 00 	mov    0x9309(%rip),%rdi        # 40b9c0 <optarg@@GLIBC_2.2.5>
  4026b7:	e8 44 eb ff ff       	callq  401200 <strtoul@plt>
  4026bc:	41 89 c6             	mov    %eax,%r14d
  4026bf:	4c 89 e2             	mov    %r12,%rdx
  4026c2:	48 89 de             	mov    %rbx,%rsi
  4026c5:	89 ef                	mov    %ebp,%edi
  4026c7:	e8 24 eb ff ff       	callq  4011f0 <getopt@plt>
  4026cc:	3c ff                	cmp    $0xff,%al
  4026ce:	74 52                	je     402722 <main+0x14c>
  4026d0:	0f be f0             	movsbl %al,%esi
  4026d3:	83 e8 61             	sub    $0x61,%eax
  4026d6:	3c 10                	cmp    $0x10,%al
  4026d8:	77 31                	ja     40270b <main+0x135>
  4026da:	0f b6 c0             	movzbl %al,%eax
  4026dd:	ff 24 c5 e0 72 40 00 	jmpq   *0x4072e0(,%rax,8)
  4026e4:	ba 0a 00 00 00       	mov    $0xa,%edx
  4026e9:	be 00 00 00 00       	mov    $0x0,%esi
  4026ee:	48 8b 3d cb 92 00 00 	mov    0x92cb(%rip),%rdi        # 40b9c0 <optarg@@GLIBC_2.2.5>
  4026f5:	e8 66 ea ff ff       	callq  401160 <strtol@plt>
  4026fa:	41 89 c5             	mov    %eax,%r13d
  4026fd:	eb c0                	jmp    4026bf <main+0xe9>
  4026ff:	c7 05 7f 92 00 00 00 	movl   $0x0,0x927f(%rip)        # 40b988 <notify>
  402706:	00 00 00 
  402709:	eb b4                	jmp    4026bf <main+0xe9>
  40270b:	bf bb 72 40 00       	mov    $0x4072bb,%edi
  402710:	b8 00 00 00 00       	mov    $0x0,%eax
  402715:	e8 b6 e9 ff ff       	callq  4010d0 <printf@plt>
  40271a:	48 8b 3b             	mov    (%rbx),%rdi
  40271d:	e8 c4 f9 ff ff       	callq  4020e6 <usage>
  402722:	be 01 00 00 00       	mov    $0x1,%esi
  402727:	44 89 ef             	mov    %r13d,%edi
  40272a:	e8 37 fa ff ff       	callq  402166 <initialize_target>
  40272f:	83 3d fe 92 00 00 00 	cmpl   $0x0,0x92fe(%rip)        # 40ba34 <is_checker>
  402736:	74 09                	je     402741 <main+0x16b>
  402738:	44 39 35 ed 92 00 00 	cmp    %r14d,0x92ed(%rip)        # 40ba2c <authkey>
  40273f:	75 35                	jne    402776 <main+0x1a0>
  402741:	8b 35 e9 92 00 00    	mov    0x92e9(%rip),%esi        # 40ba30 <cookie>
  402747:	bf ce 72 40 00       	mov    $0x4072ce,%edi
  40274c:	b8 00 00 00 00       	mov    $0x0,%eax
  402751:	e8 7a e9 ff ff       	callq  4010d0 <printf@plt>
  402756:	bf 00 00 00 00       	mov    $0x0,%edi
  40275b:	e8 4f fb ff ff       	callq  4022af <install_syscall_filter>
  402760:	89 c3                	mov    %eax,%ebx
  402762:	85 c0                	test   %eax,%eax
  402764:	74 2e                	je     402794 <main+0x1be>
  402766:	bb 01 00 00 00       	mov    $0x1,%ebx
  40276b:	89 d8                	mov    %ebx,%eax
  40276d:	5b                   	pop    %rbx
  40276e:	5d                   	pop    %rbp
  40276f:	41 5c                	pop    %r12
  402771:	41 5d                	pop    %r13
  402773:	41 5e                	pop    %r14
  402775:	c3                   	retq   
  402776:	44 89 f6             	mov    %r14d,%esi
  402779:	bf b8 71 40 00       	mov    $0x4071b8,%edi
  40277e:	b8 00 00 00 00       	mov    $0x0,%eax
  402783:	e8 48 e9 ff ff       	callq  4010d0 <printf@plt>
  402788:	b8 00 00 00 00       	mov    $0x0,%eax
  40278d:	e8 81 2a 00 00       	callq  405213 <check_fail>
  402792:	eb ad                	jmp    402741 <main+0x16b>
  402794:	48 8b 3d f5 91 00 00 	mov    0x91f5(%rip),%rdi        # 40b990 <buf_offset>
  40279b:	e8 a7 2e 00 00       	callq  405647 <launch>
  4027a0:	eb c9                	jmp    40276b <main+0x195>

00000000004027a2 <scramble>:
  4027a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4027a7:	eb 11                	jmp    4027ba <scramble+0x18>
  4027a9:	69 d0 98 45 00 00    	imul   $0x4598,%eax,%edx
  4027af:	01 fa                	add    %edi,%edx
  4027b1:	89 c1                	mov    %eax,%ecx
  4027b3:	89 54 8c c8          	mov    %edx,-0x38(%rsp,%rcx,4)
  4027b7:	83 c0 01             	add    $0x1,%eax
  4027ba:	83 f8 09             	cmp    $0x9,%eax
  4027bd:	76 ea                	jbe    4027a9 <scramble+0x7>
  4027bf:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4027c3:	69 c0 22 1a 00 00    	imul   $0x1a22,%eax,%eax
  4027c9:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4027cd:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4027d1:	69 c0 57 5a 00 00    	imul   $0x5a57,%eax,%eax
  4027d7:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4027db:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  4027df:	69 c0 de 08 00 00    	imul   $0x8de,%eax,%eax
  4027e5:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  4027e9:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4027ed:	69 c0 b9 11 00 00    	imul   $0x11b9,%eax,%eax
  4027f3:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4027f7:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  4027fb:	69 c0 f7 9c 00 00    	imul   $0x9cf7,%eax,%eax
  402801:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  402805:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  402809:	69 c0 64 35 00 00    	imul   $0x3564,%eax,%eax
  40280f:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402813:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402817:	69 c0 7f af 00 00    	imul   $0xaf7f,%eax,%eax
  40281d:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402821:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  402825:	69 c0 d4 f2 00 00    	imul   $0xf2d4,%eax,%eax
  40282b:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40282f:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  402833:	69 c0 c1 5c 00 00    	imul   $0x5cc1,%eax,%eax
  402839:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40283d:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  402841:	69 c0 51 0e 00 00    	imul   $0xe51,%eax,%eax
  402847:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40284b:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40284f:	69 c0 69 a4 00 00    	imul   $0xa469,%eax,%eax
  402855:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402859:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40285d:	69 c0 d4 28 00 00    	imul   $0x28d4,%eax,%eax
  402863:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402867:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40286b:	69 c0 36 28 00 00    	imul   $0x2836,%eax,%eax
  402871:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402875:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402879:	69 c0 57 9d 00 00    	imul   $0x9d57,%eax,%eax
  40287f:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402883:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402887:	69 c0 91 13 00 00    	imul   $0x1391,%eax,%eax
  40288d:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402891:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  402895:	69 c0 6c a4 00 00    	imul   $0xa46c,%eax,%eax
  40289b:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40289f:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4028a3:	69 c0 4d fb 00 00    	imul   $0xfb4d,%eax,%eax
  4028a9:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4028ad:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4028b1:	69 c0 81 86 00 00    	imul   $0x8681,%eax,%eax
  4028b7:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4028bb:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4028bf:	69 c0 99 c8 00 00    	imul   $0xc899,%eax,%eax
  4028c5:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4028c9:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4028cd:	69 c0 ac 9e 00 00    	imul   $0x9eac,%eax,%eax
  4028d3:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4028d7:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4028db:	69 c0 af 84 00 00    	imul   $0x84af,%eax,%eax
  4028e1:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4028e5:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4028e9:	69 c0 97 9e 00 00    	imul   $0x9e97,%eax,%eax
  4028ef:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4028f3:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4028f7:	69 c0 07 8d 00 00    	imul   $0x8d07,%eax,%eax
  4028fd:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  402901:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  402905:	69 c0 c5 c1 00 00    	imul   $0xc1c5,%eax,%eax
  40290b:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40290f:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  402913:	69 c0 81 21 00 00    	imul   $0x2181,%eax,%eax
  402919:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40291d:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402921:	69 c0 f7 d3 00 00    	imul   $0xd3f7,%eax,%eax
  402927:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40292b:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40292f:	69 c0 d4 df 00 00    	imul   $0xdfd4,%eax,%eax
  402935:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  402939:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40293d:	69 c0 12 aa 00 00    	imul   $0xaa12,%eax,%eax
  402943:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402947:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40294b:	69 c0 15 e9 00 00    	imul   $0xe915,%eax,%eax
  402951:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402955:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402959:	69 c0 dd 66 00 00    	imul   $0x66dd,%eax,%eax
  40295f:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402963:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  402967:	69 c0 39 28 00 00    	imul   $0x2839,%eax,%eax
  40296d:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  402971:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402975:	69 c0 59 2a 00 00    	imul   $0x2a59,%eax,%eax
  40297b:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40297f:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  402983:	69 c0 0d 0a 00 00    	imul   $0xa0d,%eax,%eax
  402989:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40298d:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402991:	69 c0 b2 27 00 00    	imul   $0x27b2,%eax,%eax
  402997:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40299b:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40299f:	69 c0 15 49 00 00    	imul   $0x4915,%eax,%eax
  4029a5:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4029a9:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4029ad:	69 c0 36 38 00 00    	imul   $0x3836,%eax,%eax
  4029b3:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4029b7:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4029bb:	69 c0 70 9a 00 00    	imul   $0x9a70,%eax,%eax
  4029c1:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4029c5:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  4029c9:	69 c0 f3 01 00 00    	imul   $0x1f3,%eax,%eax
  4029cf:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  4029d3:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4029d7:	69 c0 3a 68 00 00    	imul   $0x683a,%eax,%eax
  4029dd:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4029e1:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4029e5:	69 c0 3f 11 00 00    	imul   $0x113f,%eax,%eax
  4029eb:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4029ef:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4029f3:	69 c0 ce 93 00 00    	imul   $0x93ce,%eax,%eax
  4029f9:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4029fd:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  402a01:	69 c0 a6 4f 00 00    	imul   $0x4fa6,%eax,%eax
  402a07:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  402a0b:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402a0f:	69 c0 02 e2 00 00    	imul   $0xe202,%eax,%eax
  402a15:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402a19:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  402a1d:	69 c0 ac 7b 00 00    	imul   $0x7bac,%eax,%eax
  402a23:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  402a27:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  402a2b:	69 c0 21 41 00 00    	imul   $0x4121,%eax,%eax
  402a31:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  402a35:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402a39:	69 c0 bd c7 00 00    	imul   $0xc7bd,%eax,%eax
  402a3f:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402a43:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  402a47:	69 c0 d3 ed 00 00    	imul   $0xedd3,%eax,%eax
  402a4d:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  402a51:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  402a55:	69 c0 e2 8c 00 00    	imul   $0x8ce2,%eax,%eax
  402a5b:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  402a5f:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402a63:	69 c0 f1 a2 00 00    	imul   $0xa2f1,%eax,%eax
  402a69:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402a6d:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  402a71:	69 c0 86 ca 00 00    	imul   $0xca86,%eax,%eax
  402a77:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  402a7b:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402a7f:	69 c0 f3 7a 00 00    	imul   $0x7af3,%eax,%eax
  402a85:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402a89:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  402a8d:	69 c0 ca b9 00 00    	imul   $0xb9ca,%eax,%eax
  402a93:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  402a97:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402a9b:	69 c0 8a d9 00 00    	imul   $0xd98a,%eax,%eax
  402aa1:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402aa5:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402aa9:	69 c0 da 3c 00 00    	imul   $0x3cda,%eax,%eax
  402aaf:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402ab3:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  402ab7:	69 c0 75 7f 00 00    	imul   $0x7f75,%eax,%eax
  402abd:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  402ac1:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  402ac5:	69 c0 80 cb 00 00    	imul   $0xcb80,%eax,%eax
  402acb:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402acf:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402ad3:	69 c0 50 33 00 00    	imul   $0x3350,%eax,%eax
  402ad9:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402add:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402ae1:	69 c0 e5 86 00 00    	imul   $0x86e5,%eax,%eax
  402ae7:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402aeb:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  402aef:	69 c0 de 14 00 00    	imul   $0x14de,%eax,%eax
  402af5:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  402af9:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  402afd:	69 c0 69 e0 00 00    	imul   $0xe069,%eax,%eax
  402b03:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  402b07:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402b0b:	69 c0 1b e5 00 00    	imul   $0xe51b,%eax,%eax
  402b11:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402b15:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402b19:	69 c0 5a bf 00 00    	imul   $0xbf5a,%eax,%eax
  402b1f:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402b23:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  402b27:	69 c0 3d 9a 00 00    	imul   $0x9a3d,%eax,%eax
  402b2d:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  402b31:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  402b35:	69 c0 ce ca 00 00    	imul   $0xcace,%eax,%eax
  402b3b:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  402b3f:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  402b43:	69 c0 d1 00 00 00    	imul   $0xd1,%eax,%eax
  402b49:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  402b4d:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402b51:	69 c0 34 29 00 00    	imul   $0x2934,%eax,%eax
  402b57:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402b5b:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  402b5f:	69 c0 10 98 00 00    	imul   $0x9810,%eax,%eax
  402b65:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  402b69:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402b6d:	69 c0 28 91 00 00    	imul   $0x9128,%eax,%eax
  402b73:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402b77:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  402b7b:	69 c0 bc 9e 00 00    	imul   $0x9ebc,%eax,%eax
  402b81:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  402b85:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402b89:	69 c0 5f b3 00 00    	imul   $0xb35f,%eax,%eax
  402b8f:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402b93:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  402b97:	69 c0 1c 1c 00 00    	imul   $0x1c1c,%eax,%eax
  402b9d:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402ba1:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  402ba5:	69 c0 75 31 00 00    	imul   $0x3175,%eax,%eax
  402bab:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  402baf:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402bb3:	69 c0 05 9a 00 00    	imul   $0x9a05,%eax,%eax
  402bb9:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402bbd:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  402bc1:	69 c0 bf 64 00 00    	imul   $0x64bf,%eax,%eax
  402bc7:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  402bcb:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  402bcf:	69 c0 ec ba 00 00    	imul   $0xbaec,%eax,%eax
  402bd5:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  402bd9:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402bdd:	69 c0 e3 04 00 00    	imul   $0x4e3,%eax,%eax
  402be3:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402be7:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  402beb:	69 c0 4f ed 00 00    	imul   $0xed4f,%eax,%eax
  402bf1:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  402bf5:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402bf9:	69 c0 f5 72 00 00    	imul   $0x72f5,%eax,%eax
  402bff:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402c03:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  402c07:	69 c0 7a 10 00 00    	imul   $0x107a,%eax,%eax
  402c0d:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  402c11:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  402c15:	69 c0 ba c4 00 00    	imul   $0xc4ba,%eax,%eax
  402c1b:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  402c1f:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  402c23:	69 c0 17 d3 00 00    	imul   $0xd317,%eax,%eax
  402c29:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  402c2d:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  402c31:	69 c0 0f 8d 00 00    	imul   $0x8d0f,%eax,%eax
  402c37:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  402c3b:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  402c3f:	69 c0 ed d0 00 00    	imul   $0xd0ed,%eax,%eax
  402c45:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  402c49:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  402c4d:	69 c0 c2 dc 00 00    	imul   $0xdcc2,%eax,%eax
  402c53:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  402c57:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  402c5b:	69 c0 3a ec 00 00    	imul   $0xec3a,%eax,%eax
  402c61:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  402c65:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  402c69:	69 c0 da 8d 00 00    	imul   $0x8dda,%eax,%eax
  402c6f:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  402c73:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  402c77:	69 c0 01 0f 00 00    	imul   $0xf01,%eax,%eax
  402c7d:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  402c81:	b8 00 00 00 00       	mov    $0x0,%eax
  402c86:	ba 00 00 00 00       	mov    $0x0,%edx
  402c8b:	eb 0b                	jmp    402c98 <scramble+0x4f6>
  402c8d:	89 c1                	mov    %eax,%ecx
  402c8f:	8b 4c 8c c8          	mov    -0x38(%rsp,%rcx,4),%ecx
  402c93:	01 ca                	add    %ecx,%edx
  402c95:	83 c0 01             	add    $0x1,%eax
  402c98:	83 f8 09             	cmp    $0x9,%eax
  402c9b:	76 f0                	jbe    402c8d <scramble+0x4eb>
  402c9d:	89 d0                	mov    %edx,%eax
  402c9f:	c3                   	retq   

0000000000402ca0 <getbuf>:
  402ca0:	48 83 ec 28          	sub    $0x28,%rsp
  402ca4:	48 89 e7             	mov    %rsp,%rdi
  402ca7:	e8 96 25 00 00       	callq  405242 <Gets>
  402cac:	b8 01 00 00 00       	mov    $0x1,%eax
  402cb1:	48 83 c4 28          	add    $0x28,%rsp
  402cb5:	c3                   	retq   
  402cb6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cbd:	00 00 00 
  402cc0:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cc7:	00 00 00 
  402cca:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cd1:	00 00 00 
  402cd4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cdb:	00 00 00 
  402cde:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ce5:	00 00 00 
  402ce8:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cef:	00 00 00 
  402cf2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cf9:	00 00 00 
  402cfc:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d03:	00 00 00 
  402d06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d0d:	00 00 00 
  402d10:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d17:	00 00 00 
  402d1a:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d21:	00 00 00 
  402d24:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d2b:	00 00 00 
  402d2e:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d35:	00 00 00 
  402d38:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d3f:	00 00 00 
  402d42:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d49:	00 00 00 
  402d4c:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d53:	00 00 00 
  402d56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d5d:	00 00 00 
  402d60:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d67:	00 00 00 
  402d6a:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d71:	00 00 00 
  402d74:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d7b:	00 00 00 
  402d7e:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d85:	00 00 00 
  402d88:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d8f:	00 00 00 
  402d92:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d99:	00 00 00 
  402d9c:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402da3:	00 00 00 
  402da6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402dad:	00 00 00 
  402db0:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402db7:	00 00 00 
  402dba:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402dc1:	00 00 00 
  402dc4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402dcb:	00 00 00 
  402dce:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402dd5:	00 00 00 
  402dd8:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ddf:	00 00 00 
  402de2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402de9:	00 00 00 
  402dec:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402df3:	00 00 00 
  402df6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402dfd:	00 00 00 
  402e00:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e07:	00 00 00 
  402e0a:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e11:	00 00 00 
  402e14:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e1b:	00 00 00 
  402e1e:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e25:	00 00 00 
  402e28:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e2f:	00 00 00 
  402e32:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e39:	00 00 00 
  402e3c:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e43:	00 00 00 
  402e46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e4d:	00 00 00 
  402e50:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e57:	00 00 00 
  402e5a:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e61:	00 00 00 
  402e64:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e6b:	00 00 00 
  402e6e:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e75:	00 00 00 
  402e78:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e7f:	00 00 00 
  402e82:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e89:	00 00 00 
  402e8c:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e93:	00 00 00 
  402e96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e9d:	00 00 00 
  402ea0:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ea7:	00 00 00 
  402eaa:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402eb1:	00 00 00 
  402eb4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ebb:	00 00 00 
  402ebe:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ec5:	00 00 00 
  402ec8:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ecf:	00 00 00 
  402ed2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ed9:	00 00 00 
  402edc:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ee3:	00 00 00 
  402ee6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402eed:	00 00 00 
  402ef0:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ef7:	00 00 00 
  402efa:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f01:	00 00 00 
  402f04:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f0b:	00 00 00 
  402f0e:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f15:	00 00 00 
  402f18:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f1f:	00 00 00 
  402f22:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f29:	00 00 00 
  402f2c:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f33:	00 00 00 
  402f36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f3d:	00 00 00 
  402f40:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f47:	00 00 00 
  402f4a:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f51:	00 00 00 
  402f54:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f5b:	00 00 00 
  402f5e:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f65:	00 00 00 
  402f68:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f6f:	00 00 00 
  402f72:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f79:	00 00 00 
  402f7c:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f83:	00 00 00 
  402f86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f8d:	00 00 00 
  402f90:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f97:	00 00 00 
  402f9a:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fa1:	00 00 00 
  402fa4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fab:	00 00 00 
  402fae:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fb5:	00 00 00 
  402fb8:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fbf:	00 00 00 
  402fc2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fc9:	00 00 00 
  402fcc:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fd3:	00 00 00 
  402fd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fdd:	00 00 00 
  402fe0:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fe7:	00 00 00 
  402fea:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ff1:	00 00 00 
  402ff4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ffb:	00 00 00 
  402ffe:	66 90                	xchg   %ax,%ax

0000000000403000 <touch1>:
  403000:	48 83 ec 08          	sub    $0x8,%rsp
  403004:	c7 05 1a 8a 00 00 01 	movl   $0x1,0x8a1a(%rip)        # 40ba28 <vlevel>
  40300b:	00 00 00 
  40300e:	bf ce 83 40 00       	mov    $0x4083ce,%edi
  403013:	e8 78 e0 ff ff       	callq  401090 <puts@plt>
  403018:	bf 01 00 00 00       	mov    $0x1,%edi
  40301d:	e8 13 24 00 00       	callq  405435 <validate>
  403022:	bf 00 00 00 00       	mov    $0x0,%edi
  403027:	e8 04 e2 ff ff       	callq  401230 <exit@plt>
  40302c:	e9 cf 0f 00 00       	jmpq   404000 <touch2>
  403031:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403038:	00 00 00 00 
  40303c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403043:	00 00 00 00 
  403047:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40304e:	00 00 00 00 
  403052:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403059:	00 00 00 00 
  40305d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403064:	00 00 00 00 
  403068:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40306f:	00 00 00 00 
  403073:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40307a:	00 00 00 00 
  40307e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403085:	00 00 00 00 
  403089:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403090:	00 00 00 00 
  403094:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40309b:	00 00 00 00 
  40309f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030a6:	00 00 00 00 
  4030aa:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030b1:	00 00 00 00 
  4030b5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030bc:	00 00 00 00 
  4030c0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030c7:	00 00 00 00 
  4030cb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030d2:	00 00 00 00 
  4030d6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030dd:	00 00 00 00 
  4030e1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030e8:	00 00 00 00 
  4030ec:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030f3:	00 00 00 00 
  4030f7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4030fe:	00 00 00 00 
  403102:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403109:	00 00 00 00 
  40310d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403114:	00 00 00 00 
  403118:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40311f:	00 00 00 00 
  403123:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40312a:	00 00 00 00 
  40312e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403135:	00 00 00 00 
  403139:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403140:	00 00 00 00 
  403144:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40314b:	00 00 00 00 
  40314f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403156:	00 00 00 00 
  40315a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403161:	00 00 00 00 
  403165:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40316c:	00 00 00 00 
  403170:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403177:	00 00 00 00 
  40317b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403182:	00 00 00 00 
  403186:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40318d:	00 00 00 00 
  403191:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403198:	00 00 00 00 
  40319c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031a3:	00 00 00 00 
  4031a7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031ae:	00 00 00 00 
  4031b2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031b9:	00 00 00 00 
  4031bd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031c4:	00 00 00 00 
  4031c8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031cf:	00 00 00 00 
  4031d3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031da:	00 00 00 00 
  4031de:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031e5:	00 00 00 00 
  4031e9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031f0:	00 00 00 00 
  4031f4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4031fb:	00 00 00 00 
  4031ff:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403206:	00 00 00 00 
  40320a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403211:	00 00 00 00 
  403215:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40321c:	00 00 00 00 
  403220:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403227:	00 00 00 00 
  40322b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403232:	00 00 00 00 
  403236:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40323d:	00 00 00 00 
  403241:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403248:	00 00 00 00 
  40324c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403253:	00 00 00 00 
  403257:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40325e:	00 00 00 00 
  403262:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403269:	00 00 00 00 
  40326d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403274:	00 00 00 00 
  403278:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40327f:	00 00 00 00 
  403283:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40328a:	00 00 00 00 
  40328e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403295:	00 00 00 00 
  403299:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032a0:	00 00 00 00 
  4032a4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032ab:	00 00 00 00 
  4032af:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032b6:	00 00 00 00 
  4032ba:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032c1:	00 00 00 00 
  4032c5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032cc:	00 00 00 00 
  4032d0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032d7:	00 00 00 00 
  4032db:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032e2:	00 00 00 00 
  4032e6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032ed:	00 00 00 00 
  4032f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4032f8:	00 00 00 00 
  4032fc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403303:	00 00 00 00 
  403307:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40330e:	00 00 00 00 
  403312:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403319:	00 00 00 00 
  40331d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403324:	00 00 00 00 
  403328:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40332f:	00 00 00 00 
  403333:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40333a:	00 00 00 00 
  40333e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403345:	00 00 00 00 
  403349:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403350:	00 00 00 00 
  403354:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40335b:	00 00 00 00 
  40335f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403366:	00 00 00 00 
  40336a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403371:	00 00 00 00 
  403375:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40337c:	00 00 00 00 
  403380:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403387:	00 00 00 00 
  40338b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403392:	00 00 00 00 
  403396:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40339d:	00 00 00 00 
  4033a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033a8:	00 00 00 00 
  4033ac:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033b3:	00 00 00 00 
  4033b7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033be:	00 00 00 00 
  4033c2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033c9:	00 00 00 00 
  4033cd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033d4:	00 00 00 00 
  4033d8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033df:	00 00 00 00 
  4033e3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033ea:	00 00 00 00 
  4033ee:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4033f5:	00 00 00 00 
  4033f9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403400:	00 00 00 00 
  403404:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40340b:	00 00 00 00 
  40340f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403416:	00 00 00 00 
  40341a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403421:	00 00 00 00 
  403425:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40342c:	00 00 00 00 
  403430:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403437:	00 00 00 00 
  40343b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403442:	00 00 00 00 
  403446:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40344d:	00 00 00 00 
  403451:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403458:	00 00 00 00 
  40345c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403463:	00 00 00 00 
  403467:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40346e:	00 00 00 00 
  403472:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403479:	00 00 00 00 
  40347d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403484:	00 00 00 00 
  403488:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40348f:	00 00 00 00 
  403493:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40349a:	00 00 00 00 
  40349e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034a5:	00 00 00 00 
  4034a9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034b0:	00 00 00 00 
  4034b4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034bb:	00 00 00 00 
  4034bf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034c6:	00 00 00 00 
  4034ca:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034d1:	00 00 00 00 
  4034d5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034dc:	00 00 00 00 
  4034e0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034e7:	00 00 00 00 
  4034eb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034f2:	00 00 00 00 
  4034f6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4034fd:	00 00 00 00 
  403501:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403508:	00 00 00 00 
  40350c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403513:	00 00 00 00 
  403517:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40351e:	00 00 00 00 
  403522:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403529:	00 00 00 00 
  40352d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403534:	00 00 00 00 
  403538:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40353f:	00 00 00 00 
  403543:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40354a:	00 00 00 00 
  40354e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403555:	00 00 00 00 
  403559:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403560:	00 00 00 00 
  403564:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40356b:	00 00 00 00 
  40356f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403576:	00 00 00 00 
  40357a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403581:	00 00 00 00 
  403585:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40358c:	00 00 00 00 
  403590:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403597:	00 00 00 00 
  40359b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035a2:	00 00 00 00 
  4035a6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035ad:	00 00 00 00 
  4035b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035b8:	00 00 00 00 
  4035bc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035c3:	00 00 00 00 
  4035c7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035ce:	00 00 00 00 
  4035d2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035d9:	00 00 00 00 
  4035dd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035e4:	00 00 00 00 
  4035e8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035ef:	00 00 00 00 
  4035f3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4035fa:	00 00 00 00 
  4035fe:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403605:	00 00 00 00 
  403609:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403610:	00 00 00 00 
  403614:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40361b:	00 00 00 00 
  40361f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403626:	00 00 00 00 
  40362a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403631:	00 00 00 00 
  403635:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40363c:	00 00 00 00 
  403640:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403647:	00 00 00 00 
  40364b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403652:	00 00 00 00 
  403656:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40365d:	00 00 00 00 
  403661:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403668:	00 00 00 00 
  40366c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403673:	00 00 00 00 
  403677:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40367e:	00 00 00 00 
  403682:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403689:	00 00 00 00 
  40368d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403694:	00 00 00 00 
  403698:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40369f:	00 00 00 00 
  4036a3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036aa:	00 00 00 00 
  4036ae:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036b5:	00 00 00 00 
  4036b9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036c0:	00 00 00 00 
  4036c4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036cb:	00 00 00 00 
  4036cf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036d6:	00 00 00 00 
  4036da:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036e1:	00 00 00 00 
  4036e5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036ec:	00 00 00 00 
  4036f0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4036f7:	00 00 00 00 
  4036fb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403702:	00 00 00 00 
  403706:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40370d:	00 00 00 00 
  403711:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403718:	00 00 00 00 
  40371c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403723:	00 00 00 00 
  403727:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40372e:	00 00 00 00 
  403732:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403739:	00 00 00 00 
  40373d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403744:	00 00 00 00 
  403748:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40374f:	00 00 00 00 
  403753:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40375a:	00 00 00 00 
  40375e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403765:	00 00 00 00 
  403769:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403770:	00 00 00 00 
  403774:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40377b:	00 00 00 00 
  40377f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403786:	00 00 00 00 
  40378a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403791:	00 00 00 00 
  403795:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40379c:	00 00 00 00 
  4037a0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037a7:	00 00 00 00 
  4037ab:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037b2:	00 00 00 00 
  4037b6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037bd:	00 00 00 00 
  4037c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037c8:	00 00 00 00 
  4037cc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037d3:	00 00 00 00 
  4037d7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037de:	00 00 00 00 
  4037e2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037e9:	00 00 00 00 
  4037ed:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037f4:	00 00 00 00 
  4037f8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4037ff:	00 00 00 00 
  403803:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40380a:	00 00 00 00 
  40380e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403815:	00 00 00 00 
  403819:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403820:	00 00 00 00 
  403824:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40382b:	00 00 00 00 
  40382f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403836:	00 00 00 00 
  40383a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403841:	00 00 00 00 
  403845:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40384c:	00 00 00 00 
  403850:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403857:	00 00 00 00 
  40385b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403862:	00 00 00 00 
  403866:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40386d:	00 00 00 00 
  403871:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403878:	00 00 00 00 
  40387c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403883:	00 00 00 00 
  403887:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40388e:	00 00 00 00 
  403892:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403899:	00 00 00 00 
  40389d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038a4:	00 00 00 00 
  4038a8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038af:	00 00 00 00 
  4038b3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038ba:	00 00 00 00 
  4038be:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038c5:	00 00 00 00 
  4038c9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038d0:	00 00 00 00 
  4038d4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038db:	00 00 00 00 
  4038df:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038e6:	00 00 00 00 
  4038ea:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038f1:	00 00 00 00 
  4038f5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4038fc:	00 00 00 00 
  403900:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403907:	00 00 00 00 
  40390b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403912:	00 00 00 00 
  403916:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40391d:	00 00 00 00 
  403921:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403928:	00 00 00 00 
  40392c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403933:	00 00 00 00 
  403937:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40393e:	00 00 00 00 
  403942:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403949:	00 00 00 00 
  40394d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403954:	00 00 00 00 
  403958:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40395f:	00 00 00 00 
  403963:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40396a:	00 00 00 00 
  40396e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403975:	00 00 00 00 
  403979:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403980:	00 00 00 00 
  403984:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40398b:	00 00 00 00 
  40398f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403996:	00 00 00 00 
  40399a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039a1:	00 00 00 00 
  4039a5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039ac:	00 00 00 00 
  4039b0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039b7:	00 00 00 00 
  4039bb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039c2:	00 00 00 00 
  4039c6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039cd:	00 00 00 00 
  4039d1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039d8:	00 00 00 00 
  4039dc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039e3:	00 00 00 00 
  4039e7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039ee:	00 00 00 00 
  4039f2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4039f9:	00 00 00 00 
  4039fd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a04:	00 00 00 00 
  403a08:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a0f:	00 00 00 00 
  403a13:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a1a:	00 00 00 00 
  403a1e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a25:	00 00 00 00 
  403a29:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a30:	00 00 00 00 
  403a34:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a3b:	00 00 00 00 
  403a3f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a46:	00 00 00 00 
  403a4a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a51:	00 00 00 00 
  403a55:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a5c:	00 00 00 00 
  403a60:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a67:	00 00 00 00 
  403a6b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a72:	00 00 00 00 
  403a76:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a7d:	00 00 00 00 
  403a81:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a88:	00 00 00 00 
  403a8c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a93:	00 00 00 00 
  403a97:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403a9e:	00 00 00 00 
  403aa2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403aa9:	00 00 00 00 
  403aad:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ab4:	00 00 00 00 
  403ab8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403abf:	00 00 00 00 
  403ac3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403aca:	00 00 00 00 
  403ace:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ad5:	00 00 00 00 
  403ad9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ae0:	00 00 00 00 
  403ae4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403aeb:	00 00 00 00 
  403aef:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403af6:	00 00 00 00 
  403afa:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b01:	00 00 00 00 
  403b05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b0c:	00 00 00 00 
  403b10:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b17:	00 00 00 00 
  403b1b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b22:	00 00 00 00 
  403b26:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b2d:	00 00 00 00 
  403b31:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b38:	00 00 00 00 
  403b3c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b43:	00 00 00 00 
  403b47:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b4e:	00 00 00 00 
  403b52:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b59:	00 00 00 00 
  403b5d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b64:	00 00 00 00 
  403b68:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b6f:	00 00 00 00 
  403b73:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b7a:	00 00 00 00 
  403b7e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b85:	00 00 00 00 
  403b89:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b90:	00 00 00 00 
  403b94:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403b9b:	00 00 00 00 
  403b9f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ba6:	00 00 00 00 
  403baa:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bb1:	00 00 00 00 
  403bb5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bbc:	00 00 00 00 
  403bc0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bc7:	00 00 00 00 
  403bcb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bd2:	00 00 00 00 
  403bd6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bdd:	00 00 00 00 
  403be1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403be8:	00 00 00 00 
  403bec:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bf3:	00 00 00 00 
  403bf7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403bfe:	00 00 00 00 
  403c02:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c09:	00 00 00 00 
  403c0d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c14:	00 00 00 00 
  403c18:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c1f:	00 00 00 00 
  403c23:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c2a:	00 00 00 00 
  403c2e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c35:	00 00 00 00 
  403c39:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c40:	00 00 00 00 
  403c44:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c4b:	00 00 00 00 
  403c4f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c56:	00 00 00 00 
  403c5a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c61:	00 00 00 00 
  403c65:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c6c:	00 00 00 00 
  403c70:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c77:	00 00 00 00 
  403c7b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c82:	00 00 00 00 
  403c86:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c8d:	00 00 00 00 
  403c91:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403c98:	00 00 00 00 
  403c9c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ca3:	00 00 00 00 
  403ca7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403cae:	00 00 00 00 
  403cb2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403cb9:	00 00 00 00 
  403cbd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403cc4:	00 00 00 00 
  403cc8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ccf:	00 00 00 00 
  403cd3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403cda:	00 00 00 00 
  403cde:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ce5:	00 00 00 00 
  403ce9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403cf0:	00 00 00 00 
  403cf4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403cfb:	00 00 00 00 
  403cff:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d06:	00 00 00 00 
  403d0a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d11:	00 00 00 00 
  403d15:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d1c:	00 00 00 00 
  403d20:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d27:	00 00 00 00 
  403d2b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d32:	00 00 00 00 
  403d36:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d3d:	00 00 00 00 
  403d41:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d48:	00 00 00 00 
  403d4c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d53:	00 00 00 00 
  403d57:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d5e:	00 00 00 00 
  403d62:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d69:	00 00 00 00 
  403d6d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d74:	00 00 00 00 
  403d78:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d7f:	00 00 00 00 
  403d83:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d8a:	00 00 00 00 
  403d8e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403d95:	00 00 00 00 
  403d99:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403da0:	00 00 00 00 
  403da4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403dab:	00 00 00 00 
  403daf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403db6:	00 00 00 00 
  403dba:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403dc1:	00 00 00 00 
  403dc5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403dcc:	00 00 00 00 
  403dd0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403dd7:	00 00 00 00 
  403ddb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403de2:	00 00 00 00 
  403de6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ded:	00 00 00 00 
  403df1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403df8:	00 00 00 00 
  403dfc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e03:	00 00 00 00 
  403e07:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e0e:	00 00 00 00 
  403e12:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e19:	00 00 00 00 
  403e1d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e24:	00 00 00 00 
  403e28:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e2f:	00 00 00 00 
  403e33:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e3a:	00 00 00 00 
  403e3e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e45:	00 00 00 00 
  403e49:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e50:	00 00 00 00 
  403e54:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e5b:	00 00 00 00 
  403e5f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e66:	00 00 00 00 
  403e6a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e71:	00 00 00 00 
  403e75:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e7c:	00 00 00 00 
  403e80:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e87:	00 00 00 00 
  403e8b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e92:	00 00 00 00 
  403e96:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403e9d:	00 00 00 00 
  403ea1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ea8:	00 00 00 00 
  403eac:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403eb3:	00 00 00 00 
  403eb7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ebe:	00 00 00 00 
  403ec2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ec9:	00 00 00 00 
  403ecd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ed4:	00 00 00 00 
  403ed8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403edf:	00 00 00 00 
  403ee3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403eea:	00 00 00 00 
  403eee:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ef5:	00 00 00 00 
  403ef9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f00:	00 00 00 00 
  403f04:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f0b:	00 00 00 00 
  403f0f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f16:	00 00 00 00 
  403f1a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f21:	00 00 00 00 
  403f25:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f2c:	00 00 00 00 
  403f30:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f37:	00 00 00 00 
  403f3b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f42:	00 00 00 00 
  403f46:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f4d:	00 00 00 00 
  403f51:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f58:	00 00 00 00 
  403f5c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f63:	00 00 00 00 
  403f67:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f6e:	00 00 00 00 
  403f72:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f79:	00 00 00 00 
  403f7d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f84:	00 00 00 00 
  403f88:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f8f:	00 00 00 00 
  403f93:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403f9a:	00 00 00 00 
  403f9e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fa5:	00 00 00 00 
  403fa9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fb0:	00 00 00 00 
  403fb4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fbb:	00 00 00 00 
  403fbf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fc6:	00 00 00 00 
  403fca:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fd1:	00 00 00 00 
  403fd5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fdc:	00 00 00 00 
  403fe0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403fe7:	00 00 00 00 
  403feb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  403ff2:	00 00 00 00 
  403ff6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  403ffd:	00 00 00 

0000000000404000 <touch2>:
  404000:	48 83 ec 08          	sub    $0x8,%rsp
  404004:	89 fe                	mov    %edi,%esi
  404006:	c7 05 18 7a 00 00 02 	movl   $0x2,0x7a18(%rip)        # 40ba28 <vlevel>
  40400d:	00 00 00 
  404010:	39 3d 1a 7a 00 00    	cmp    %edi,0x7a1a(%rip)        # 40ba30 <cookie>
  404016:	74 23                	je     40403b <touch2+0x3b>
  404018:	bf 18 84 40 00       	mov    $0x408418,%edi
  40401d:	b8 00 00 00 00       	mov    $0x0,%eax
  404022:	e8 a9 d0 ff ff       	callq  4010d0 <printf@plt>
  404027:	bf 02 00 00 00       	mov    $0x2,%edi
  40402c:	e8 b6 14 00 00       	callq  4054e7 <fail>
  404031:	bf 00 00 00 00       	mov    $0x0,%edi
  404036:	e8 f5 d1 ff ff       	callq  401230 <exit@plt>
  40403b:	bf f0 83 40 00       	mov    $0x4083f0,%edi
  404040:	b8 00 00 00 00       	mov    $0x0,%eax
  404045:	e8 86 d0 ff ff       	callq  4010d0 <printf@plt>
  40404a:	bf 02 00 00 00       	mov    $0x2,%edi
  40404f:	e8 e1 13 00 00       	callq  405435 <validate>
  404054:	eb db                	jmp    404031 <touch2+0x31>

0000000000404056 <hexmatch>:
  404056:	41 54                	push   %r12
  404058:	55                   	push   %rbp
  404059:	53                   	push   %rbx
  40405a:	48 83 ec 70          	sub    $0x70,%rsp
  40405e:	89 fd                	mov    %edi,%ebp
  404060:	48 89 f3             	mov    %rsi,%rbx
  404063:	e8 38 d1 ff ff       	callq  4011a0 <random@plt>
  404068:	48 89 c1             	mov    %rax,%rcx
  40406b:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  404072:	0a d7 a3 
  404075:	48 f7 ea             	imul   %rdx
  404078:	48 01 ca             	add    %rcx,%rdx
  40407b:	48 c1 fa 06          	sar    $0x6,%rdx
  40407f:	48 89 c8             	mov    %rcx,%rax
  404082:	48 c1 f8 3f          	sar    $0x3f,%rax
  404086:	48 29 c2             	sub    %rax,%rdx
  404089:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40408d:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  404091:	48 c1 e0 02          	shl    $0x2,%rax
  404095:	48 29 c1             	sub    %rax,%rcx
  404098:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  40409c:	89 ea                	mov    %ebp,%edx
  40409e:	be eb 83 40 00       	mov    $0x4083eb,%esi
  4040a3:	4c 89 e7             	mov    %r12,%rdi
  4040a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4040ab:	e8 70 d1 ff ff       	callq  401220 <sprintf@plt>
  4040b0:	ba 09 00 00 00       	mov    $0x9,%edx
  4040b5:	4c 89 e6             	mov    %r12,%rsi
  4040b8:	48 89 df             	mov    %rbx,%rdi
  4040bb:	e8 b0 cf ff ff       	callq  401070 <strncmp@plt>
  4040c0:	85 c0                	test   %eax,%eax
  4040c2:	0f 94 c0             	sete   %al
  4040c5:	0f b6 c0             	movzbl %al,%eax
  4040c8:	48 83 c4 70          	add    $0x70,%rsp
  4040cc:	5b                   	pop    %rbx
  4040cd:	5d                   	pop    %rbp
  4040ce:	41 5c                	pop    %r12
  4040d0:	c3                   	retq   
  4040d1:	e9 2a 0f 00 00       	jmpq   405000 <touch3>
  4040d6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4040dd:	00 00 00 00 
  4040e1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4040e8:	00 00 00 00 
  4040ec:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4040f3:	00 00 00 00 
  4040f7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4040fe:	00 00 00 00 
  404102:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404109:	00 00 00 00 
  40410d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404114:	00 00 00 00 
  404118:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40411f:	00 00 00 00 
  404123:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40412a:	00 00 00 00 
  40412e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404135:	00 00 00 00 
  404139:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404140:	00 00 00 00 
  404144:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40414b:	00 00 00 00 
  40414f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404156:	00 00 00 00 
  40415a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404161:	00 00 00 00 
  404165:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40416c:	00 00 00 00 
  404170:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404177:	00 00 00 00 
  40417b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404182:	00 00 00 00 
  404186:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40418d:	00 00 00 00 
  404191:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404198:	00 00 00 00 
  40419c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041a3:	00 00 00 00 
  4041a7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041ae:	00 00 00 00 
  4041b2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041b9:	00 00 00 00 
  4041bd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041c4:	00 00 00 00 
  4041c8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041cf:	00 00 00 00 
  4041d3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041da:	00 00 00 00 
  4041de:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041e5:	00 00 00 00 
  4041e9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041f0:	00 00 00 00 
  4041f4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4041fb:	00 00 00 00 
  4041ff:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404206:	00 00 00 00 
  40420a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404211:	00 00 00 00 
  404215:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40421c:	00 00 00 00 
  404220:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404227:	00 00 00 00 
  40422b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404232:	00 00 00 00 
  404236:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40423d:	00 00 00 00 
  404241:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404248:	00 00 00 00 
  40424c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404253:	00 00 00 00 
  404257:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40425e:	00 00 00 00 
  404262:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404269:	00 00 00 00 
  40426d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404274:	00 00 00 00 
  404278:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40427f:	00 00 00 00 
  404283:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40428a:	00 00 00 00 
  40428e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404295:	00 00 00 00 
  404299:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042a0:	00 00 00 00 
  4042a4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042ab:	00 00 00 00 
  4042af:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042b6:	00 00 00 00 
  4042ba:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042c1:	00 00 00 00 
  4042c5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042cc:	00 00 00 00 
  4042d0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042d7:	00 00 00 00 
  4042db:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042e2:	00 00 00 00 
  4042e6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042ed:	00 00 00 00 
  4042f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4042f8:	00 00 00 00 
  4042fc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404303:	00 00 00 00 
  404307:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40430e:	00 00 00 00 
  404312:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404319:	00 00 00 00 
  40431d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404324:	00 00 00 00 
  404328:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40432f:	00 00 00 00 
  404333:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40433a:	00 00 00 00 
  40433e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404345:	00 00 00 00 
  404349:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404350:	00 00 00 00 
  404354:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40435b:	00 00 00 00 
  40435f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404366:	00 00 00 00 
  40436a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404371:	00 00 00 00 
  404375:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40437c:	00 00 00 00 
  404380:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404387:	00 00 00 00 
  40438b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404392:	00 00 00 00 
  404396:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40439d:	00 00 00 00 
  4043a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043a8:	00 00 00 00 
  4043ac:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043b3:	00 00 00 00 
  4043b7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043be:	00 00 00 00 
  4043c2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043c9:	00 00 00 00 
  4043cd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043d4:	00 00 00 00 
  4043d8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043df:	00 00 00 00 
  4043e3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043ea:	00 00 00 00 
  4043ee:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4043f5:	00 00 00 00 
  4043f9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404400:	00 00 00 00 
  404404:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40440b:	00 00 00 00 
  40440f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404416:	00 00 00 00 
  40441a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404421:	00 00 00 00 
  404425:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40442c:	00 00 00 00 
  404430:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404437:	00 00 00 00 
  40443b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404442:	00 00 00 00 
  404446:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40444d:	00 00 00 00 
  404451:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404458:	00 00 00 00 
  40445c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404463:	00 00 00 00 
  404467:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40446e:	00 00 00 00 
  404472:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404479:	00 00 00 00 
  40447d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404484:	00 00 00 00 
  404488:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40448f:	00 00 00 00 
  404493:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40449a:	00 00 00 00 
  40449e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044a5:	00 00 00 00 
  4044a9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044b0:	00 00 00 00 
  4044b4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044bb:	00 00 00 00 
  4044bf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044c6:	00 00 00 00 
  4044ca:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044d1:	00 00 00 00 
  4044d5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044dc:	00 00 00 00 
  4044e0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044e7:	00 00 00 00 
  4044eb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044f2:	00 00 00 00 
  4044f6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4044fd:	00 00 00 00 
  404501:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404508:	00 00 00 00 
  40450c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404513:	00 00 00 00 
  404517:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40451e:	00 00 00 00 
  404522:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404529:	00 00 00 00 
  40452d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404534:	00 00 00 00 
  404538:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40453f:	00 00 00 00 
  404543:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40454a:	00 00 00 00 
  40454e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404555:	00 00 00 00 
  404559:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404560:	00 00 00 00 
  404564:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40456b:	00 00 00 00 
  40456f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404576:	00 00 00 00 
  40457a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404581:	00 00 00 00 
  404585:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40458c:	00 00 00 00 
  404590:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404597:	00 00 00 00 
  40459b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045a2:	00 00 00 00 
  4045a6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045ad:	00 00 00 00 
  4045b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045b8:	00 00 00 00 
  4045bc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045c3:	00 00 00 00 
  4045c7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045ce:	00 00 00 00 
  4045d2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045d9:	00 00 00 00 
  4045dd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045e4:	00 00 00 00 
  4045e8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045ef:	00 00 00 00 
  4045f3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4045fa:	00 00 00 00 
  4045fe:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404605:	00 00 00 00 
  404609:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404610:	00 00 00 00 
  404614:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40461b:	00 00 00 00 
  40461f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404626:	00 00 00 00 
  40462a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404631:	00 00 00 00 
  404635:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40463c:	00 00 00 00 
  404640:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404647:	00 00 00 00 
  40464b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404652:	00 00 00 00 
  404656:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40465d:	00 00 00 00 
  404661:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404668:	00 00 00 00 
  40466c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404673:	00 00 00 00 
  404677:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40467e:	00 00 00 00 
  404682:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404689:	00 00 00 00 
  40468d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404694:	00 00 00 00 
  404698:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40469f:	00 00 00 00 
  4046a3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046aa:	00 00 00 00 
  4046ae:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046b5:	00 00 00 00 
  4046b9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046c0:	00 00 00 00 
  4046c4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046cb:	00 00 00 00 
  4046cf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046d6:	00 00 00 00 
  4046da:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046e1:	00 00 00 00 
  4046e5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046ec:	00 00 00 00 
  4046f0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4046f7:	00 00 00 00 
  4046fb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404702:	00 00 00 00 
  404706:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40470d:	00 00 00 00 
  404711:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404718:	00 00 00 00 
  40471c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404723:	00 00 00 00 
  404727:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40472e:	00 00 00 00 
  404732:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404739:	00 00 00 00 
  40473d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404744:	00 00 00 00 
  404748:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40474f:	00 00 00 00 
  404753:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40475a:	00 00 00 00 
  40475e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404765:	00 00 00 00 
  404769:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404770:	00 00 00 00 
  404774:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40477b:	00 00 00 00 
  40477f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404786:	00 00 00 00 
  40478a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404791:	00 00 00 00 
  404795:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40479c:	00 00 00 00 
  4047a0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047a7:	00 00 00 00 
  4047ab:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047b2:	00 00 00 00 
  4047b6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047bd:	00 00 00 00 
  4047c1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047c8:	00 00 00 00 
  4047cc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047d3:	00 00 00 00 
  4047d7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047de:	00 00 00 00 
  4047e2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047e9:	00 00 00 00 
  4047ed:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047f4:	00 00 00 00 
  4047f8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4047ff:	00 00 00 00 
  404803:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40480a:	00 00 00 00 
  40480e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404815:	00 00 00 00 
  404819:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404820:	00 00 00 00 
  404824:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40482b:	00 00 00 00 
  40482f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404836:	00 00 00 00 
  40483a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404841:	00 00 00 00 
  404845:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40484c:	00 00 00 00 
  404850:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404857:	00 00 00 00 
  40485b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404862:	00 00 00 00 
  404866:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40486d:	00 00 00 00 
  404871:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404878:	00 00 00 00 
  40487c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404883:	00 00 00 00 
  404887:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40488e:	00 00 00 00 
  404892:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404899:	00 00 00 00 
  40489d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048a4:	00 00 00 00 
  4048a8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048af:	00 00 00 00 
  4048b3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048ba:	00 00 00 00 
  4048be:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048c5:	00 00 00 00 
  4048c9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048d0:	00 00 00 00 
  4048d4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048db:	00 00 00 00 
  4048df:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048e6:	00 00 00 00 
  4048ea:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048f1:	00 00 00 00 
  4048f5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4048fc:	00 00 00 00 
  404900:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404907:	00 00 00 00 
  40490b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404912:	00 00 00 00 
  404916:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40491d:	00 00 00 00 
  404921:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404928:	00 00 00 00 
  40492c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404933:	00 00 00 00 
  404937:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40493e:	00 00 00 00 
  404942:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404949:	00 00 00 00 
  40494d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404954:	00 00 00 00 
  404958:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40495f:	00 00 00 00 
  404963:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40496a:	00 00 00 00 
  40496e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404975:	00 00 00 00 
  404979:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404980:	00 00 00 00 
  404984:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40498b:	00 00 00 00 
  40498f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404996:	00 00 00 00 
  40499a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049a1:	00 00 00 00 
  4049a5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049ac:	00 00 00 00 
  4049b0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049b7:	00 00 00 00 
  4049bb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049c2:	00 00 00 00 
  4049c6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049cd:	00 00 00 00 
  4049d1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049d8:	00 00 00 00 
  4049dc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049e3:	00 00 00 00 
  4049e7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049ee:	00 00 00 00 
  4049f2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4049f9:	00 00 00 00 
  4049fd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a04:	00 00 00 00 
  404a08:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a0f:	00 00 00 00 
  404a13:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a1a:	00 00 00 00 
  404a1e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a25:	00 00 00 00 
  404a29:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a30:	00 00 00 00 
  404a34:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a3b:	00 00 00 00 
  404a3f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a46:	00 00 00 00 
  404a4a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a51:	00 00 00 00 
  404a55:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a5c:	00 00 00 00 
  404a60:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a67:	00 00 00 00 
  404a6b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a72:	00 00 00 00 
  404a76:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a7d:	00 00 00 00 
  404a81:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a88:	00 00 00 00 
  404a8c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a93:	00 00 00 00 
  404a97:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404a9e:	00 00 00 00 
  404aa2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404aa9:	00 00 00 00 
  404aad:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ab4:	00 00 00 00 
  404ab8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404abf:	00 00 00 00 
  404ac3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404aca:	00 00 00 00 
  404ace:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ad5:	00 00 00 00 
  404ad9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ae0:	00 00 00 00 
  404ae4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404aeb:	00 00 00 00 
  404aef:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404af6:	00 00 00 00 
  404afa:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b01:	00 00 00 00 
  404b05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b0c:	00 00 00 00 
  404b10:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b17:	00 00 00 00 
  404b1b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b22:	00 00 00 00 
  404b26:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b2d:	00 00 00 00 
  404b31:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b38:	00 00 00 00 
  404b3c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b43:	00 00 00 00 
  404b47:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b4e:	00 00 00 00 
  404b52:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b59:	00 00 00 00 
  404b5d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b64:	00 00 00 00 
  404b68:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b6f:	00 00 00 00 
  404b73:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b7a:	00 00 00 00 
  404b7e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b85:	00 00 00 00 
  404b89:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b90:	00 00 00 00 
  404b94:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404b9b:	00 00 00 00 
  404b9f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ba6:	00 00 00 00 
  404baa:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bb1:	00 00 00 00 
  404bb5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bbc:	00 00 00 00 
  404bc0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bc7:	00 00 00 00 
  404bcb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bd2:	00 00 00 00 
  404bd6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bdd:	00 00 00 00 
  404be1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404be8:	00 00 00 00 
  404bec:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bf3:	00 00 00 00 
  404bf7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404bfe:	00 00 00 00 
  404c02:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c09:	00 00 00 00 
  404c0d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c14:	00 00 00 00 
  404c18:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c1f:	00 00 00 00 
  404c23:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c2a:	00 00 00 00 
  404c2e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c35:	00 00 00 00 
  404c39:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c40:	00 00 00 00 
  404c44:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c4b:	00 00 00 00 
  404c4f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c56:	00 00 00 00 
  404c5a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c61:	00 00 00 00 
  404c65:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c6c:	00 00 00 00 
  404c70:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c77:	00 00 00 00 
  404c7b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c82:	00 00 00 00 
  404c86:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c8d:	00 00 00 00 
  404c91:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404c98:	00 00 00 00 
  404c9c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ca3:	00 00 00 00 
  404ca7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404cae:	00 00 00 00 
  404cb2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404cb9:	00 00 00 00 
  404cbd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404cc4:	00 00 00 00 
  404cc8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ccf:	00 00 00 00 
  404cd3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404cda:	00 00 00 00 
  404cde:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ce5:	00 00 00 00 
  404ce9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404cf0:	00 00 00 00 
  404cf4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404cfb:	00 00 00 00 
  404cff:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d06:	00 00 00 00 
  404d0a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d11:	00 00 00 00 
  404d15:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d1c:	00 00 00 00 
  404d20:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d27:	00 00 00 00 
  404d2b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d32:	00 00 00 00 
  404d36:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d3d:	00 00 00 00 
  404d41:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d48:	00 00 00 00 
  404d4c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d53:	00 00 00 00 
  404d57:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d5e:	00 00 00 00 
  404d62:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d69:	00 00 00 00 
  404d6d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d74:	00 00 00 00 
  404d78:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d7f:	00 00 00 00 
  404d83:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d8a:	00 00 00 00 
  404d8e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404d95:	00 00 00 00 
  404d99:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404da0:	00 00 00 00 
  404da4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404dab:	00 00 00 00 
  404daf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404db6:	00 00 00 00 
  404dba:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404dc1:	00 00 00 00 
  404dc5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404dcc:	00 00 00 00 
  404dd0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404dd7:	00 00 00 00 
  404ddb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404de2:	00 00 00 00 
  404de6:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ded:	00 00 00 00 
  404df1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404df8:	00 00 00 00 
  404dfc:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e03:	00 00 00 00 
  404e07:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e0e:	00 00 00 00 
  404e12:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e19:	00 00 00 00 
  404e1d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e24:	00 00 00 00 
  404e28:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e2f:	00 00 00 00 
  404e33:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e3a:	00 00 00 00 
  404e3e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e45:	00 00 00 00 
  404e49:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e50:	00 00 00 00 
  404e54:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e5b:	00 00 00 00 
  404e5f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e66:	00 00 00 00 
  404e6a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e71:	00 00 00 00 
  404e75:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e7c:	00 00 00 00 
  404e80:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e87:	00 00 00 00 
  404e8b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e92:	00 00 00 00 
  404e96:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404e9d:	00 00 00 00 
  404ea1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ea8:	00 00 00 00 
  404eac:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404eb3:	00 00 00 00 
  404eb7:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ebe:	00 00 00 00 
  404ec2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ec9:	00 00 00 00 
  404ecd:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ed4:	00 00 00 00 
  404ed8:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404edf:	00 00 00 00 
  404ee3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404eea:	00 00 00 00 
  404eee:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ef5:	00 00 00 00 
  404ef9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f00:	00 00 00 00 
  404f04:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f0b:	00 00 00 00 
  404f0f:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f16:	00 00 00 00 
  404f1a:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f21:	00 00 00 00 
  404f25:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f2c:	00 00 00 00 
  404f30:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f37:	00 00 00 00 
  404f3b:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f42:	00 00 00 00 
  404f46:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f4d:	00 00 00 00 
  404f51:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f58:	00 00 00 00 
  404f5c:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f63:	00 00 00 00 
  404f67:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f6e:	00 00 00 00 
  404f72:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f79:	00 00 00 00 
  404f7d:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f84:	00 00 00 00 
  404f88:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f8f:	00 00 00 00 
  404f93:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404f9a:	00 00 00 00 
  404f9e:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fa5:	00 00 00 00 
  404fa9:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fb0:	00 00 00 00 
  404fb4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fbb:	00 00 00 00 
  404fbf:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fc6:	00 00 00 00 
  404fca:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fd1:	00 00 00 00 
  404fd5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fdc:	00 00 00 00 
  404fe0:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404fe7:	00 00 00 00 
  404feb:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  404ff2:	00 00 00 00 
  404ff6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  404ffd:	00 00 00 

0000000000405000 <touch3>:
  405000:	53                   	push   %rbx
  405001:	48 89 fb             	mov    %rdi,%rbx
  405004:	c7 05 1a 6a 00 00 03 	movl   $0x3,0x6a1a(%rip)        # 40ba28 <vlevel>
  40500b:	00 00 00 
  40500e:	48 89 fe             	mov    %rdi,%rsi
  405011:	8b 3d 19 6a 00 00    	mov    0x6a19(%rip),%edi        # 40ba30 <cookie>
  405017:	e8 3a f0 ff ff       	callq  404056 <hexmatch>
  40501c:	85 c0                	test   %eax,%eax
  40501e:	74 26                	je     405046 <touch3+0x46>
  405020:	48 89 de             	mov    %rbx,%rsi
  405023:	bf 40 84 40 00       	mov    $0x408440,%edi
  405028:	b8 00 00 00 00       	mov    $0x0,%eax
  40502d:	e8 9e c0 ff ff       	callq  4010d0 <printf@plt>
  405032:	bf 03 00 00 00       	mov    $0x3,%edi
  405037:	e8 f9 03 00 00       	callq  405435 <validate>
  40503c:	bf 00 00 00 00       	mov    $0x0,%edi
  405041:	e8 ea c1 ff ff       	callq  401230 <exit@plt>
  405046:	48 89 de             	mov    %rbx,%rsi
  405049:	bf 68 84 40 00       	mov    $0x408468,%edi
  40504e:	b8 00 00 00 00       	mov    $0x0,%eax
  405053:	e8 78 c0 ff ff       	callq  4010d0 <printf@plt>
  405058:	bf 03 00 00 00       	mov    $0x3,%edi
  40505d:	e8 85 04 00 00       	callq  4054e7 <fail>
  405062:	eb d8                	jmp    40503c <touch3+0x3c>

0000000000405064 <test>:
  405064:	48 83 ec 08          	sub    $0x8,%rsp
  405068:	b8 00 00 00 00       	mov    $0x0,%eax
  40506d:	e8 2e dc ff ff       	callq  402ca0 <getbuf>
  405072:	89 c6                	mov    %eax,%esi
  405074:	bf 90 84 40 00       	mov    $0x408490,%edi
  405079:	b8 00 00 00 00       	mov    $0x0,%eax
  40507e:	e8 4d c0 ff ff       	callq  4010d0 <printf@plt>
  405083:	48 83 c4 08          	add    $0x8,%rsp
  405087:	c3                   	retq   

0000000000405088 <start_farm>:
  405088:	b8 01 00 00 00       	mov    $0x1,%eax
  40508d:	c3                   	retq   

000000000040508e <setval_407>:
  40508e:	c7 07 58 90 90 c3    	movl   $0xc3909058,(%rdi)
  405094:	c3                   	retq   

0000000000405095 <addval_453>:
  405095:	8d 87 48 89 c7 90    	lea    -0x6f3876b8(%rdi),%eax
  40509b:	c3                   	retq   

000000000040509c <getval_397>:
  40509c:	b8 58 90 90 90       	mov    $0x90909058,%eax
  4050a1:	c3                   	retq   

00000000004050a2 <getval_129>:
  4050a2:	b8 49 89 c7 c3       	mov    $0xc3c78949,%eax
  4050a7:	c3                   	retq   

00000000004050a8 <addval_398>:
  4050a8:	8d 87 48 89 c7 c1    	lea    -0x3e3876b8(%rdi),%eax
  4050ae:	c3                   	retq   

00000000004050af <setval_200>:
  4050af:	c7 07 b8 a9 58 92    	movl   $0x9258a9b8,(%rdi)
  4050b5:	c3                   	retq   

00000000004050b6 <getval_445>:
  4050b6:	b8 60 48 89 c7       	mov    $0xc7894860,%eax
  4050bb:	c3                   	retq   

00000000004050bc <addval_113>:
  4050bc:	8d 87 50 58 94 90    	lea    -0x6f6ba7b0(%rdi),%eax
  4050c2:	c3                   	retq   

00000000004050c3 <mid_farm>:
  4050c3:	b8 01 00 00 00       	mov    $0x1,%eax
  4050c8:	c3                   	retq   

00000000004050c9 <add_xy>:
  4050c9:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4050cd:	c3                   	retq   

00000000004050ce <setval_417>:
  4050ce:	c7 07 68 89 e0 c3    	movl   $0xc3e08968,(%rdi)
  4050d4:	c3                   	retq   

00000000004050d5 <getval_478>:
  4050d5:	b8 99 ce c3 8f       	mov    $0x8fc3ce99,%eax
  4050da:	c3                   	retq   

00000000004050db <addval_216>:
  4050db:	8d 87 48 89 e0 c2    	lea    -0x3d1f76b8(%rdi),%eax
  4050e1:	c3                   	retq   

00000000004050e2 <addval_376>:
  4050e2:	8d 87 8d ce 84 c0    	lea    -0x3f7b3173(%rdi),%eax
  4050e8:	c3                   	retq   

00000000004050e9 <getval_111>:
  4050e9:	b8 99 d1 20 c0       	mov    $0xc020d199,%eax
  4050ee:	c3                   	retq   

00000000004050ef <getval_104>:
  4050ef:	b8 89 ce 90 c3       	mov    $0xc390ce89,%eax
  4050f4:	c3                   	retq   

00000000004050f5 <getval_117>:
  4050f5:	b8 48 89 e0 c7       	mov    $0xc7e08948,%eax
  4050fa:	c3                   	retq   

00000000004050fb <getval_315>:
  4050fb:	b8 88 ce 08 c9       	mov    $0xc908ce88,%eax
  405100:	c3                   	retq   

0000000000405101 <addval_155>:
  405101:	8d 87 89 c2 28 c0    	lea    -0x3fd73d77(%rdi),%eax
  405107:	c3                   	retq   

0000000000405108 <addval_432>:
  405108:	8d 87 48 89 e0 92    	lea    -0x6d1f76b8(%rdi),%eax
  40510e:	c3                   	retq   

000000000040510f <getval_330>:
  40510f:	b8 48 88 e0 c3       	mov    $0xc3e08848,%eax
  405114:	c3                   	retq   

0000000000405115 <addval_152>:
  405115:	8d 87 89 c2 38 c0    	lea    -0x3fc73d77(%rdi),%eax
  40511b:	c3                   	retq   

000000000040511c <setval_312>:
  40511c:	c7 07 89 c2 a4 c0    	movl   $0xc0a4c289,(%rdi)
  405122:	c3                   	retq   

0000000000405123 <addval_480>:
  405123:	8d 87 8d d1 90 c3    	lea    -0x3c6f2e73(%rdi),%eax
  405129:	c3                   	retq   

000000000040512a <getval_427>:
  40512a:	b8 48 89 e0 90       	mov    $0x90e08948,%eax
  40512f:	c3                   	retq   

0000000000405130 <addval_218>:
  405130:	8d 87 89 d1 20 db    	lea    -0x24df2e77(%rdi),%eax
  405136:	c3                   	retq   

0000000000405137 <setval_295>:
  405137:	c7 07 89 ce 18 c9    	movl   $0xc918ce89,(%rdi)
  40513d:	c3                   	retq   

000000000040513e <getval_422>:
  40513e:	b8 48 89 e0 c3       	mov    $0xc3e08948,%eax
  405143:	c3                   	retq   

0000000000405144 <setval_347>:
  405144:	c7 07 89 c2 00 db    	movl   $0xdb00c289,(%rdi)
  40514a:	c3                   	retq   

000000000040514b <setval_271>:
  40514b:	c7 07 89 ce 84 d2    	movl   $0xd284ce89,(%rdi)
  405151:	c3                   	retq   

0000000000405152 <getval_321>:
  405152:	b8 89 d1 92 90       	mov    $0x9092d189,%eax
  405157:	c3                   	retq   

0000000000405158 <getval_291>:
  405158:	b8 99 d1 90 90       	mov    $0x9090d199,%eax
  40515d:	c3                   	retq   

000000000040515e <addval_384>:
  40515e:	8d 87 99 ce 84 c0    	lea    -0x3f7b3167(%rdi),%eax
  405164:	c3                   	retq   

0000000000405165 <addval_225>:
  405165:	8d 87 89 d1 c3 83    	lea    -0x7c3c2e77(%rdi),%eax
  40516b:	c3                   	retq   

000000000040516c <addval_272>:
  40516c:	8d 87 89 c2 38 c9    	lea    -0x36c73d77(%rdi),%eax
  405172:	c3                   	retq   

0000000000405173 <addval_264>:
  405173:	8d 87 88 d1 38 c9    	lea    -0x36c72e78(%rdi),%eax
  405179:	c3                   	retq   

000000000040517a <addval_448>:
  40517a:	8d 87 89 c2 30 c9    	lea    -0x36cf3d77(%rdi),%eax
  405180:	c3                   	retq   

0000000000405181 <getval_380>:
  405181:	b8 88 d1 38 d2       	mov    $0xd238d188,%eax
  405186:	c3                   	retq   

0000000000405187 <addval_389>:
  405187:	8d 87 89 c2 78 db    	lea    -0x24873d77(%rdi),%eax
  40518d:	c3                   	retq   

000000000040518e <setval_461>:
  40518e:	c7 07 48 89 e0 c2    	movl   $0xc2e08948,(%rdi)
  405194:	c3                   	retq   

0000000000405195 <setval_177>:
  405195:	c7 07 88 c2 08 c9    	movl   $0xc908c288,(%rdi)
  40519b:	c3                   	retq   

000000000040519c <setval_474>:
  40519c:	c7 07 89 ce 18 db    	movl   $0xdb18ce89,(%rdi)
  4051a2:	c3                   	retq   

00000000004051a3 <end_farm>:
  4051a3:	b8 01 00 00 00       	mov    $0x1,%eax
  4051a8:	c3                   	retq   

00000000004051a9 <save_char>:
  4051a9:	8b 05 95 74 00 00    	mov    0x7495(%rip),%eax        # 40c644 <gets_cnt>
  4051af:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  4051b4:	7f 49                	jg     4051ff <save_char+0x56>
  4051b6:	89 f9                	mov    %edi,%ecx
  4051b8:	c0 e9 04             	shr    $0x4,%cl
  4051bb:	8d 14 40             	lea    (%rax,%rax,2),%edx
  4051be:	83 e1 0f             	and    $0xf,%ecx
  4051c1:	0f b6 b1 b0 87 40 00 	movzbl 0x4087b0(%rcx),%esi
  4051c8:	48 63 ca             	movslq %edx,%rcx
  4051cb:	40 88 b1 40 ba 40 00 	mov    %sil,0x40ba40(%rcx)
  4051d2:	8d 4a 01             	lea    0x1(%rdx),%ecx
  4051d5:	83 e7 0f             	and    $0xf,%edi
  4051d8:	0f b6 b7 b0 87 40 00 	movzbl 0x4087b0(%rdi),%esi
  4051df:	48 63 c9             	movslq %ecx,%rcx
  4051e2:	40 88 b1 40 ba 40 00 	mov    %sil,0x40ba40(%rcx)
  4051e9:	83 c2 02             	add    $0x2,%edx
  4051ec:	48 63 d2             	movslq %edx,%rdx
  4051ef:	c6 82 40 ba 40 00 20 	movb   $0x20,0x40ba40(%rdx)
  4051f6:	83 c0 01             	add    $0x1,%eax
  4051f9:	89 05 45 74 00 00    	mov    %eax,0x7445(%rip)        # 40c644 <gets_cnt>
  4051ff:	c3                   	retq   

0000000000405200 <save_term>:
  405200:	8b 05 3e 74 00 00    	mov    0x743e(%rip),%eax        # 40c644 <gets_cnt>
  405206:	8d 04 40             	lea    (%rax,%rax,2),%eax
  405209:	48 98                	cltq   
  40520b:	c6 80 40 ba 40 00 00 	movb   $0x0,0x40ba40(%rax)
  405212:	c3                   	retq   

0000000000405213 <check_fail>:
  405213:	48 83 ec 08          	sub    $0x8,%rsp
  405217:	0f be 35 02 68 00 00 	movsbl 0x6802(%rip),%esi        # 40ba20 <target_prefix>
  40521e:	b9 40 ba 40 00       	mov    $0x40ba40,%ecx
  405223:	8b 15 fb 67 00 00    	mov    0x67fb(%rip),%edx        # 40ba24 <check_level>
  405229:	bf b3 84 40 00       	mov    $0x4084b3,%edi
  40522e:	b8 00 00 00 00       	mov    $0x0,%eax
  405233:	e8 98 be ff ff       	callq  4010d0 <printf@plt>
  405238:	bf 01 00 00 00       	mov    $0x1,%edi
  40523d:	e8 ee bf ff ff       	callq  401230 <exit@plt>

0000000000405242 <Gets>:
  405242:	41 54                	push   %r12
  405244:	55                   	push   %rbp
  405245:	53                   	push   %rbx
  405246:	49 89 fc             	mov    %rdi,%r12
  405249:	c7 05 f1 73 00 00 00 	movl   $0x0,0x73f1(%rip)        # 40c644 <gets_cnt>
  405250:	00 00 00 
  405253:	48 89 fb             	mov    %rdi,%rbx
  405256:	eb 11                	jmp    405269 <Gets+0x27>
  405258:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  40525c:	88 03                	mov    %al,(%rbx)
  40525e:	0f b6 f8             	movzbl %al,%edi
  405261:	e8 43 ff ff ff       	callq  4051a9 <save_char>
  405266:	48 89 eb             	mov    %rbp,%rbx
  405269:	48 8b 3d a8 67 00 00 	mov    0x67a8(%rip),%rdi        # 40ba18 <infile>
  405270:	e8 eb bf ff ff       	callq  401260 <getc@plt>
  405275:	83 f8 ff             	cmp    $0xffffffff,%eax
  405278:	74 05                	je     40527f <Gets+0x3d>
  40527a:	83 f8 0a             	cmp    $0xa,%eax
  40527d:	75 d9                	jne    405258 <Gets+0x16>
  40527f:	c6 03 00             	movb   $0x0,(%rbx)
  405282:	b8 00 00 00 00       	mov    $0x0,%eax
  405287:	e8 74 ff ff ff       	callq  405200 <save_term>
  40528c:	4c 89 e0             	mov    %r12,%rax
  40528f:	5b                   	pop    %rbx
  405290:	5d                   	pop    %rbp
  405291:	41 5c                	pop    %r12
  405293:	c3                   	retq   

0000000000405294 <notify_server>:
  405294:	83 3d 99 67 00 00 00 	cmpl   $0x0,0x6799(%rip)        # 40ba34 <is_checker>
  40529b:	0f 85 93 01 00 00    	jne    405434 <notify_server+0x1a0>
  4052a1:	55                   	push   %rbp
  4052a2:	53                   	push   %rbx
  4052a3:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  4052aa:	89 fb                	mov    %edi,%ebx
  4052ac:	81 3d 8e 73 00 00 9c 	cmpl   $0x1f9c,0x738e(%rip)        # 40c644 <gets_cnt>
  4052b3:	1f 00 00 
  4052b6:	0f 8f ad 00 00 00    	jg     405369 <notify_server+0xd5>
  4052bc:	44 0f be 0d 5c 67 00 	movsbl 0x675c(%rip),%r9d        # 40ba20 <target_prefix>
  4052c3:	00 
  4052c4:	83 3d bd 66 00 00 00 	cmpl   $0x0,0x66bd(%rip)        # 40b988 <notify>
  4052cb:	0f 84 b1 00 00 00    	je     405382 <notify_server+0xee>
  4052d1:	44 8b 05 54 67 00 00 	mov    0x6754(%rip),%r8d        # 40ba2c <authkey>
  4052d8:	85 db                	test   %ebx,%ebx
  4052da:	0f 84 ad 00 00 00    	je     40538d <notify_server+0xf9>
  4052e0:	bd c9 84 40 00       	mov    $0x4084c9,%ebp
  4052e5:	68 40 ba 40 00       	pushq  $0x40ba40
  4052ea:	56                   	push   %rsi
  4052eb:	48 89 e9             	mov    %rbp,%rcx
  4052ee:	8b 15 74 5e 00 00    	mov    0x5e74(%rip),%edx        # 40b168 <target_id>
  4052f4:	be d3 84 40 00       	mov    $0x4084d3,%esi
  4052f9:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  405300:	00 
  405301:	b8 00 00 00 00       	mov    $0x0,%eax
  405306:	e8 15 bf ff ff       	callq  401220 <sprintf@plt>
  40530b:	48 83 c4 10          	add    $0x10,%rsp
  40530f:	83 3d 72 66 00 00 00 	cmpl   $0x0,0x6672(%rip)        # 40b988 <notify>
  405316:	0f 84 ab 00 00 00    	je     4053c7 <notify_server+0x133>
  40531c:	85 db                	test   %ebx,%ebx
  40531e:	0f 84 8f 00 00 00    	je     4053b3 <notify_server+0x11f>
  405324:	49 89 e1             	mov    %rsp,%r9
  405327:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40532d:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  405334:	00 
  405335:	48 8b 15 34 5e 00 00 	mov    0x5e34(%rip),%rdx        # 40b170 <lab>
  40533c:	48 8b 35 3d 66 00 00 	mov    0x663d(%rip),%rsi        # 40b980 <course>
  405343:	48 8b 3d 16 5e 00 00 	mov    0x5e16(%rip),%rdi        # 40b160 <user_id>
  40534a:	e8 9e 0f 00 00       	callq  4062ed <driver_post>
  40534f:	85 c0                	test   %eax,%eax
  405351:	78 44                	js     405397 <notify_server+0x103>
  405353:	bf 18 86 40 00       	mov    $0x408618,%edi
  405358:	e8 33 bd ff ff       	callq  401090 <puts@plt>
  40535d:	bf fb 84 40 00       	mov    $0x4084fb,%edi
  405362:	e8 29 bd ff ff       	callq  401090 <puts@plt>
  405367:	eb 54                	jmp    4053bd <notify_server+0x129>
  405369:	bf e8 85 40 00       	mov    $0x4085e8,%edi
  40536e:	b8 00 00 00 00       	mov    $0x0,%eax
  405373:	e8 58 bd ff ff       	callq  4010d0 <printf@plt>
  405378:	bf 01 00 00 00       	mov    $0x1,%edi
  40537d:	e8 ae be ff ff       	callq  401230 <exit@plt>
  405382:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  405388:	e9 4b ff ff ff       	jmpq   4052d8 <notify_server+0x44>
  40538d:	bd ce 84 40 00       	mov    $0x4084ce,%ebp
  405392:	e9 4e ff ff ff       	jmpq   4052e5 <notify_server+0x51>
  405397:	48 89 e6             	mov    %rsp,%rsi
  40539a:	bf ef 84 40 00       	mov    $0x4084ef,%edi
  40539f:	b8 00 00 00 00       	mov    $0x0,%eax
  4053a4:	e8 27 bd ff ff       	callq  4010d0 <printf@plt>
  4053a9:	bf 01 00 00 00       	mov    $0x1,%edi
  4053ae:	e8 7d be ff ff       	callq  401230 <exit@plt>
  4053b3:	bf 05 85 40 00       	mov    $0x408505,%edi
  4053b8:	e8 d3 bc ff ff       	callq  401090 <puts@plt>
  4053bd:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  4053c4:	5b                   	pop    %rbx
  4053c5:	5d                   	pop    %rbp
  4053c6:	c3                   	retq   
  4053c7:	48 89 ee             	mov    %rbp,%rsi
  4053ca:	bf 50 86 40 00       	mov    $0x408650,%edi
  4053cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4053d4:	e8 f7 bc ff ff       	callq  4010d0 <printf@plt>
  4053d9:	48 8b 35 80 5d 00 00 	mov    0x5d80(%rip),%rsi        # 40b160 <user_id>
  4053e0:	bf 0c 85 40 00       	mov    $0x40850c,%edi
  4053e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4053ea:	e8 e1 bc ff ff       	callq  4010d0 <printf@plt>
  4053ef:	48 8b 35 8a 65 00 00 	mov    0x658a(%rip),%rsi        # 40b980 <course>
  4053f6:	bf 19 85 40 00       	mov    $0x408519,%edi
  4053fb:	b8 00 00 00 00       	mov    $0x0,%eax
  405400:	e8 cb bc ff ff       	callq  4010d0 <printf@plt>
  405405:	48 8b 35 64 5d 00 00 	mov    0x5d64(%rip),%rsi        # 40b170 <lab>
  40540c:	bf 25 85 40 00       	mov    $0x408525,%edi
  405411:	b8 00 00 00 00       	mov    $0x0,%eax
  405416:	e8 b5 bc ff ff       	callq  4010d0 <printf@plt>
  40541b:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  405422:	00 
  405423:	bf 2e 85 40 00       	mov    $0x40852e,%edi
  405428:	b8 00 00 00 00       	mov    $0x0,%eax
  40542d:	e8 9e bc ff ff       	callq  4010d0 <printf@plt>
  405432:	eb 89                	jmp    4053bd <notify_server+0x129>
  405434:	c3                   	retq   

0000000000405435 <validate>:
  405435:	53                   	push   %rbx
  405436:	89 fb                	mov    %edi,%ebx
  405438:	83 3d f5 65 00 00 00 	cmpl   $0x0,0x65f5(%rip)        # 40ba34 <is_checker>
  40543f:	74 60                	je     4054a1 <validate+0x6c>
  405441:	39 3d e1 65 00 00    	cmp    %edi,0x65e1(%rip)        # 40ba28 <vlevel>
  405447:	75 29                	jne    405472 <validate+0x3d>
  405449:	8b 35 d5 65 00 00    	mov    0x65d5(%rip),%esi        # 40ba24 <check_level>
  40544f:	39 fe                	cmp    %edi,%esi
  405451:	75 33                	jne    405486 <validate+0x51>
  405453:	0f be 35 c6 65 00 00 	movsbl 0x65c6(%rip),%esi        # 40ba20 <target_prefix>
  40545a:	b9 40 ba 40 00       	mov    $0x40ba40,%ecx
  40545f:	89 fa                	mov    %edi,%edx
  405461:	bf 58 85 40 00       	mov    $0x408558,%edi
  405466:	b8 00 00 00 00       	mov    $0x0,%eax
  40546b:	e8 60 bc ff ff       	callq  4010d0 <printf@plt>
  405470:	5b                   	pop    %rbx
  405471:	c3                   	retq   
  405472:	bf 3a 85 40 00       	mov    $0x40853a,%edi
  405477:	e8 14 bc ff ff       	callq  401090 <puts@plt>
  40547c:	b8 00 00 00 00       	mov    $0x0,%eax
  405481:	e8 8d fd ff ff       	callq  405213 <check_fail>
  405486:	89 fa                	mov    %edi,%edx
  405488:	bf 78 86 40 00       	mov    $0x408678,%edi
  40548d:	b8 00 00 00 00       	mov    $0x0,%eax
  405492:	e8 39 bc ff ff       	callq  4010d0 <printf@plt>
  405497:	b8 00 00 00 00       	mov    $0x0,%eax
  40549c:	e8 72 fd ff ff       	callq  405213 <check_fail>
  4054a1:	39 3d 81 65 00 00    	cmp    %edi,0x6581(%rip)        # 40ba28 <vlevel>
  4054a7:	74 18                	je     4054c1 <validate+0x8c>
  4054a9:	bf 3a 85 40 00       	mov    $0x40853a,%edi
  4054ae:	e8 dd bb ff ff       	callq  401090 <puts@plt>
  4054b3:	89 de                	mov    %ebx,%esi
  4054b5:	bf 00 00 00 00       	mov    $0x0,%edi
  4054ba:	e8 d5 fd ff ff       	callq  405294 <notify_server>
  4054bf:	eb af                	jmp    405470 <validate+0x3b>
  4054c1:	0f be 15 58 65 00 00 	movsbl 0x6558(%rip),%edx        # 40ba20 <target_prefix>
  4054c8:	89 fe                	mov    %edi,%esi
  4054ca:	bf a0 86 40 00       	mov    $0x4086a0,%edi
  4054cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4054d4:	e8 f7 bb ff ff       	callq  4010d0 <printf@plt>
  4054d9:	89 de                	mov    %ebx,%esi
  4054db:	bf 01 00 00 00       	mov    $0x1,%edi
  4054e0:	e8 af fd ff ff       	callq  405294 <notify_server>
  4054e5:	eb 89                	jmp    405470 <validate+0x3b>

00000000004054e7 <fail>:
  4054e7:	48 83 ec 08          	sub    $0x8,%rsp
  4054eb:	83 3d 42 65 00 00 00 	cmpl   $0x0,0x6542(%rip)        # 40ba34 <is_checker>
  4054f2:	75 11                	jne    405505 <fail+0x1e>
  4054f4:	89 fe                	mov    %edi,%esi
  4054f6:	bf 00 00 00 00       	mov    $0x0,%edi
  4054fb:	e8 94 fd ff ff       	callq  405294 <notify_server>
  405500:	48 83 c4 08          	add    $0x8,%rsp
  405504:	c3                   	retq   
  405505:	b8 00 00 00 00       	mov    $0x0,%eax
  40550a:	e8 04 fd ff ff       	callq  405213 <check_fail>

000000000040550f <bushandler>:
  40550f:	48 83 ec 08          	sub    $0x8,%rsp
  405513:	83 3d 1a 65 00 00 00 	cmpl   $0x0,0x651a(%rip)        # 40ba34 <is_checker>
  40551a:	74 14                	je     405530 <bushandler+0x21>
  40551c:	bf 6d 85 40 00       	mov    $0x40856d,%edi
  405521:	e8 6a bb ff ff       	callq  401090 <puts@plt>
  405526:	b8 00 00 00 00       	mov    $0x0,%eax
  40552b:	e8 e3 fc ff ff       	callq  405213 <check_fail>
  405530:	bf d8 86 40 00       	mov    $0x4086d8,%edi
  405535:	e8 56 bb ff ff       	callq  401090 <puts@plt>
  40553a:	bf 77 85 40 00       	mov    $0x408577,%edi
  40553f:	e8 4c bb ff ff       	callq  401090 <puts@plt>
  405544:	be 00 00 00 00       	mov    $0x0,%esi
  405549:	bf 00 00 00 00       	mov    $0x0,%edi
  40554e:	e8 41 fd ff ff       	callq  405294 <notify_server>
  405553:	bf 01 00 00 00       	mov    $0x1,%edi
  405558:	e8 d3 bc ff ff       	callq  401230 <exit@plt>

000000000040555d <seghandler>:
  40555d:	48 83 ec 08          	sub    $0x8,%rsp
  405561:	83 3d cc 64 00 00 00 	cmpl   $0x0,0x64cc(%rip)        # 40ba34 <is_checker>
  405568:	74 14                	je     40557e <seghandler+0x21>
  40556a:	bf 8d 85 40 00       	mov    $0x40858d,%edi
  40556f:	e8 1c bb ff ff       	callq  401090 <puts@plt>
  405574:	b8 00 00 00 00       	mov    $0x0,%eax
  405579:	e8 95 fc ff ff       	callq  405213 <check_fail>
  40557e:	bf f8 86 40 00       	mov    $0x4086f8,%edi
  405583:	e8 08 bb ff ff       	callq  401090 <puts@plt>
  405588:	bf 77 85 40 00       	mov    $0x408577,%edi
  40558d:	e8 fe ba ff ff       	callq  401090 <puts@plt>
  405592:	be 00 00 00 00       	mov    $0x0,%esi
  405597:	bf 00 00 00 00       	mov    $0x0,%edi
  40559c:	e8 f3 fc ff ff       	callq  405294 <notify_server>
  4055a1:	bf 01 00 00 00       	mov    $0x1,%edi
  4055a6:	e8 85 bc ff ff       	callq  401230 <exit@plt>

00000000004055ab <illegalhandler>:
  4055ab:	48 83 ec 08          	sub    $0x8,%rsp
  4055af:	83 3d 7e 64 00 00 00 	cmpl   $0x0,0x647e(%rip)        # 40ba34 <is_checker>
  4055b6:	74 14                	je     4055cc <illegalhandler+0x21>
  4055b8:	bf a0 85 40 00       	mov    $0x4085a0,%edi
  4055bd:	e8 ce ba ff ff       	callq  401090 <puts@plt>
  4055c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4055c7:	e8 47 fc ff ff       	callq  405213 <check_fail>
  4055cc:	bf 20 87 40 00       	mov    $0x408720,%edi
  4055d1:	e8 ba ba ff ff       	callq  401090 <puts@plt>
  4055d6:	bf 77 85 40 00       	mov    $0x408577,%edi
  4055db:	e8 b0 ba ff ff       	callq  401090 <puts@plt>
  4055e0:	be 00 00 00 00       	mov    $0x0,%esi
  4055e5:	bf 00 00 00 00       	mov    $0x0,%edi
  4055ea:	e8 a5 fc ff ff       	callq  405294 <notify_server>
  4055ef:	bf 01 00 00 00       	mov    $0x1,%edi
  4055f4:	e8 37 bc ff ff       	callq  401230 <exit@plt>

00000000004055f9 <sigalrmhandler>:
  4055f9:	48 83 ec 08          	sub    $0x8,%rsp
  4055fd:	83 3d 30 64 00 00 00 	cmpl   $0x0,0x6430(%rip)        # 40ba34 <is_checker>
  405604:	74 14                	je     40561a <sigalrmhandler+0x21>
  405606:	bf b4 85 40 00       	mov    $0x4085b4,%edi
  40560b:	e8 80 ba ff ff       	callq  401090 <puts@plt>
  405610:	b8 00 00 00 00       	mov    $0x0,%eax
  405615:	e8 f9 fb ff ff       	callq  405213 <check_fail>
  40561a:	be 05 00 00 00       	mov    $0x5,%esi
  40561f:	bf 50 87 40 00       	mov    $0x408750,%edi
  405624:	b8 00 00 00 00       	mov    $0x0,%eax
  405629:	e8 a2 ba ff ff       	callq  4010d0 <printf@plt>
  40562e:	be 00 00 00 00       	mov    $0x0,%esi
  405633:	bf 00 00 00 00       	mov    $0x0,%edi
  405638:	e8 57 fc ff ff       	callq  405294 <notify_server>
  40563d:	bf 01 00 00 00       	mov    $0x1,%edi
  405642:	e8 e9 bb ff ff       	callq  401230 <exit@plt>

0000000000405647 <launch>:
  405647:	55                   	push   %rbp
  405648:	48 89 e5             	mov    %rsp,%rbp
  40564b:	48 89 fa             	mov    %rdi,%rdx
  40564e:	48 8d 47 17          	lea    0x17(%rdi),%rax
  405652:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  405656:	48 29 c4             	sub    %rax,%rsp
  405659:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  40565e:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  405662:	be f4 00 00 00       	mov    $0xf4,%esi
  405667:	e8 74 ba ff ff       	callq  4010e0 <memset@plt>
  40566c:	48 8b 05 2d 63 00 00 	mov    0x632d(%rip),%rax        # 40b9a0 <stdin@@GLIBC_2.2.5>
  405673:	48 39 05 9e 63 00 00 	cmp    %rax,0x639e(%rip)        # 40ba18 <infile>
  40567a:	74 29                	je     4056a5 <launch+0x5e>
  40567c:	c7 05 a2 63 00 00 00 	movl   $0x0,0x63a2(%rip)        # 40ba28 <vlevel>
  405683:	00 00 00 
  405686:	b8 00 00 00 00       	mov    $0x0,%eax
  40568b:	e8 d4 f9 ff ff       	callq  405064 <test>
  405690:	83 3d 9d 63 00 00 00 	cmpl   $0x0,0x639d(%rip)        # 40ba34 <is_checker>
  405697:	75 1d                	jne    4056b6 <launch+0x6f>
  405699:	bf d4 85 40 00       	mov    $0x4085d4,%edi
  40569e:	e8 ed b9 ff ff       	callq  401090 <puts@plt>
  4056a3:	c9                   	leaveq 
  4056a4:	c3                   	retq   
  4056a5:	bf bc 85 40 00       	mov    $0x4085bc,%edi
  4056aa:	b8 00 00 00 00       	mov    $0x0,%eax
  4056af:	e8 1c ba ff ff       	callq  4010d0 <printf@plt>
  4056b4:	eb c6                	jmp    40567c <launch+0x35>
  4056b6:	bf c9 85 40 00       	mov    $0x4085c9,%edi
  4056bb:	e8 d0 b9 ff ff       	callq  401090 <puts@plt>
  4056c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4056c5:	e8 49 fb ff ff       	callq  405213 <check_fail>

00000000004056ca <stable_launch>:
  4056ca:	53                   	push   %rbx
  4056cb:	48 89 3d 3e 63 00 00 	mov    %rdi,0x633e(%rip)        # 40ba10 <global_offset>
  4056d2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  4056d8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  4056de:	b9 32 01 00 00       	mov    $0x132,%ecx
  4056e3:	ba 07 00 00 00       	mov    $0x7,%edx
  4056e8:	be 00 00 10 00       	mov    $0x100000,%esi
  4056ed:	bf 00 60 58 55       	mov    $0x55586000,%edi
  4056f2:	e8 c9 b9 ff ff       	callq  4010c0 <mmap@plt>
  4056f7:	48 89 c3             	mov    %rax,%rbx
  4056fa:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  405700:	75 43                	jne    405745 <stable_launch+0x7b>
  405702:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  405709:	48 89 15 f8 62 00 00 	mov    %rdx,0x62f8(%rip)        # 40ba08 <stack_top>
  405710:	48 89 e0             	mov    %rsp,%rax
  405713:	48 89 d4             	mov    %rdx,%rsp
  405716:	48 89 c2             	mov    %rax,%rdx
  405719:	48 89 15 e0 62 00 00 	mov    %rdx,0x62e0(%rip)        # 40ba00 <global_save_stack>
  405720:	48 8b 3d e9 62 00 00 	mov    0x62e9(%rip),%rdi        # 40ba10 <global_offset>
  405727:	e8 1b ff ff ff       	callq  405647 <launch>
  40572c:	48 8b 05 cd 62 00 00 	mov    0x62cd(%rip),%rax        # 40ba00 <global_save_stack>
  405733:	48 89 c4             	mov    %rax,%rsp
  405736:	be 00 00 10 00       	mov    $0x100000,%esi
  40573b:	48 89 df             	mov    %rbx,%rdi
  40573e:	e8 6d ba ff ff       	callq  4011b0 <munmap@plt>
  405743:	5b                   	pop    %rbx
  405744:	c3                   	retq   
  405745:	be 00 00 10 00       	mov    $0x100000,%esi
  40574a:	48 89 c7             	mov    %rax,%rdi
  40574d:	e8 5e ba ff ff       	callq  4011b0 <munmap@plt>
  405752:	ba 00 60 58 55       	mov    $0x55586000,%edx
  405757:	be 88 87 40 00       	mov    $0x408788,%esi
  40575c:	48 8b 3d 7d 62 00 00 	mov    0x627d(%rip),%rdi        # 40b9e0 <stderr@@GLIBC_2.2.5>
  405763:	b8 00 00 00 00       	mov    $0x0,%eax
  405768:	e8 e3 b9 ff ff       	callq  401150 <fprintf@plt>
  40576d:	bf 01 00 00 00       	mov    $0x1,%edi
  405772:	e8 b9 ba ff ff       	callq  401230 <exit@plt>

0000000000405777 <rio_readinitb>:
  405777:	89 37                	mov    %esi,(%rdi)
  405779:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  405780:	48 8d 47 10          	lea    0x10(%rdi),%rax
  405784:	48 89 47 08          	mov    %rax,0x8(%rdi)
  405788:	c3                   	retq   

0000000000405789 <sigalrm_handler>:
  405789:	48 83 ec 08          	sub    $0x8,%rsp
  40578d:	ba 00 00 00 00       	mov    $0x0,%edx
  405792:	be c0 87 40 00       	mov    $0x4087c0,%esi
  405797:	48 8b 3d 42 62 00 00 	mov    0x6242(%rip),%rdi        # 40b9e0 <stderr@@GLIBC_2.2.5>
  40579e:	b8 00 00 00 00       	mov    $0x0,%eax
  4057a3:	e8 a8 b9 ff ff       	callq  401150 <fprintf@plt>
  4057a8:	bf 01 00 00 00       	mov    $0x1,%edi
  4057ad:	e8 7e ba ff ff       	callq  401230 <exit@plt>

00000000004057b2 <urlencode>:
  4057b2:	41 54                	push   %r12
  4057b4:	55                   	push   %rbp
  4057b5:	53                   	push   %rbx
  4057b6:	48 83 ec 10          	sub    $0x10,%rsp
  4057ba:	48 89 fb             	mov    %rdi,%rbx
  4057bd:	48 89 f5             	mov    %rsi,%rbp
  4057c0:	e8 eb b8 ff ff       	callq  4010b0 <strlen@plt>
  4057c5:	eb 0e                	jmp    4057d5 <urlencode+0x23>
  4057c7:	88 55 00             	mov    %dl,0x0(%rbp)
  4057ca:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4057ce:	48 83 c3 01          	add    $0x1,%rbx
  4057d2:	44 89 e0             	mov    %r12d,%eax
  4057d5:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4057d9:	85 c0                	test   %eax,%eax
  4057db:	0f 84 93 00 00 00    	je     405874 <urlencode+0xc2>
  4057e1:	0f b6 13             	movzbl (%rbx),%edx
  4057e4:	80 fa 2a             	cmp    $0x2a,%dl
  4057e7:	0f 94 c0             	sete   %al
  4057ea:	80 fa 2d             	cmp    $0x2d,%dl
  4057ed:	0f 94 c1             	sete   %cl
  4057f0:	08 c8                	or     %cl,%al
  4057f2:	75 d3                	jne    4057c7 <urlencode+0x15>
  4057f4:	80 fa 2e             	cmp    $0x2e,%dl
  4057f7:	74 ce                	je     4057c7 <urlencode+0x15>
  4057f9:	80 fa 5f             	cmp    $0x5f,%dl
  4057fc:	74 c9                	je     4057c7 <urlencode+0x15>
  4057fe:	8d 42 d0             	lea    -0x30(%rdx),%eax
  405801:	3c 09                	cmp    $0x9,%al
  405803:	76 c2                	jbe    4057c7 <urlencode+0x15>
  405805:	8d 42 bf             	lea    -0x41(%rdx),%eax
  405808:	3c 19                	cmp    $0x19,%al
  40580a:	76 bb                	jbe    4057c7 <urlencode+0x15>
  40580c:	8d 42 9f             	lea    -0x61(%rdx),%eax
  40580f:	3c 19                	cmp    $0x19,%al
  405811:	76 b4                	jbe    4057c7 <urlencode+0x15>
  405813:	80 fa 20             	cmp    $0x20,%dl
  405816:	74 4a                	je     405862 <urlencode+0xb0>
  405818:	8d 42 e0             	lea    -0x20(%rdx),%eax
  40581b:	3c 5f                	cmp    $0x5f,%al
  40581d:	0f 96 c0             	setbe  %al
  405820:	80 fa 09             	cmp    $0x9,%dl
  405823:	0f 94 c1             	sete   %cl
  405826:	08 c8                	or     %cl,%al
  405828:	74 45                	je     40586f <urlencode+0xbd>
  40582a:	0f b6 d2             	movzbl %dl,%edx
  40582d:	be 55 88 40 00       	mov    $0x408855,%esi
  405832:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  405837:	b8 00 00 00 00       	mov    $0x0,%eax
  40583c:	e8 df b9 ff ff       	callq  401220 <sprintf@plt>
  405841:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  405846:	88 45 00             	mov    %al,0x0(%rbp)
  405849:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  40584e:	88 45 01             	mov    %al,0x1(%rbp)
  405851:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  405856:	88 45 02             	mov    %al,0x2(%rbp)
  405859:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40585d:	e9 6c ff ff ff       	jmpq   4057ce <urlencode+0x1c>
  405862:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  405866:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40586a:	e9 5f ff ff ff       	jmpq   4057ce <urlencode+0x1c>
  40586f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405874:	48 83 c4 10          	add    $0x10,%rsp
  405878:	5b                   	pop    %rbx
  405879:	5d                   	pop    %rbp
  40587a:	41 5c                	pop    %r12
  40587c:	c3                   	retq   

000000000040587d <rio_writen>:
  40587d:	41 55                	push   %r13
  40587f:	41 54                	push   %r12
  405881:	55                   	push   %rbp
  405882:	53                   	push   %rbx
  405883:	48 83 ec 08          	sub    $0x8,%rsp
  405887:	41 89 fc             	mov    %edi,%r12d
  40588a:	48 89 f5             	mov    %rsi,%rbp
  40588d:	49 89 d5             	mov    %rdx,%r13
  405890:	48 89 d3             	mov    %rdx,%rbx
  405893:	eb 06                	jmp    40589b <rio_writen+0x1e>
  405895:	48 29 c3             	sub    %rax,%rbx
  405898:	48 01 c5             	add    %rax,%rbp
  40589b:	48 85 db             	test   %rbx,%rbx
  40589e:	74 24                	je     4058c4 <rio_writen+0x47>
  4058a0:	48 89 da             	mov    %rbx,%rdx
  4058a3:	48 89 ee             	mov    %rbp,%rsi
  4058a6:	44 89 e7             	mov    %r12d,%edi
  4058a9:	e8 f2 b7 ff ff       	callq  4010a0 <write@plt>
  4058ae:	48 85 c0             	test   %rax,%rax
  4058b1:	7f e2                	jg     405895 <rio_writen+0x18>
  4058b3:	e8 88 b7 ff ff       	callq  401040 <__errno_location@plt>
  4058b8:	83 38 04             	cmpl   $0x4,(%rax)
  4058bb:	75 15                	jne    4058d2 <rio_writen+0x55>
  4058bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4058c2:	eb d1                	jmp    405895 <rio_writen+0x18>
  4058c4:	4c 89 e8             	mov    %r13,%rax
  4058c7:	48 83 c4 08          	add    $0x8,%rsp
  4058cb:	5b                   	pop    %rbx
  4058cc:	5d                   	pop    %rbp
  4058cd:	41 5c                	pop    %r12
  4058cf:	41 5d                	pop    %r13
  4058d1:	c3                   	retq   
  4058d2:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4058d9:	eb ec                	jmp    4058c7 <rio_writen+0x4a>

00000000004058db <rio_read>:
  4058db:	41 55                	push   %r13
  4058dd:	41 54                	push   %r12
  4058df:	55                   	push   %rbp
  4058e0:	53                   	push   %rbx
  4058e1:	48 83 ec 08          	sub    $0x8,%rsp
  4058e5:	48 89 fb             	mov    %rdi,%rbx
  4058e8:	49 89 f5             	mov    %rsi,%r13
  4058eb:	49 89 d4             	mov    %rdx,%r12
  4058ee:	eb 0a                	jmp    4058fa <rio_read+0x1f>
  4058f0:	e8 4b b7 ff ff       	callq  401040 <__errno_location@plt>
  4058f5:	83 38 04             	cmpl   $0x4,(%rax)
  4058f8:	75 5a                	jne    405954 <rio_read+0x79>
  4058fa:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4058fd:	85 ed                	test   %ebp,%ebp
  4058ff:	7f 22                	jg     405923 <rio_read+0x48>
  405901:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  405905:	ba 00 20 00 00       	mov    $0x2000,%edx
  40590a:	48 89 ee             	mov    %rbp,%rsi
  40590d:	8b 3b                	mov    (%rbx),%edi
  40590f:	e8 fc b7 ff ff       	callq  401110 <read@plt>
  405914:	89 43 04             	mov    %eax,0x4(%rbx)
  405917:	85 c0                	test   %eax,%eax
  405919:	78 d5                	js     4058f0 <rio_read+0x15>
  40591b:	74 40                	je     40595d <rio_read+0x82>
  40591d:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  405921:	eb d7                	jmp    4058fa <rio_read+0x1f>
  405923:	89 e8                	mov    %ebp,%eax
  405925:	4c 39 e0             	cmp    %r12,%rax
  405928:	72 03                	jb     40592d <rio_read+0x52>
  40592a:	44 89 e5             	mov    %r12d,%ebp
  40592d:	4c 63 e5             	movslq %ebp,%r12
  405930:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  405934:	4c 89 e2             	mov    %r12,%rdx
  405937:	4c 89 ef             	mov    %r13,%rdi
  40593a:	e8 31 b8 ff ff       	callq  401170 <memcpy@plt>
  40593f:	4c 01 63 08          	add    %r12,0x8(%rbx)
  405943:	29 6b 04             	sub    %ebp,0x4(%rbx)
  405946:	4c 89 e0             	mov    %r12,%rax
  405949:	48 83 c4 08          	add    $0x8,%rsp
  40594d:	5b                   	pop    %rbx
  40594e:	5d                   	pop    %rbp
  40594f:	41 5c                	pop    %r12
  405951:	41 5d                	pop    %r13
  405953:	c3                   	retq   
  405954:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40595b:	eb ec                	jmp    405949 <rio_read+0x6e>
  40595d:	b8 00 00 00 00       	mov    $0x0,%eax
  405962:	eb e5                	jmp    405949 <rio_read+0x6e>

0000000000405964 <rio_readlineb>:
  405964:	41 55                	push   %r13
  405966:	41 54                	push   %r12
  405968:	55                   	push   %rbp
  405969:	53                   	push   %rbx
  40596a:	48 83 ec 18          	sub    $0x18,%rsp
  40596e:	49 89 fd             	mov    %rdi,%r13
  405971:	48 89 f5             	mov    %rsi,%rbp
  405974:	49 89 d4             	mov    %rdx,%r12
  405977:	bb 01 00 00 00       	mov    $0x1,%ebx
  40597c:	eb 18                	jmp    405996 <rio_readlineb+0x32>
  40597e:	85 c0                	test   %eax,%eax
  405980:	75 55                	jne    4059d7 <rio_readlineb+0x73>
  405982:	48 83 fb 01          	cmp    $0x1,%rbx
  405986:	75 3d                	jne    4059c5 <rio_readlineb+0x61>
  405988:	b8 00 00 00 00       	mov    $0x0,%eax
  40598d:	eb 3d                	jmp    4059cc <rio_readlineb+0x68>
  40598f:	48 83 c3 01          	add    $0x1,%rbx
  405993:	48 89 d5             	mov    %rdx,%rbp
  405996:	4c 39 e3             	cmp    %r12,%rbx
  405999:	73 2a                	jae    4059c5 <rio_readlineb+0x61>
  40599b:	ba 01 00 00 00       	mov    $0x1,%edx
  4059a0:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4059a5:	4c 89 ef             	mov    %r13,%rdi
  4059a8:	e8 2e ff ff ff       	callq  4058db <rio_read>
  4059ad:	83 f8 01             	cmp    $0x1,%eax
  4059b0:	75 cc                	jne    40597e <rio_readlineb+0x1a>
  4059b2:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  4059b6:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  4059bb:	88 45 00             	mov    %al,0x0(%rbp)
  4059be:	3c 0a                	cmp    $0xa,%al
  4059c0:	75 cd                	jne    40598f <rio_readlineb+0x2b>
  4059c2:	48 89 d5             	mov    %rdx,%rbp
  4059c5:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4059c9:	48 89 d8             	mov    %rbx,%rax
  4059cc:	48 83 c4 18          	add    $0x18,%rsp
  4059d0:	5b                   	pop    %rbx
  4059d1:	5d                   	pop    %rbp
  4059d2:	41 5c                	pop    %r12
  4059d4:	41 5d                	pop    %r13
  4059d6:	c3                   	retq   
  4059d7:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4059de:	eb ec                	jmp    4059cc <rio_readlineb+0x68>

00000000004059e0 <submitr>:
  4059e0:	41 57                	push   %r15
  4059e2:	41 56                	push   %r14
  4059e4:	41 55                	push   %r13
  4059e6:	41 54                	push   %r12
  4059e8:	55                   	push   %rbp
  4059e9:	53                   	push   %rbx
  4059ea:	48 81 ec 38 a0 00 00 	sub    $0xa038,%rsp
  4059f1:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
  4059f6:	49 89 d5             	mov    %rdx,%r13
  4059f9:	49 89 cc             	mov    %rcx,%r12
  4059fc:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  405a01:	4d 89 ce             	mov    %r9,%r14
  405a04:	48 8b ac 24 70 a0 00 	mov    0xa070(%rsp),%rbp
  405a0b:	00 
  405a0c:	ba 00 00 00 00       	mov    $0x0,%edx
  405a11:	be 01 00 00 00       	mov    $0x1,%esi
  405a16:	bf 02 00 00 00       	mov    $0x2,%edi
  405a1b:	e8 50 b8 ff ff       	callq  401270 <socket@plt>
  405a20:	85 c0                	test   %eax,%eax
  405a22:	0f 88 2f 01 00 00    	js     405b57 <submitr+0x177>
  405a28:	89 c3                	mov    %eax,%ebx
  405a2a:	ba 10 00 00 00       	mov    $0x10,%edx
  405a2f:	be 50 c6 40 00       	mov    $0x40c650,%esi
  405a34:	89 c7                	mov    %eax,%edi
  405a36:	e8 05 b8 ff ff       	callq  401240 <connect@plt>
  405a3b:	85 c0                	test   %eax,%eax
  405a3d:	0f 88 63 01 00 00    	js     405ba6 <submitr+0x1c6>
  405a43:	4c 89 f7             	mov    %r14,%rdi
  405a46:	e8 65 b6 ff ff       	callq  4010b0 <strlen@plt>
  405a4b:	49 89 c7             	mov    %rax,%r15
  405a4e:	4c 89 ef             	mov    %r13,%rdi
  405a51:	e8 5a b6 ff ff       	callq  4010b0 <strlen@plt>
  405a56:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  405a5b:	4c 89 e7             	mov    %r12,%rdi
  405a5e:	e8 4d b6 ff ff       	callq  4010b0 <strlen@plt>
  405a63:	48 03 44 24 10       	add    0x10(%rsp),%rax
  405a68:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  405a6d:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  405a72:	e8 39 b6 ff ff       	callq  4010b0 <strlen@plt>
  405a77:	48 03 44 24 10       	add    0x10(%rsp),%rax
  405a7c:	4b 8d 14 7f          	lea    (%r15,%r15,2),%rdx
  405a80:	48 8d 84 10 80 00 00 	lea    0x80(%rax,%rdx,1),%rax
  405a87:	00 
  405a88:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  405a8e:	0f 87 6c 01 00 00    	ja     405c00 <submitr+0x220>
  405a94:	48 8d b4 24 20 40 00 	lea    0x4020(%rsp),%rsi
  405a9b:	00 
  405a9c:	b9 00 04 00 00       	mov    $0x400,%ecx
  405aa1:	b8 00 00 00 00       	mov    $0x0,%eax
  405aa6:	48 89 f7             	mov    %rsi,%rdi
  405aa9:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  405aac:	4c 89 f7             	mov    %r14,%rdi
  405aaf:	e8 fe fc ff ff       	callq  4057b2 <urlencode>
  405ab4:	85 c0                	test   %eax,%eax
  405ab6:	0f 88 b7 01 00 00    	js     405c73 <submitr+0x293>
  405abc:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
  405ac1:	4c 8d 84 24 20 40 00 	lea    0x4020(%rsp),%r8
  405ac8:	00 
  405ac9:	4c 89 e9             	mov    %r13,%rcx
  405acc:	4c 89 e2             	mov    %r12,%rdx
  405acf:	be e8 87 40 00       	mov    $0x4087e8,%esi
  405ad4:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  405adb:	00 
  405adc:	b8 00 00 00 00       	mov    $0x0,%eax
  405ae1:	e8 3a b7 ff ff       	callq  401220 <sprintf@plt>
  405ae6:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  405aed:	00 
  405aee:	e8 bd b5 ff ff       	callq  4010b0 <strlen@plt>
  405af3:	48 89 c2             	mov    %rax,%rdx
  405af6:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  405afd:	00 
  405afe:	89 df                	mov    %ebx,%edi
  405b00:	e8 78 fd ff ff       	callq  40587d <rio_writen>
  405b05:	48 85 c0             	test   %rax,%rax
  405b08:	0f 88 f0 01 00 00    	js     405cfe <submitr+0x31e>
  405b0e:	89 de                	mov    %ebx,%esi
  405b10:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  405b17:	00 
  405b18:	e8 5a fc ff ff       	callq  405777 <rio_readinitb>
  405b1d:	ba 00 20 00 00       	mov    $0x2000,%edx
  405b22:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  405b29:	00 
  405b2a:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  405b31:	00 
  405b32:	e8 2d fe ff ff       	callq  405964 <rio_readlineb>
  405b37:	48 85 c0             	test   %rax,%rax
  405b3a:	0f 8e 2d 02 00 00    	jle    405d6d <submitr+0x38d>
  405b40:	c6 84 24 20 20 00 00 	movb   $0x0,0x2020(%rsp)
  405b47:	00 
  405b48:	c6 44 24 20 00       	movb   $0x0,0x20(%rsp)
  405b4d:	ba 00 00 00 00       	mov    $0x0,%edx
  405b52:	e9 97 02 00 00       	jmpq   405dee <submitr+0x40e>
  405b57:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  405b5e:	3a 20 43 
  405b61:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  405b68:	20 75 6e 
  405b6b:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405b6f:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405b73:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  405b7a:	74 6f 20 
  405b7d:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  405b84:	65 20 73 
  405b87:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405b8b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405b8f:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  405b96:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  405b9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405ba1:	e9 17 03 00 00       	jmpq   405ebd <submitr+0x4dd>
  405ba6:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  405bad:	3a 20 55 
  405bb0:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  405bb7:	20 74 6f 
  405bba:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405bbe:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405bc2:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  405bc9:	65 63 74 
  405bcc:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  405bd3:	68 65 20 
  405bd6:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405bda:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405bde:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  405be5:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  405beb:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  405bef:	89 df                	mov    %ebx,%edi
  405bf1:	e8 0a b5 ff ff       	callq  401100 <close@plt>
  405bf6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405bfb:	e9 bd 02 00 00       	jmpq   405ebd <submitr+0x4dd>
  405c00:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  405c07:	3a 20 52 
  405c0a:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  405c11:	20 73 74 
  405c14:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405c18:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405c1c:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  405c23:	74 6f 6f 
  405c26:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  405c2d:	65 2e 20 
  405c30:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405c34:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405c38:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  405c3f:	61 73 65 
  405c42:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  405c49:	49 54 52 
  405c4c:	48 89 45 20          	mov    %rax,0x20(%rbp)
  405c50:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  405c54:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  405c5b:	55 46 00 
  405c5e:	48 89 45 30          	mov    %rax,0x30(%rbp)
  405c62:	89 df                	mov    %ebx,%edi
  405c64:	e8 97 b4 ff ff       	callq  401100 <close@plt>
  405c69:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405c6e:	e9 4a 02 00 00       	jmpq   405ebd <submitr+0x4dd>
  405c73:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  405c7a:	3a 20 52 
  405c7d:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  405c84:	20 73 74 
  405c87:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405c8b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405c8f:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  405c96:	63 6f 6e 
  405c99:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  405ca0:	20 61 6e 
  405ca3:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405ca7:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405cab:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  405cb2:	67 61 6c 
  405cb5:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  405cbc:	6e 70 72 
  405cbf:	48 89 45 20          	mov    %rax,0x20(%rbp)
  405cc3:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  405cc7:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  405cce:	6c 65 20 
  405cd1:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  405cd8:	63 74 65 
  405cdb:	48 89 45 30          	mov    %rax,0x30(%rbp)
  405cdf:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  405ce3:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  405ce9:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  405ced:	89 df                	mov    %ebx,%edi
  405cef:	e8 0c b4 ff ff       	callq  401100 <close@plt>
  405cf4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405cf9:	e9 bf 01 00 00       	jmpq   405ebd <submitr+0x4dd>
  405cfe:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  405d05:	3a 20 43 
  405d08:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  405d0f:	20 75 6e 
  405d12:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405d16:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405d1a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  405d21:	74 6f 20 
  405d24:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  405d2b:	20 74 6f 
  405d2e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405d32:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405d36:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  405d3d:	72 65 73 
  405d40:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  405d47:	65 72 76 
  405d4a:	48 89 45 20          	mov    %rax,0x20(%rbp)
  405d4e:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  405d52:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  405d58:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  405d5c:	89 df                	mov    %ebx,%edi
  405d5e:	e8 9d b3 ff ff       	callq  401100 <close@plt>
  405d63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405d68:	e9 50 01 00 00       	jmpq   405ebd <submitr+0x4dd>
  405d6d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  405d74:	3a 20 43 
  405d77:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  405d7e:	20 75 6e 
  405d81:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405d85:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405d89:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  405d90:	74 6f 20 
  405d93:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  405d9a:	66 69 72 
  405d9d:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405da1:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405da5:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  405dac:	61 64 65 
  405daf:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  405db6:	6d 20 72 
  405db9:	48 89 45 20          	mov    %rax,0x20(%rbp)
  405dbd:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  405dc1:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  405dc8:	20 73 65 
  405dcb:	48 89 45 30          	mov    %rax,0x30(%rbp)
  405dcf:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  405dd6:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  405dda:	89 df                	mov    %ebx,%edi
  405ddc:	e8 1f b3 ff ff       	callq  401100 <close@plt>
  405de1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405de6:	e9 d2 00 00 00       	jmpq   405ebd <submitr+0x4dd>
  405deb:	83 c2 01             	add    $0x1,%edx
  405dee:	48 63 c2             	movslq %edx,%rax
  405df1:	0f b6 84 04 20 60 00 	movzbl 0x6020(%rsp,%rax,1),%eax
  405df8:	00 
  405df9:	84 c0                	test   %al,%al
  405dfb:	74 04                	je     405e01 <submitr+0x421>
  405dfd:	3c 20                	cmp    $0x20,%al
  405dff:	75 ea                	jne    405deb <submitr+0x40b>
  405e01:	3c 20                	cmp    $0x20,%al
  405e03:	0f 84 c6 00 00 00    	je     405ecf <submitr+0x4ef>
  405e09:	41 bc 63 00 00 00    	mov    $0x63,%r12d
  405e0f:	be 62 88 40 00       	mov    $0x408862,%esi
  405e14:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  405e1b:	00 
  405e1c:	e8 ff b2 ff ff       	callq  401120 <strcmp@plt>
  405e21:	85 c0                	test   %eax,%eax
  405e23:	0f 84 4b 01 00 00    	je     405f74 <submitr+0x594>
  405e29:	ba 00 20 00 00       	mov    $0x2000,%edx
  405e2e:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  405e35:	00 
  405e36:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  405e3d:	00 
  405e3e:	e8 21 fb ff ff       	callq  405964 <rio_readlineb>
  405e43:	48 85 c0             	test   %rax,%rax
  405e46:	7f c7                	jg     405e0f <submitr+0x42f>
  405e48:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  405e4f:	3a 20 43 
  405e52:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  405e59:	20 75 6e 
  405e5c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  405e60:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  405e64:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  405e6b:	74 6f 20 
  405e6e:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  405e75:	68 65 61 
  405e78:	48 89 45 10          	mov    %rax,0x10(%rbp)
  405e7c:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  405e80:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  405e87:	66 72 6f 
  405e8a:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  405e91:	20 72 65 
  405e94:	48 89 45 20          	mov    %rax,0x20(%rbp)
  405e98:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  405e9c:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  405ea3:	73 65 72 
  405ea6:	48 89 45 30          	mov    %rax,0x30(%rbp)
  405eaa:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  405eb1:	89 df                	mov    %ebx,%edi
  405eb3:	e8 48 b2 ff ff       	callq  401100 <close@plt>
  405eb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405ebd:	48 81 c4 38 a0 00 00 	add    $0xa038,%rsp
  405ec4:	5b                   	pop    %rbx
  405ec5:	5d                   	pop    %rbp
  405ec6:	41 5c                	pop    %r12
  405ec8:	41 5d                	pop    %r13
  405eca:	41 5e                	pop    %r14
  405ecc:	41 5f                	pop    %r15
  405ece:	c3                   	retq   
  405ecf:	44 8d 62 01          	lea    0x1(%rdx),%r12d
  405ed3:	48 63 d2             	movslq %edx,%rdx
  405ed6:	c6 84 14 20 60 00 00 	movb   $0x0,0x6020(%rsp,%rdx,1)
  405edd:	00 
  405ede:	ba 00 20 00 00       	mov    $0x2000,%edx
  405ee3:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  405eea:	00 
  405eeb:	48 8d bc 24 20 20 00 	lea    0x2020(%rsp),%rdi
  405ef2:	00 
  405ef3:	e8 68 b1 ff ff       	callq  401060 <strncpy@plt>
  405ef8:	44 89 e2             	mov    %r12d,%edx
  405efb:	eb 03                	jmp    405f00 <submitr+0x520>
  405efd:	83 c2 01             	add    $0x1,%edx
  405f00:	48 63 c2             	movslq %edx,%rax
  405f03:	0f b6 84 04 20 60 00 	movzbl 0x6020(%rsp,%rax,1),%eax
  405f0a:	00 
  405f0b:	84 c0                	test   %al,%al
  405f0d:	74 04                	je     405f13 <submitr+0x533>
  405f0f:	3c 20                	cmp    $0x20,%al
  405f11:	75 ea                	jne    405efd <submitr+0x51d>
  405f13:	3c 20                	cmp    $0x20,%al
  405f15:	74 0b                	je     405f22 <submitr+0x542>
  405f17:	41 bc 63 00 00 00    	mov    $0x63,%r12d
  405f1d:	e9 ed fe ff ff       	jmpq   405e0f <submitr+0x42f>
  405f22:	44 8d 6a 01          	lea    0x1(%rdx),%r13d
  405f26:	48 63 d2             	movslq %edx,%rdx
  405f29:	c6 84 14 20 60 00 00 	movb   $0x0,0x6020(%rsp,%rdx,1)
  405f30:	00 
  405f31:	49 63 fc             	movslq %r12d,%rdi
  405f34:	48 8d 84 24 20 60 00 	lea    0x6020(%rsp),%rax
  405f3b:	00 
  405f3c:	48 01 c7             	add    %rax,%rdi
  405f3f:	ba 0a 00 00 00       	mov    $0xa,%edx
  405f44:	be 00 00 00 00       	mov    $0x0,%esi
  405f49:	e8 12 b2 ff ff       	callq  401160 <strtol@plt>
  405f4e:	41 89 c4             	mov    %eax,%r12d
  405f51:	4d 63 ed             	movslq %r13d,%r13
  405f54:	48 8d 84 24 20 60 00 	lea    0x6020(%rsp),%rax
  405f5b:	00 
  405f5c:	4a 8d 34 28          	lea    (%rax,%r13,1),%rsi
  405f60:	ba 00 20 00 00       	mov    $0x2000,%edx
  405f65:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  405f6a:	e8 f1 b0 ff ff       	callq  401060 <strncpy@plt>
  405f6f:	e9 9b fe ff ff       	jmpq   405e0f <submitr+0x42f>
  405f74:	ba 00 20 00 00       	mov    $0x2000,%edx
  405f79:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  405f80:	00 
  405f81:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  405f88:	00 
  405f89:	e8 d6 f9 ff ff       	callq  405964 <rio_readlineb>
  405f8e:	48 85 c0             	test   %rax,%rax
  405f91:	7e 6d                	jle    406000 <submitr+0x620>
  405f93:	41 81 fc c8 00 00 00 	cmp    $0xc8,%r12d
  405f9a:	0f 85 e4 00 00 00    	jne    406084 <submitr+0x6a4>
  405fa0:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  405fa7:	00 
  405fa8:	48 89 ef             	mov    %rbp,%rdi
  405fab:	e8 d0 b0 ff ff       	callq  401080 <strcpy@plt>
  405fb0:	89 df                	mov    %ebx,%edi
  405fb2:	e8 49 b1 ff ff       	callq  401100 <close@plt>
  405fb7:	be 5c 88 40 00       	mov    $0x40885c,%esi
  405fbc:	48 89 ef             	mov    %rbp,%rdi
  405fbf:	e8 5c b1 ff ff       	callq  401120 <strcmp@plt>
  405fc4:	85 c0                	test   %eax,%eax
  405fc6:	0f 84 f1 fe ff ff    	je     405ebd <submitr+0x4dd>
  405fcc:	be 60 88 40 00       	mov    $0x408860,%esi
  405fd1:	48 89 ef             	mov    %rbp,%rdi
  405fd4:	e8 47 b1 ff ff       	callq  401120 <strcmp@plt>
  405fd9:	85 c0                	test   %eax,%eax
  405fdb:	0f 84 dc fe ff ff    	je     405ebd <submitr+0x4dd>
  405fe1:	be 65 88 40 00       	mov    $0x408865,%esi
  405fe6:	48 89 ef             	mov    %rbp,%rdi
  405fe9:	e8 32 b1 ff ff       	callq  401120 <strcmp@plt>
  405fee:	85 c0                	test   %eax,%eax
  405ff0:	0f 84 c7 fe ff ff    	je     405ebd <submitr+0x4dd>
  405ff6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405ffb:	e9 bd fe ff ff       	jmpq   405ebd <submitr+0x4dd>
  406000:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  406007:	3a 20 43 
  40600a:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  406011:	20 75 6e 
  406014:	48 89 45 00          	mov    %rax,0x0(%rbp)
  406018:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  40601c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  406023:	74 6f 20 
  406026:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  40602d:	73 74 61 
  406030:	48 89 45 10          	mov    %rax,0x10(%rbp)
  406034:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  406038:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  40603f:	65 73 73 
  406042:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  406049:	72 6f 6d 
  40604c:	48 89 45 20          	mov    %rax,0x20(%rbp)
  406050:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  406054:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  40605b:	6c 74 20 
  40605e:	48 89 45 30          	mov    %rax,0x30(%rbp)
  406062:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  406069:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  40606f:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  406073:	89 df                	mov    %ebx,%edi
  406075:	e8 86 b0 ff ff       	callq  401100 <close@plt>
  40607a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40607f:	e9 39 fe ff ff       	jmpq   405ebd <submitr+0x4dd>
  406084:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  406089:	44 89 e2             	mov    %r12d,%edx
  40608c:	be 28 88 40 00       	mov    $0x408828,%esi
  406091:	48 89 ef             	mov    %rbp,%rdi
  406094:	b8 00 00 00 00       	mov    $0x0,%eax
  406099:	e8 82 b1 ff ff       	callq  401220 <sprintf@plt>
  40609e:	89 df                	mov    %ebx,%edi
  4060a0:	e8 5b b0 ff ff       	callq  401100 <close@plt>
  4060a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4060aa:	e9 0e fe ff ff       	jmpq   405ebd <submitr+0x4dd>

00000000004060af <init_timeout>:
  4060af:	85 ff                	test   %edi,%edi
  4060b1:	74 24                	je     4060d7 <init_timeout+0x28>
  4060b3:	53                   	push   %rbx
  4060b4:	89 fb                	mov    %edi,%ebx
  4060b6:	78 18                	js     4060d0 <init_timeout+0x21>
  4060b8:	be 89 57 40 00       	mov    $0x405789,%esi
  4060bd:	bf 0e 00 00 00       	mov    $0xe,%edi
  4060c2:	e8 69 b0 ff ff       	callq  401130 <signal@plt>
  4060c7:	89 df                	mov    %ebx,%edi
  4060c9:	e8 22 b0 ff ff       	callq  4010f0 <alarm@plt>
  4060ce:	5b                   	pop    %rbx
  4060cf:	c3                   	retq   
  4060d0:	bb 00 00 00 00       	mov    $0x0,%ebx
  4060d5:	eb e1                	jmp    4060b8 <init_timeout+0x9>
  4060d7:	c3                   	retq   

00000000004060d8 <init_driver>:
  4060d8:	55                   	push   %rbp
  4060d9:	53                   	push   %rbx
  4060da:	48 83 ec 08          	sub    $0x8,%rsp
  4060de:	48 89 fd             	mov    %rdi,%rbp
  4060e1:	be 01 00 00 00       	mov    $0x1,%esi
  4060e6:	bf 0d 00 00 00       	mov    $0xd,%edi
  4060eb:	e8 40 b0 ff ff       	callq  401130 <signal@plt>
  4060f0:	be 01 00 00 00       	mov    $0x1,%esi
  4060f5:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4060fa:	e8 31 b0 ff ff       	callq  401130 <signal@plt>
  4060ff:	be 01 00 00 00       	mov    $0x1,%esi
  406104:	bf 1d 00 00 00       	mov    $0x1d,%edi
  406109:	e8 22 b0 ff ff       	callq  401130 <signal@plt>
  40610e:	ba 00 00 00 00       	mov    $0x0,%edx
  406113:	be 01 00 00 00       	mov    $0x1,%esi
  406118:	bf 02 00 00 00       	mov    $0x2,%edi
  40611d:	e8 4e b1 ff ff       	callq  401270 <socket@plt>
  406122:	85 c0                	test   %eax,%eax
  406124:	0f 88 88 00 00 00    	js     4061b2 <init_driver+0xda>
  40612a:	89 c3                	mov    %eax,%ebx
  40612c:	bf b5 73 40 00       	mov    $0x4073b5,%edi
  406131:	e8 0a b0 ff ff       	callq  401140 <gethostbyname@plt>
  406136:	48 85 c0             	test   %rax,%rax
  406139:	0f 84 bf 00 00 00    	je     4061fe <init_driver+0x126>
  40613f:	48 c7 05 06 65 00 00 	movq   $0x0,0x6506(%rip)        # 40c650 <serveraddr>
  406146:	00 00 00 00 
  40614a:	48 c7 05 03 65 00 00 	movq   $0x0,0x6503(%rip)        # 40c658 <serveraddr+0x8>
  406151:	00 00 00 00 
  406155:	66 c7 05 f2 64 00 00 	movw   $0x2,0x64f2(%rip)        # 40c650 <serveraddr>
  40615c:	02 00 
  40615e:	48 8b 48 18          	mov    0x18(%rax),%rcx
  406162:	48 63 50 14          	movslq 0x14(%rax),%rdx
  406166:	48 8b 31             	mov    (%rcx),%rsi
  406169:	bf 54 c6 40 00       	mov    $0x40c654,%edi
  40616e:	e8 4d b0 ff ff       	callq  4011c0 <memmove@plt>
  406173:	66 c7 05 d6 64 00 00 	movw   $0x9b3c,0x64d6(%rip)        # 40c652 <serveraddr+0x2>
  40617a:	3c 9b 
  40617c:	ba 10 00 00 00       	mov    $0x10,%edx
  406181:	be 50 c6 40 00       	mov    $0x40c650,%esi
  406186:	89 df                	mov    %ebx,%edi
  406188:	e8 b3 b0 ff ff       	callq  401240 <connect@plt>
  40618d:	85 c0                	test   %eax,%eax
  40618f:	0f 88 d1 00 00 00    	js     406266 <init_driver+0x18e>
  406195:	89 df                	mov    %ebx,%edi
  406197:	e8 64 af ff ff       	callq  401100 <close@plt>
  40619c:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4061a2:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4061a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4061ab:	48 83 c4 08          	add    $0x8,%rsp
  4061af:	5b                   	pop    %rbx
  4061b0:	5d                   	pop    %rbp
  4061b1:	c3                   	retq   
  4061b2:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4061b9:	3a 20 43 
  4061bc:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  4061c3:	20 75 6e 
  4061c6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4061ca:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4061ce:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4061d5:	74 6f 20 
  4061d8:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  4061df:	65 20 73 
  4061e2:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4061e6:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4061ea:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  4061f1:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  4061f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4061fc:	eb ad                	jmp    4061ab <init_driver+0xd3>
  4061fe:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  406205:	3a 20 44 
  406208:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  40620f:	20 75 6e 
  406212:	48 89 45 00          	mov    %rax,0x0(%rbp)
  406216:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  40621a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  406221:	74 6f 20 
  406224:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  40622b:	76 65 20 
  40622e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  406232:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  406236:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  40623d:	72 20 61 
  406240:	48 89 45 20          	mov    %rax,0x20(%rbp)
  406244:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  40624b:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  406251:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  406255:	89 df                	mov    %ebx,%edi
  406257:	e8 a4 ae ff ff       	callq  401100 <close@plt>
  40625c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  406261:	e9 45 ff ff ff       	jmpq   4061ab <init_driver+0xd3>
  406266:	48 b8 61 6c 6c 65 6d 	movabs $0x6e67616d656c6c61,%rax
  40626d:	61 67 6e 
  406270:	48 ba 65 2e 70 6f 6c 	movabs $0x6574796c6f702e65,%rdx
  406277:	79 74 65 
  40627a:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40627e:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  406282:	48 b8 63 68 6e 69 71 	movabs $0x2e657571696e6863,%rax
  406289:	75 65 2e 
  40628c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  406290:	66 c7 45 18 66 72    	movw   $0x7266,0x18(%rbp)
  406296:	c6 45 1a 00          	movb   $0x0,0x1a(%rbp)
  40629a:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4062a1:	3a 20 55 
  4062a4:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  4062ab:	20 74 6f 
  4062ae:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4062b2:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4062b6:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4062bd:	65 63 74 
  4062c0:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  4062c7:	65 72 76 
  4062ca:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4062ce:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4062d2:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  4062d8:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  4062dc:	89 df                	mov    %ebx,%edi
  4062de:	e8 1d ae ff ff       	callq  401100 <close@plt>
  4062e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4062e8:	e9 be fe ff ff       	jmpq   4061ab <init_driver+0xd3>

00000000004062ed <driver_post>:
  4062ed:	53                   	push   %rbx
  4062ee:	4c 89 cb             	mov    %r9,%rbx
  4062f1:	45 85 c0             	test   %r8d,%r8d
  4062f4:	75 18                	jne    40630e <driver_post+0x21>
  4062f6:	48 85 ff             	test   %rdi,%rdi
  4062f9:	74 05                	je     406300 <driver_post+0x13>
  4062fb:	80 3f 00             	cmpb   $0x0,(%rdi)
  4062fe:	75 30                	jne    406330 <driver_post+0x43>
  406300:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  406305:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  406309:	44 89 c0             	mov    %r8d,%eax
  40630c:	5b                   	pop    %rbx
  40630d:	c3                   	retq   
  40630e:	48 89 ce             	mov    %rcx,%rsi
  406311:	bf 68 88 40 00       	mov    $0x408868,%edi
  406316:	b8 00 00 00 00       	mov    $0x0,%eax
  40631b:	e8 b0 ad ff ff       	callq  4010d0 <printf@plt>
  406320:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  406325:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  406329:	b8 00 00 00 00       	mov    $0x0,%eax
  40632e:	eb dc                	jmp    40630c <driver_post+0x1f>
  406330:	48 83 ec 08          	sub    $0x8,%rsp
  406334:	41 51                	push   %r9
  406336:	49 89 c9             	mov    %rcx,%r9
  406339:	49 89 d0             	mov    %rdx,%r8
  40633c:	48 89 f9             	mov    %rdi,%rcx
  40633f:	48 89 f2             	mov    %rsi,%rdx
  406342:	be 9b 3c 00 00       	mov    $0x3c9b,%esi
  406347:	bf b5 73 40 00       	mov    $0x4073b5,%edi
  40634c:	e8 8f f6 ff ff       	callq  4059e0 <submitr>
  406351:	48 83 c4 10          	add    $0x10,%rsp
  406355:	eb b5                	jmp    40630c <driver_post+0x1f>

0000000000406357 <check>:
  406357:	89 f8                	mov    %edi,%eax
  406359:	c1 e8 1c             	shr    $0x1c,%eax
  40635c:	74 1d                	je     40637b <check+0x24>
  40635e:	b9 00 00 00 00       	mov    $0x0,%ecx
  406363:	83 f9 1f             	cmp    $0x1f,%ecx
  406366:	7f 0d                	jg     406375 <check+0x1e>
  406368:	89 f8                	mov    %edi,%eax
  40636a:	d3 e8                	shr    %cl,%eax
  40636c:	3c 0a                	cmp    $0xa,%al
  40636e:	74 11                	je     406381 <check+0x2a>
  406370:	83 c1 08             	add    $0x8,%ecx
  406373:	eb ee                	jmp    406363 <check+0xc>
  406375:	b8 01 00 00 00       	mov    $0x1,%eax
  40637a:	c3                   	retq   
  40637b:	b8 00 00 00 00       	mov    $0x0,%eax
  406380:	c3                   	retq   
  406381:	b8 00 00 00 00       	mov    $0x0,%eax
  406386:	c3                   	retq   

0000000000406387 <gencookie>:
  406387:	53                   	push   %rbx
  406388:	83 c7 01             	add    $0x1,%edi
  40638b:	e8 c0 ac ff ff       	callq  401050 <srandom@plt>
  406390:	e8 0b ae ff ff       	callq  4011a0 <random@plt>
  406395:	89 c3                	mov    %eax,%ebx
  406397:	89 c7                	mov    %eax,%edi
  406399:	e8 b9 ff ff ff       	callq  406357 <check>
  40639e:	85 c0                	test   %eax,%eax
  4063a0:	74 ee                	je     406390 <gencookie+0x9>
  4063a2:	89 d8                	mov    %ebx,%eax
  4063a4:	5b                   	pop    %rbx
  4063a5:	c3                   	retq   

Disassembly of section .fini:

00000000004063a8 <_fini>:
  4063a8:	f3 0f 1e fa          	endbr64 
  4063ac:	48 83 ec 08          	sub    $0x8,%rsp
  4063b0:	48 83 c4 08          	add    $0x8,%rsp
  4063b4:	c3                   	retq   
