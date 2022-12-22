#!/bin/bash
aws s3 sync pecosdump/ s3://viquity-database-import-us-east-1/Jobs/pecos/pecosarchive/pecosdump-"$(date +%d-%m-%y-%H-%M)"/
