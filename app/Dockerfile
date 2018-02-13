FROM openjdk:8-jre
#FROM openjdk:8-jre-alpine
# ^ doesn't work as ArchiveEngine needs glibc. Error shows up like this:
#   /bin/sh: ./engine/ArchiveEngine: not found

## Files from https://ics-web.sns.ornl.gov/css/updates/apps/?C=N;O=A
## wget https://ics-web.sns.ornl.gov/css/updates/apps/archive-engine-4.1.0-linux.gtk.x86_64.zip
## echo "b156ff7d9fefd4d087b69af453264599523a85c3cfa3a9b037d655cf1580d9b6 archive-engine-4.1.0-linux.gtk.x86_64.zip" | sha256sum -c -
## wget https://ics-web.sns.ornl.gov/css/updates/apps/archive-config-4.1.0-linux.gtk.x86_64.zip
## echo "602f767bcedb425306a899fa69cbbb6ace555e23587d3c172c26b58d7cff1982 archive-config-4.1.0-linux.gtk.x86_64.zip" | sha256sum -c -

RUN set -ex \
 && apt-get update \
 && apt-get install -y postgresql-client

WORKDIR /archiver
COPY archive-config-4.1.0-linux.gtk.x86_64.zip /archiver/
COPY archive-engine-4.1.0-linux.gtk.x86_64.zip /archiver/

RUN set -ex \
 && unzip -q archive-config-4.1.0-linux.gtk.x86_64.zip && \
    unzip -q archive-engine-4.1.0-linux.gtk.x86_64.zip \
 && rm archive-config-4.1.0-linux.gtk.x86_64.zip && \
    rm archive-engine-4.1.0-linux.gtk.x86_64.zip \
 && mv archive-engine-4.1.0 engine && \
    mv archive-config-4.1.0 config

COPY dcs_engine.xml /archiver
COPY pluginCustomization.ini /archiver
COPY engineconfig.dtd /archiver

ENV engine_name=CBMMVDArchiveEngine \
    engine_description=CBM-MVD_Archiver \
    pluginCustomization=/archiver/pluginCustomization.ini \
    engine_port=4812 \
    engine_configuration_file=dcs_engine.xml \
    engine_replace=-replace_engine \
    engine_steal_channels=-steal_channels

RUN mkdir ./workspace

#CMD ./engine/ArchiveEngine -pluginCustomization ${pluginCustomization} -engine ${engine_name} -port ${engine_port} -data /archiver/workspace
CMD ./engine/ArchiveEngine -pluginCustomization ${pluginCustomization} -engine ${engine_name} -port ${engine_port}
