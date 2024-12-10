#!/bin/bash

# A wrapper script around ../vendor/git.knownelement.com/reachableceo/MarkdownResume-Pipeline/build/build.sh

########################
# Contact info
########################

export CandidateName="First Middle Last"
export CandidatePhone="1 123 456 7890"
export CandidateLocation="Place 1/Place 2"
export CandidateEmail="candidate@domain.com"

########################
# Profile information
########################

export CandidateOneLineSummary="Super awesome and stuff."
export CandidateLinkedin="https://www.linkedin.com/"
export CandidateGithub="https://www.github.com/"
export CandidateTagline="Your.Tagline.Here."

########################
# Formatting options
########################

export CandidateLogo=""
export SourceCode="https://git.knownelement.com/reachableceo/MarkdownResume-Pipeline"
export URLCOLOR="blue"
export PAGEBACKGROUND="./background3.pdf"

##########################
# Candidate info sheet
##########################

export CandidatePreferredContactMethod="Email will get the fastest response."
export CandidateWorkAuthorization="US Citizen"
export CandidateEmploymentStatus="Not currently employed"
export CandidateCurrentLocation="City,State,Country etc"
export CandidateCurrentTimezone="Timezone"
export CandidateWorkableTimezones="Timezones"
export CandidateInterviewAvailability="Sometime"
export CandidateStartAvailability="Sometime"
export CandidateHighestEducation="Some education level"
export CandidateGraduationYear="Graduation year"
export CandidateSchoolName="School name"
export CandidateSchoolLocation="School location"
export CandidateLastProject="Last project"
export CandidateDOB="MM/DD"
export CandidateTotalExperience="epoch"


########################
#Compensation targets
########################

export CandidateRelocationNetMinimumAmount="1,987.11"

export CandidateRateSheetRemoteW2HourlyMinimum="\$12.34"
export CandidateRateSheetRemoteW2AnnualMinimum="\$123,456.00"
export CandidateRateSheetRemote1099HourlyMinimum="\$56.78"

export CandidateRateSheetRemoteW2HourlyPrefer="\$34.56"
export CandidateRateSheetRemoteW2AnnualPrefer="\$321,987.00"
export CandidateRateSheetRemote1099HourlyPrefer="\$78.90"

export PipelineClientWorkingDir="Full path to the client local directory"

####################################################
#DO NOT CHANGE ANYTHING BELOW THIS LINE
####################################################

##################################################################
# Setup globals for use by the build-pipeline-server.sh script
##################################################################


readonly MO_PATH="bash ../vendor/git.knownelement.com/ExternalVendorCode/mo/mo"
readonly BUILD_OUTPUT_DIR="$PipelineClientWorkingDir/build-output"
readonly BUILD_TEMP_DIR="$PipelineClientWorkingDir/build-temp"
readonly BUILDYAML_JOBBOARD="$BUILD_TEMP_DIR/JobBoard.yml"
readonly BUILDYAML_CLIENTSUBMISSION="$BUILD_TEMP_DIR/ClientSubmission.yml"
readonly BUILDYAML_CANDIDATEINFOSHEET="$BUILD_TEMP_DIR/CandidateInfoSheet.yml"

CandidateInfoSheetMarkdownOutputFile="$BUILD_OUTPUT_DIR/CandidateInfoSheet.md"
CandidateInfoSheetPDFOutputFIle="$BUILD_OUTPUT_DIR/CandidateInfoSheet.pdf"

JobBoardMarkdownOutputFile="$BUILD_OUTPUT_DIR/job-board/Resume.md"
JobBoardPDFOutputFile="$BUILD_OUTPUT_DIR/job-board/Resume.pdf"
JobBoardMSWordOutputFile="$BUILD_OUTPUT_DIR/job-board/Resume.doc"

ClientSubmissionMarkdownOutputFile="$BUILD_OUTPUT_DIR/client-submission/Resume.md"
ClientSubmissionPDFOutputFile="$BUILD_OUTPUT_DIR/client-submission//Resume.pdf"
ClientSubmissionMSWordOutputFile="$BUILD_OUTPUT_DIR/client-submission/Resume.doc"

# Call the build-pipeline-server in the vendored repository to produce output artifacts

../vendor/git.knownelement.com/reachableceo/MarkdownResume-Pipeline/build/build-pipeline-server.sh
