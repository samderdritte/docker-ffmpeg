FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install ffmpeg python-dev python-pip -y && \
    apt-get clean

RUN pip install awscli

WORKDIR /tmp/workdir

COPY copy_output.sh /tmp/workdir

RUN ["chmod", "+x", "/tmp/workdir/upload_output.sh"]

ENTRYPOINT ffmpeg -i ${INPUT_STREAM_URL} -map 0:v:1 -map 0:a:0 -map "0:a:1?" -map "0:a:2?" -map "0:a:3?" -c copy -timecode ${TIMECODE_START_TIME} -bsf:a aac_adtstoasc ${OUTPUT_FILE_NAME} && ./upload_output.sh