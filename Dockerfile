FROM centos:7 
MAINTAINER kishan khatrani  <kkpkishan@gmail.com>
RUN curl --silent --location https://rpm.nodesource.com/setup_12.x  | bash -
RUN yum install epel-release yum-utils -y
RUN yum install nodejs git -y
#WORKDIR "/angular"
#COPY ./source/ /angular/ 
RUN npm install -g @angular/cli 
RUN ng new angulardockerproject
RUN cd angulardockerproject
RUN npm install
RUN npm install -g pm2
RUN npm run build
EXPOSE 443
CMD ["pm2-runtime", "./dist/index.js"]
