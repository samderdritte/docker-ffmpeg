#!/usr/bin/env bash

echo "Uploading ${OUTPUT_FILE_NAME} to S3 at ${OUTPUT_S3_PATH}/${OUTPUT_FILE_NAME} ..."
aws s3 cp ./${OUTPUT_FILE_NAME} s3://${OUTPUT_S3_PATH}/${OUTPUT_FILE_NAME} --region ${AWS_REGION}