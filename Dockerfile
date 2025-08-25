FROM alpine:3.21

# LABEL about this image
LABEL org.opencontainers.image.title="SaxonCmd"
LABEL org.opencontainers.image.description="Dockerimage for exeturing xQuery and XSLT scripts with SaxonCmd"
LABEL org.opencontainers.image.revision="1.0.0"
LABEL org.opencontainers.image.licenses="GNU GPLv3"
LABEL org.opencontainers.image.authors="Silke Reich https://github.com/Diginaut"
LABEL org.opencontainers.image.ref.name="diginaut_saxon-cmd_1.0.0"
LABEL org.opencontainers.image.base.name="alpine:3.21"
LABEL org.opencontainers.image.documentation="https://github.com/diginaut/saxon-cmd"
LABEL org.opencontainers.image.source="https://github.com/diginaut/saxon-cmd"
LABEL org.opencontainers.image.url="https://github.com/diginaut/saxon-cmd"
LABEL org.opencontainers.image.version=""

RUN apk add --no-cache openjdk11 \
    && apk add --no-cache unzip \
    && apk add --no-cache bash

ADD https://github.com/Saxonica/Saxon-HE/releases/download/SaxonHE12-5/SaxonHE12-5J.zip .
RUN unzip SaxonHE12-5J.zip -d /opt/saxon 
RUN rm SaxonHE12-5J.zip

# Add a script to handle the mode logic
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Serve XSLT
RUN echo '#!/bin/bash\njava -cp /opt/saxon/saxon-he-12.5.jar net.sf.saxon.Transform "$@"' > /usr/local/bin/xslt \
    && chmod +x /usr/local/bin/xslt

# Serve XQuery
RUN echo '#!/bin/bash\njava -cp /opt/saxon/saxon-he-12.5.jar net.sf.saxon.Query "$@"' > /usr/local/bin/xquery \
    && chmod +x /usr/local/bin/xquery

# Use the script as the entrypoint
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]