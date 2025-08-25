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

RUN apk add --no-cache openjdk11 unzip bash

ADD https://github.com/Saxonica/Saxon-HE/releases/download/SaxonHE12-5/SaxonHE12-5J.zip .
RUN unzip SaxonHE12-5J.zip -d /opt/saxon && rm SaxonHE12-5J.zip

# Serve XSLT and XQuery in one RUN command
RUN printf '#!/bin/sh\njava -cp /opt/saxon/saxon-he-12.5.jar net.sf.saxon.Transform "$@"\n' > /usr/local/bin/xslt && \
    printf '#!/bin/sh\njava -cp /opt/saxon/saxon-he-12.5.jar net.sf.saxon.Query "$@"\n' > /usr/local/bin/xquery && \
    chmod +x /usr/local/bin/xslt /usr/local/bin/xquery

CMD ["/bin/sh"]