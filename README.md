# MarkdownResume-Pipeline-ClientExample

Example client repository for using the [MarkdownResume-Pipeline](https://git.knownelement.com/reachableceo/MarkdownResume-Pipeline) vendored repository.

## Quickstart

I recommend doing these steps in order for efficency.

- Edit local/build/build-resume.sh and edit the values in the top section to refelct your information.
- Edit local/Templates/WorkHistory/WorkHistory.csv
- Create local/Templates/JobHistoryDetails/<position>.md to match the value in the first field of WorkHistory.csv
- Edit local/Templates/SkillsAndProjects/Projects.md
- Edit local/Template/SkillsAndProjects/Skills.csv
- Edit local/Templates/CandidateInfoSheet.md
- cd to the local/build directory and run bash build-resume.sh
