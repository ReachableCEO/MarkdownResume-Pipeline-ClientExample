# MarkdownResume-Pipeline-ClientExample

Example repository for using the MarkdownResume-Pipeline vendored repository 

## Quickstart

I recommend doing these steps in order for efficency.

- Edit build/build-pipeline-client.sh and alter the top section to refelct your information.
- Edit Templates/WorkHistory/WorkHistory.csv
- Create Templates/JobHistoryDetails/<position>.md to match the value in the first field of WorkHistory.csv
- Edit SkillsAndProjects/Projects.md
- Edit SkillsAndProjects/Skills.csv
- Edit Templates/CandidateInfoSheet.md
- cd to the build directory and bash build-pipeline-client.sh
