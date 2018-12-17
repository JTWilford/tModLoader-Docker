FROM ubuntu:14.04.4
RUN apt-get update && apt-get dist-upgrade -y
RUN apt install -y screen

WORKDIR /root
COPY server ./Terraria
RUN chmod +x ./Terraria/tModLoaderServer*

COPY mods ./.local/share/Terraria/ModLoader/Mods
COPY serverconfig.txt ./Terraria/serverconfig.txt

WORKDIR ./Terraria
#CMD screen -dmS terraria './tModLoaderServer -config ./serverconfig.txt'
CMD ./tModLoaderServer -config ./serverconfig.txt