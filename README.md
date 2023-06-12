# docker-ffmpeg

Docker container which uses ffmpeg to pull a video stream url and creates an mp4 recording which is stored in a AWS S3 bucket.

## Build image

```bash
docker build -t samderdritte/docker-ffmpeg .
```

## Run
```bash
docker run \
    -e INPUT_STREAM_URL='your-video-stream-url' \
    -e TIMECODE_START_TIME='start-time-for-timecode' \
    -e OUTPUT_FILE_NAME='output.mp4' \
    -e OUTPUT_S3_PATH='s3-bucket-path' \
    -e AWS_REGION='europe-central-1' \
    -e AWS_ACCESS_KEY_ID='XXXXXXXXXXXX' \
    -e AWS_SECRET_ACCESS_KEY='XXXXXXXXXXXX' \
    -e AWS_SESSION_TOKEN='XXXXXXXXXXXX' \
    samderdritte/docker-ffmpeg
```
After running the above command, the file `output.mp4` will be created in the designated S3 bucket.

Input stream URL can be a .m3u8 stream with start/end parameters, e.g.:
`https://xxxxx.cloudfront.net/out/v1/yyyyyyyy/index.m3u8?start=2023-01-01T13:00:01+02:00&end=2023-01-01T13:30:00+02:00`
