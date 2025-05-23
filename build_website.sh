#!/bin/bash

set -e

cd slides
npm install
npx playwright install-deps
rm -rf ../website/static/slides
echo Building Slides for ACS CC
SLIDES_OUTPUT_FOLDER=../website/static/slides FAKE_SLIDES=pm_cc ./build.sh acs_cc 
echo Building Slides for FILS English
SLIDES_OUTPUT_FOLDER=../website/static/slides FAKE_SLIDES=ma ./build.sh fils_en

cd ..
cd website
npm install
npm run clear
npm run build
