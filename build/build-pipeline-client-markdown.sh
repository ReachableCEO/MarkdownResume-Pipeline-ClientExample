#!/usr/bin/env bash

# Enable bash strict mode
set -euo pipefail
IFS=$'\n\t'

# Check if the environment variables file exists
ENV_FILE="/env/CandidateVariables.env"
if [[ ! -f "$ENV_FILE" ]]; then
  echo "Error: Environment variables file not found at $ENV_FILE"
  exit 1
fi

# Load environment variables
source "$ENV_FILE"

# Set up key variables for the build-pipeline-server-markdown.sh script
export MO_PATH="/app/vendor/mo/mo"
export BUILD_TEMP_DIR="/app/build-temp/MarkdownResume"
export BUILD_OUTPUT_DIR="/app/build-output/MarkdownResume"
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

# Clean up from previous runs
echo "Cleaning up from previous runs..."
rm -v -f "$BUILDYAML_CANDIDATEINFOSHEET" || true
rm -v -f "$CandidateInfoSheetMarkdownOutputFile" || true
rm -v -f "$CandidateInfoSheetPDFOutputFile" || true
rm -v -f "$JobBoardMarkdownOutputFile" || true
rm -v -f "$JobBoardPDFOutputFile" || true
rm -v -f "$JobBoardMSWordOutputFile" || true
rm -v -f "$ClientSubmissionMarkdownOutputFile" || true
rm -v -f "$ClientSubmissionPDFOutputFile" || true
rm -v -f "$ClientSubmissionMSWordOutputFile" || true

# Create necessary directories
echo "Setting up directories..."
mkdir -p "$BUILD_TEMP_DIR" "$BUILD_OUTPUT_DIR/recruiter" "$BUILD_OUTPUT_DIR/job-board" "$BUILD_OUTPUT_DIR/client-submit"

# Run the pipeline server script
echo "Running the pipeline server script..."
/app/vendor/MarkdownResume-Pipeline/build/build-pipeline-server-markdown.sh
