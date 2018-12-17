FROM ubuntu:14.04.4
RUN apt-get update && apt-get dist-upgrade -y
RUN apt install -y unzip

ENV TERRARIA_VERSION=1353 TERRARIA_ZIP=terraria-server.zip TMODLOADER_VERSION=v0.10.1.5 TMODLOADER_ZIP=tmodloader.zip

WORKDIR /root/

ADD http://terraria.org/server/terraria-server-${TERRARIA_VERSION}.zip ${TERRARIA_ZIP}

RUN unzip $TERRARIA_ZIP 'Terraria/*' \
  && rm $TERRARIA_ZIP

ADD https://github.com/blushiemagic/tModLoader/releases/download/v0.10.1.3/tModLoader.Linux.${TMODLOADER_VERSION}}.zip ${TMODLOADER_ZIP}

RUN unzip $TMODLOADER_ZIP -d Terraria/ \
  && rm $TMODLOADER_ZIP \
  && chmod -R a+rw ./Terraria/* \
  && chmod a+x ./Terraria/TerrariaServer* \
  && chmod a+x ./Terraria/tModLoaderServer*

COPY mods ./Terraria/Terraria/ModLoader/Mods
COPY serverconfig.txt ./Terraria/serverconfig.txt

WORKDIR ./Terraria
#CMD screen -dmS terraria './tModLoaderServer -config ./serverconfig.txt'
CMD ./tModLoaderServer -config ./serverconfig.txt