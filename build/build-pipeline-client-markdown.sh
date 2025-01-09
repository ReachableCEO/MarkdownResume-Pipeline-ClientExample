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

# Define paths using Docker volumes with default fallbacks
export INPUT_DIR="${ResumeInputDir:-/Resume-Input}"                            # Input directory
export OUTPUT_DIR="${ResumeOutputDir:-/Resume-Output}"                         # Output directory
export TEMP_DIR="${BuildTempDir:-$OUTPUT_DIR/Temp}"                            # Temporary files directory
export FINAL_DIR="${FinalDir:-$OUTPUT_DIR/Final}"                              # Final output directory
export CANDIDATE_INFO_DIR="${CandidateInfoDir:-$FINAL_DIR/candidate-info-sheet}" # Candidate info sheet directory
export CLIENT_VERSION_DIR="${ClientVersionDir:-$FINAL_DIR/client-version}"     # Client version directory
export JOB_BOARD_VERSION_DIR="${JobBoardVersionDir:-$FINAL_DIR/job-board-version}" # Job board version directory

# Create necessary directories
echo "Setting up directories..."
mkdir -p "$TEMP_DIR" \
         "$CANDIDATE_INFO_DIR" \
         "$CLIENT_VERSION_DIR" \
         "$JOB_BOARD_VERSION_DIR"

# Clean up from previous runs
echo "Cleaning up from previous runs..."
rm -v -f "$TEMP_DIR/JobBoard.yml" || true
rm -v -f "$TEMP_DIR/ClientSubmission.yml" || true
rm -v -f "$TEMP_DIR/CandidateInfoSheet.yml" || true
rm -v -f "$CANDIDATE_INFO_DIR/CandidateInfoSheet.md" || true
rm -v -f "$CANDIDATE_INFO_DIR/CandidateInfoSheet.pdf" || true
rm -v -f "$JOB_BOARD_VERSION_DIR/Candidate-Resume.md" || true
rm -v -f "$JOB_BOARD_VERSION_DIR/Candidate-Resume.pdf" || true
rm -v -f "$JOB_BOARD_VERSION_DIR/Candidate-Resume.doc" || true
rm -v -f "$CLIENT_VERSION_DIR/Candidate-Resume.md" || true
rm -v -f "$CLIENT_VERSION_DIR/Candidate-Resume.pdf" || true
rm -v -f "$CLIENT_VERSION_DIR/Candidate-Resume.doc" || true

# Run the pipeline server script
echo "Running the pipeline server script..."
/app/vendor/MarkdownResume-Pipeline/build/build-pipeline-server-markdown.sh