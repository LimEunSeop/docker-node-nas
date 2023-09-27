# docker-node-nas

## Introduction

This project has made for people who wanna let SSH Server of the docker-node enabled.
Due to the Dockerfile can't be used at the Container Station of NAS, It's needed for you to push custom docker image from your PC to the DockerHub and pull it to your NAS.
Maintaining it as long as I don't throw away my NAS, you can follow me with no worries.

## How to use it

Writing...

- 오로지 배포를 위한 SSH 서비스가 구동되었습니다. 외부에서의 SSH는 불가하며, 서버 조작이 필요하신 경우 NAS 윈도우에 직접 접속한 후 접근 바랍니다.
- 주의사항: Dockerfile 속에 Root 계정 정보가 노출돼있고, 키 방식이 아닌 아이디 비밀번호 입력 방식 SSH 로그인을 사용합니다. 이는 NAS의 한계 상 최대한 컨피그를 NAS 환경에 담아두기 위함이며, 꼭 NAS 속 폐쇄된 네트워크에서 사용해야 합니다. 외부 호스팅 시 reverse proxy 사용을 적극 권장드립니다.
