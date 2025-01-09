docker run --rm \
  -v "./env/ResumeVariables.env:/env/ResumeVariables.env:ro" \
  -v "./Resume-Input:/Resume-Input" \
  -v "./Resume-Output:/Resume-Output" \
  markdown-pipeline-client:latest