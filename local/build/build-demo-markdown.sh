#!/usr/bin/env bash

set -x

# This is a demo script for the MarkdownResumePipeline server
# This script creates PDF/MSWord output from markdown/csv input


############################################
#Edit this file to reflect your information
############################################

source "./CandidateVariables.env"

####################################################
####################################################
####################################################
#DO NOT CHANGE ANYTHING BELOW THIS LINE
####################################################
####################################################
####################################################

######################################################################################
# Setup key variables that will be used by the build-pipeline-server-markdown.sh script
######################################################################################

readonly MO_PATH="bash ../../vendor/git.knownelement.com/ExternalVendorCode/mo/mo"
readonly BUILD_OUTPUT_DIR="../build-output/MarkdownResume"
readonly BUILD_TEMP_DIR="../build-temp/MarkdownResume"
readonly BUILDYAML_JOBBOARD="$BUILD_TEMP_DIR/JobBoard.yml"
readonly BUILDYAML_CLIENTSUBMISSION="$BUILD_TEMP_DIR/ClientSubmission.yml"
readonly BUILDYAML_CANDIDATEINFOSHEET="$BUILD_TEMP_DIR/CandidateInfoSheet.yml"

CandidateInfoSheetMarkdownOutputFile="$BUILD_OUTPUT_DIR/CandidateInfoSheet.md"
CandidateInfoSheetPDFOutputFIle="$BUILD_OUTPUT_DIR/CandidateInfoSheet.pdf"

JobBoardMarkdownOutputFile="$BUILD_OUTPUT_DIR/job-board/Resume.md"
JobBoardPDFOutputFile="$BUILD_OUTPUT_DIR//job-board/Resume.pdf"
JobBoardMSWordOutputFile="$BUILD_OUTPUT_DIR/job-board/Resume.doc"

ClientSubmissionMarkdownOutputFile="$BUILD_OUTPUT_DIR/client-submission/Resume.md"
ClientSubmissionPDFOutputFile="$BUILD_OUTPUT_DIR/client-submission//Resume.pdf"
ClientSubmissionMSWordOutputFile="$BUILD_OUTPUT_DIR/client-submission/Resume.doc"

echo "Cleaning up from previous runs..."

rm $BUILDYAML_CANDIDATEINFOSHEET
rm $CandidateInfoSheetMarkdownOutputFile
rm $CandidateInfoSheetPDFOutputFIle

rm $BUILDYAML_JOBBOARD
rm $JobBoardMarkdownOutputFile
rm $JobBoardPDFOutputFile
rm $JobBoardMSWordOutputFile

rm $BUILDYAML_CLIENTSUBMISSION
rm $ClientSubmissionMarkdownOutputFile
rm $ClientSubmissionPDFOutputFile
rm $ClientSubmissionMSWordOutputFile

bash ../../vendor/git.knownelement.com/reachableceo/MarkdownResume-Pipeline/build/build-pipeline-server-markdown.sh  