#!/usr/bin/env bash


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

export MO_PATH="bash ../../vendor/git.knownelement.com/ExternalVendorCode/mo/mo"

export BUILD_TEMP_DIR="$PipelineClientWorkingDir/build-temp/MarkdownResume"
export BUILD_OUTPUT_DIR="$PipelineClientWorkingDir/build-output/MarkdownResume"

export BUILDYAML_JOBBOARD="$BUILD_TEMP_DIR/JobBoard.yml"
export BUILDYAML_CLIENTSUBMISSION="$BUILD_TEMP_DIR/ClientSubmission.yml"
export BUILDYAML_CANDIDATEINFOSHEET="$BUILD_TEMP_DIR/CandidateInfoSheet.yml"

export CandidateInfoSheetMarkdownOutputFile="$BUILD_OUTPUT_DIR/recruiter/CandidateInfoSheet.md"
export CandidateInfoSheetPDFOutputFile="$BUILD_OUTPUT_DIR/recruiter/CandidateInfoSheet.pdf"

export JobBoardMarkdownOutputFile="$BUILD_OUTPUT_DIR/job-board/Candidate-Resume.md"
export JobBoardPDFOutputFile="$BUILD_OUTPUT_DIR/job-board/Candidate-Resume.pdf"
export JobBoardMSWordOutputFile="$BUILD_OUTPUT_DIR/job-board/Candidate-Resume.doc"

export ClientSubmissionMarkdownOutputFile="$BUILD_OUTPUT_DIR/client-submit/Candidate-Resume.md"
export ClientSubmissionPDFOutputFile="$BUILD_OUTPUT_DIR/client-submit/Candidate-Resume.pdf"
export ClientSubmissionMSWordOutputFile="$BUILD_OUTPUT_DIR/client-submit/Candidate-Resume.doc"

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