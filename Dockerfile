#
#  Dockerfile for a GPDB Base Image - Segment Node
#  

FROM centos:7
MAINTAINER david.harris@bramhalldata.com

COPY * /tmp/

RUN echo root:pivotal | chpasswd \
	&& yum install -y unzip which more ed wget openssh-clients ntp; yum clean all \
	&& cat /tmp/sysctl.conf.add >> /etc/sysctl.conf \
        && cat /tmp/limits.conf.add >> /etc/security/limits.conf \
	&& rm -f /tmp/*.add
     

EXPOSE 5432

VOLUME /gpdata
